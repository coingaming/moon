defmodule Moon.Helpers.MoonRender do
  @moduledoc """
  Functions for rendering Moon (or Surface, either LiveView) components in HEEX/SLIM/... (not Surface) templates
  """

  alias Phoenix.LiveView.{TagEngine, HTMLEngine}
  import Phoenix.Component, only: [live_component: 1]

  defp component(func, assigns, caller) do
    module =
      if function_exported?(TagEngine, :component, 3) do
        # phoenix_live_view 0.18.18
        TagEngine
      else
        # phoenix_live_view < 0.18.18
        HTMLEngine
      end

    apply(module, :component, [func, assigns, caller])
  end

  defp get_default_props(module) do
    Enum.reduce(module.__props__(), %{__context__: %{}}, fn
      %{name: name, opts: opts}, acc ->
        Map.put(acc, name, Keyword.get(opts, :default))
    end)
  end

  defp transform_slots(
         props = %{inner_block: [%{__slot__: :inner_block, inner_block: inner_block}]}
       ) do
    props
    |> Map.delete(:inner_block)
    |> Map.put(:default, [%{__slot__: :default, inner_block: inner_block}])
  end

  defp transform_slots(props), do: props

  @doc "Used for rendering stateless Surface componet"
  def surface_component(module, props) do
    component(
      &module.render/1,
      get_default_props(module) |> Map.merge(transform_slots(props)),
      {__ENV__.module, __ENV__.function, __ENV__.file, __ENV__.line}
    )
  end

  def surface_component(props = %{module: module}),
    do: surface_component(module, props |> Map.delete(:module))

  @doc "Used for rendering live (stateful) Surface component"
  def surface_live_component(props = %{module: module}) do
    get_default_props(module) |> Map.merge(transform_slots(props)) |> live_component()
  end

  def surface_live_component(module, props),
    do: surface_live_component(Map.put(props, :module, module))

  def is_live(module) do
    %{kind: :component} = module.__live__()
    true
  rescue
    [UndefinedFunctionError, MatchError] ->
      false
  end

  defp get_render_function(module) do
    cond do
      !function_exported?(module, :__props__, 0) ->
        &live_component/1

      is_live(module) ->
        &surface_live_component/1

      true ->
        &surface_component/1
    end
  end

  @doc """
  A function for rendering Surface components inside non-surface templates
  usage: `<.moon module="Button">hit me!</.moon>`
  Please note that only limited functional is supported, e.g. context get & named
  slots are out of scope, sorry.
  """
  def moon(props = %{module: module}) do
    get_render_function(module).(props)
  end

  def data_values(list \\ []) do
    Enum.map(list, fn {k, v} -> {:"phx-value-#{k}", v} end)
  end

  def has_slot?(smth), do: !!dbg(smth)
end
