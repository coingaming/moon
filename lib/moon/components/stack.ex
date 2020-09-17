defmodule Moon.Components.Stack do
  use Moon.StatelessComponent

  property style, :string, required: false, default: ""

  def render(assigns) do
    class_name = get_classname("moon-components-stack-#{assigns.style}")

    ~H"""
    <style>
      .{{ class_name }} > div, .{{ class_name }} > img {
        display: block;
        margin-bottom: 10px;
        {{ @style }};
      }
    </style>

    <div class={{ class_name }}>
      <slot />
    </div>
    """
  end
end
