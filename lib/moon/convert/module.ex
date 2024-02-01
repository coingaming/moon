defmodule Moon.Convert.Module do
  @moduledoc "Functions for converting AST surface -> live_view"

  require Logger

  def translate_render(%{component_type: Surface.LiveComponent}, ast), do: ast

  def translate_render(
        %{component_type: Surface.Component, short: short},
        {:def, m1, [{:render, m2, attrs} | children]}
      ) do
    {:def, m1, [{:"#{Macro.underscore(short)}", m2, attrs} | children]}
  end

  def translate_prop(_, {:prop, meta, [{name, _, nil}, :event]}, doc),
    do: {:attr, meta, [name, Event, translate_prop_options([], doc)]}

  # translate {:prop, [line: 21], [{:step, [line: 21], nil}, :integer, [default: 1]]}
  # to {:attr, [line: 38], [:id, :string, [required: true]]}
  def translate_prop(_, {macro_name, meta, [{name, _, nil}, type]}, doc)
      when macro_name in [:prop, :data],
      do: {:attr, meta, [name, translate_prop_type(type), translate_prop_options([], doc)]}

  def translate_prop(_, {macro_name, meta, [{name, _, nil}, type, options]}, doc)
      when macro_name in [:prop, :data],
      do:
        {:attr, meta,
         [
           name,
           translate_prop_type(type),
           translate_prop_options(options, doc)
         ]}

  def translate_prop_type(type)
      when type in [:boolean, :integer, :float, :string, :atom, :list, :map, :global],
      do: type

  def translate_prop_type(_), do: :any

  def translate_prop_options(options, doc) do
    (options
     |> Enum.map(fn
       {:values!, v} ->
         {:values, v}

       {:from_context, _v} ->
         Logger.warning("Attribute is taken from_context")
         dbg(options)
         nil

       {k, v} when k in [:required, :default, :values, :examples] ->
         {k, v}
     end)
     |> Enum.filter(&(!!&1))) ++
      ((doc && [doc: doc]) || []) ++
      (((Keyword.has_key?(options, :default) || Keyword.has_key?(options, :required)) && []) ||
         [default: nil])
  end

  def translate_slot(_, {:slot, meta, [{:default, _, nil}]}, doc),
    do: {:slot, meta, [:inner_block, (doc && [doc: doc]) || []]}

  def translate_slot(_, {:slot, meta, [{name, _, nil}]}, doc),
    do: {:slot, meta, [name, (doc && [doc: doc]) || []]}

  def translate_slot(_, {:slot, meta, [{:default, _, nil}, options]}, doc),
    do: {:slot, meta, [:inner_block, options ++ ((doc && [doc: doc]) || [])]}

  def translate_slot(_, {:slot, meta, [{name, _, nil}, options]}, doc),
    do: {:slot, meta, [name, options ++ ((doc && [doc: doc]) || [])]}

  def translate_doc(_, _res = {:@, _, [{:doc, _, [text]}]}) do
    text
  end

  def translate_moduledoc(%{component_type: Surface.LiveComponent}, res), do: res

  def translate_moduledoc(
        %{component_type: Surface.Component},
        {:@, m1, [{:moduledoc, m2, [text]}]}
      ),
      do: (text && {:@, m1, [{:doc, m2, [text]}]}) || :skip

  def translate_use_defmodule(
        %{component_type: Surface.Component},
        {:use, _, _}
      ) do
    :skip
  end

  def translate_use_defmodule(
        %{config: config},
        {type, m1, [{:__aliases__, m2, alias} | other]}
      )
      when type in [:use, :defmodule] do
    {type, m1, [{:__aliases__, m2, config[:"#{type}_translates"].(alias)} | other]}
  end
end
