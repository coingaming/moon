defmodule MoonWeb.Components.ExampleAndCode do
  use MoonWeb, :stateless_component

  prop(class, :string)
  slot(example)
  slot(code)

  def render(assigns) do
    ~H"""
    <div class="grid grid-cols-2 rounded {{ @class }}">
      <div>
        <slot name="example">
          Example not defined
        </slot>
      </div>
      <div>
        <slot name="code">
          Example code not defined
        </slot>
      </div>
    </div>
    """
  end
end
