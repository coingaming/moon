defmodule Moon.Convert.Template do
  @moduledoc "Functions for converting html tokens surface -> live_view"

  require Logger
  import Moon.Convert.Ast

  defp translate_slot(name, attrs, children) do
    str =
      [name | attrs |> Enum.map(&translate_slot_attr/1) |> Enum.filter(&(!!&1))]
      |> Enum.join(", ")

    case children do
      [] ->
        {:expr, "render_slot(#{str})", %{}}

      [{:expr, expr, _}] ->
        {:expr, "render_slot(#{str}) || #{expr}", %{}}

      _ ->
        # {#if slot_assigned?(@default)}\n    {render_slot(@default)}\n  {#else}\n    children  {/if}
        {:block, "if",
         [
           {:root, {:attribute_expr, "has_slot?(#{name})", %{}}, %{}}
         ],
         [
           {:block, :default, [],
            [
              "\n    ",
              {:expr, "render_slot(#{str})", %{}},
              "\n  "
            ], %{}},
           {:block, "else", [], children, %{}}
         ], %{has_sub_blocks?: true}}
    end
  end

  def translate_node(text, _) when is_binary(text), do: text

  def translate_node({:expr, expr, meta}, _), do: {:expr, expr, meta}

  # TODO: context_put & children
  def translate_node(
        {"#slot", [{:root, {:attribute_expr, expr, _m2}, _m1} | attrs], children, _m3},
        _
      ) do
    translate_slot(expr, attrs, children)
  end

  def translate_node({"#slot", attrs, children, _}, _) do
    translate_slot("@inner_block", attrs, children)
  end

  def translate_node({type, attributes, children, node_meta}, c) do
    {res_type, source_type} = translate_type(type, c)

    {attributes, children} = pre_translate_node(source_type, {type, attributes, children}, c)

    {res_type,
     attributes
     |> List.wrap()
     |> Enum.map(&translate_attr(&1, source_type.__props__()))
     |> List.flatten(), children, node_meta}
  end

  def translate_node(other, _), do: other

  defp pre_translate_node(Moon.Design.Table, {_, attributes, children}, c) do
    {attributes, m_name} =
      attributes
      |> Enum.map(fn
        {"items", {:attribute_expr, expr, m1}, m2} ->
          [model, models] = expr |> String.split("<-") |> Enum.map(&String.trim/1)
          {{"items", {:attribute_expr, models, m1}, m2}, model}

        other ->
          {other, nil}
      end)
      |> Enum.reduce({[], nil}, fn {node, model}, {nodes, cur_model} ->
        {nodes ++ [node], cur_model || model}
      end)

    {attributes,
     children
     |> Enum.map(fn
       {type2, attributes2, children2, meta} ->
         {_, source_type} = translate_type(type2, c)

         case source_type do
           Moon.Design.Table.Column -> {":cols :let={#{m_name}}", attributes2, children2, meta}
           _ -> {type2, attributes2, children2, meta}
         end

       other ->
         other
     end)}
  end

  defp pre_translate_node(_, {_, attributes, children}, _), do: {attributes, children}

  defp translate_slot_attr({"generator_value", {:attribute_expr, expr, _m2}, _m1}), do: expr

  defp translate_slot_attr(other) do
    Logger.warning("Unknown slot attribute: #{inspect(other)}")
    nil
  end

  defp get_alias(alias_, aliases) do
    [key | other] = alias_ |> String.split(".")

    (((aliases[key] && [aliases[key]]) || ["Elixir", key]) ++ other)
    |> Enum.join(".")
    |> String.to_atom()
  end

  defp translate_type(type, c = %{aliases: aliases}) do
    cond do
      !String.match?(type, ~r/^[A-Z].*$/) ->
        {type, %{__props__: []}}

      type == "Icon" ->
        {".icon", Moon.Icon}

      # get_alias(type, aliases) == Moon.Design.Table.Column ->
      #   {":cols :let={model}", Moon.Design.Table.Column}

      get_alias(type, aliases) === nil ->
        Logger.warning("Unknown type: #{type}")
        {type, %{__props__: []}}

      function_exported?(get_alias(type, aliases), :__slot_name__, 0) ->
        # TODO: get subcompoent's render function
        Logger.warning(
          "Replacing #{get_alias(type, aliases)} with slot :#{get_alias(type, aliases).__slot_name__()}"
        )

        {":#{get_alias(type, aliases).__slot_name__()}", get_alias(type, aliases)}

      get_alias(type, aliases).component_type() == Surface.Component ->
        mod = get_alias(type, aliases) |> parent_module() |> c.config.module_translates.()

        {case Code.ensure_compiled(mod) do
           {:module, _} ->
             func_name =
               type |> String.split(".") |> Enum.at(-1) |> String.downcase() |> String.to_atom()

             if Keyword.has_key?(mod.__info__(:functions), func_name) do
               # TODO: add imports here
               "#{(mod in [c.config.module_translates.(c.module), Moon.Light] && "") || mod}.#{func_name}"
             else
               ".moon module={#{type}}"
             end

           {:error, _} ->
             ".moon module={#{type}}"
         end, get_alias(type, aliases)}

      get_alias(type, aliases).component_type() == Surface.LiveComponent ->
        mod = get_alias(type, aliases) |> c.config.module_translates.()

        {case Code.ensure_compiled(mod) do
           {:module, _} -> ".live_component module={#{mod}}"
           {:error, _} -> ".moon module={#{type}}"
         end, get_alias(type, aliases)}
    end
  end

  defp translate_attr({name, expr, meta}, node_props) when is_atom(name),
    do: translate_attr({"#{name}", expr, meta}, node_props)

  defp translate_attr({name, expr, meta}, _) when name in ~w(root :let :if :for),
    do: {name, expr, meta}

  defp translate_attr({":attrs", expr, meta}, _), do: {:root, expr, meta}

  # TODO: translate each to data-value attribute
  defp translate_attr({":values", {:attribute_expr, expr, m2}, m1}, _),
    do: {:root, {:attribute_expr, "data_values(#{expr})", m2}, m1}

  # defp translate_attr({":values", expr, m1}),
  #   do: {:root, {:attribute_expr, "data_values(#{expr})", m1}, m1}

  defp translate_attr({":on-" <> name, value, meta}, _) when is_binary(value) do
    [
      {:"phx-#{name}", value, meta},
      {:"phx-target", {:attribute_expr, "@myself", meta}, meta}
    ]
  end

  defp translate_attr({":on-" <> name, {:attribute_expr, expr, m2}, m1}, _) do
    [
      {:"phx-#{name}", {:attribute_expr, "(#{expr}) && (#{expr}).name", m2}, m2},
      {:"phx-target", {:attribute_expr, "(#{expr}) && (#{expr}).target", m2}, m1}
    ]
  end

  # defp translate_attr({":" <> name, value, meta}),
  #   do: {:"phx-#{name}", translate_attr_value(value), meta}

  defp translate_attr({name, value, meta}, node_props) do
    prop = node_props |> Enum.find(&("#{&1.name}" == "#{name}"))

    if prop && prop.type == :event && is_binary(value) do
      {:"#{name}", {:attribute_expr, "%Event{name: \"#{value}\", target: @myself}", meta}, meta}
    else
      {:"#{name}", translate_attr_value(value), meta}
    end
  end

  defp translate_attr_value({:attribute_expr, expr, meta}) do
    {:attribute_expr, expr |> translate_attr_values(), meta}
  end

  defp translate_attr_value(expr), do: expr

  defp translate_attr_values(expr) do
    case Code.string_to_quoted(expr) do
      {:ok, _} -> expr
      {:error, _} -> "[#{expr}]"
    end
  end
end
