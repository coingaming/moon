defmodule Moon.Components.Inline do
  use Moon.StatelessComponent

  property style, :string

  def render(assigns) do
    class_name = get_classname("components-inline-#{assigns.style}")

    ~H"""
    <style>
      .{{ class_name }} {
        {{ @style }};
      }

      .{{ class_name }} > div, .{{ class_name }} > img {
        display: inline-block;
        padding-right: 10px;
        vertical-align: top;
      }
    </style>

    <div class={{ class_name }}>
      <slot />
    </div>
    """
  end
end
