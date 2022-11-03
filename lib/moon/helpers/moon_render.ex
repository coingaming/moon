defmodule Moon.Helpers.MoonRender do
  @moduledoc """
  Functions for rendering Moon components in HEEX/SLIM/... (not Surface) templates
  """

  import Phoenix.LiveView.HTMLEngine, only: [component: 3]
  import Phoenix.Component, only: [live_component: 1]

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

  @doc "used for rendering stateless Moon componet"
  def moon_component(module, props) do
    component(
      &module.render/1,
      get_default_props(module) |> Map.merge(transform_slots(props)),
      {__ENV__.module, __ENV__.function, __ENV__.file, __ENV__.line}
    )
  end

  def moon_component(props = %{module: module}),
    do: moon_component(module, props |> Map.delete(:module))

  @doc "used for rendering live (stateful) Moon componet"
  def moon_live_component(props = %{module: module}) do
    get_default_props(module) |> Map.merge(transform_slots(props)) |> live_component()
  end

  def moon_live_component(module, props),
    do: moon_live_component(Map.put(props, :module, module))

  defp get_render_function(module) do
    %{kind: :component} = module.__live__()
    &moon_live_component/1
  rescue
    [UndefinedFunctionError, MatchError] ->
      &moon_component/1
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
end