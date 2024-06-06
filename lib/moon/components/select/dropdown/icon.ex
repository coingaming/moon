defmodule Moon.Components.Select.Dropdown.Icon do
  @moduledoc false

  use Moon.StatelessComponent

  prop(icon, :any)
  prop(class, :string, default: "")
  prop(style, :string, default: "")

  slot(default)

  data(module, :any)
  data(props, :any)

  def render(assigns) do
    [module, props] = assigns.icon
    assigns = assign(assigns, module: module, props: props)

    ~F"""
    <div class={@class} style={@style}>
      {Moon.Helpers.MoonRender.surface_component(@module, @props)}
    </div>
    """
  end
end
