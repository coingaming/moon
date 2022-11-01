defmodule Moon.RenderHelpers do
  @moduledoc false

  def get_default_props(module) do
    Enum.reduce(module.__props__(), %{}, fn
      %{name: name, opts: opts, type: type}, acc ->
        value = Keyword.get(opts, :values)

        value =
          if type == :string and not is_nil(value) do
            Enum.join(value, " ")
          else
            value
          end

        Map.put(acc, name, value)
    end)
  end

  def render_component(module, custom_props) do
    default_props = Moon.RenderHelpers.get_default_props(module)
    use_props = Map.merge(default_props, custom_props)

    Phoenix.LiveView.HTMLEngine.component(
      &module.render/1,
      use_props,
      {__ENV__.module, __ENV__.function, __ENV__.file, __ENV__.line}
    )
  end

  def render_live_component(module, custom_props) do
    default_props = Moon.RenderHelpers.get_default_props(module)
    use_props = Map.merge(default_props, custom_props)

    assigns = Map.merge(use_props, %{module: module})

    Phoenix.LiveView.Helpers.live_component(assigns)
  end
end
