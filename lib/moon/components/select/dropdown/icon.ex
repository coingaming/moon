defmodule Moon.Components.Select.Dropdown.Icon do
  @moduledoc false

  use Moon.StatelessComponent

  alias Moon.Components.Select.Helpers, as: SelectHelpers

  prop icon, :any
  prop class, :string, default: ""
  prop style, :string, default: ""

  slot default

  def render(assigns) do
    [module, props] = assigns.icon

    ~F"""
    <div class={@class} style={@style}>
      {Moon.RenderHelpers.render_component(module, props)}
    </div>
    """
  end
end
