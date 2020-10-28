defmodule Moon.Components.Carousel do
  use Moon.StatelessComponent

  property(style, :string, default: "")

  def render(assigns) do
    class_name = get_class_name("components-carousel-#{assigns.style}")

    ~H"""
    <style>
      .{{ class_name }} {
        overflow: hidden;
        overflow-x: scroll;
        scroll-snap-type: x proximity;
        {{ @style }};
      }

      .{{ class_name }}-inner {
        width: auto;
        white-space: nowrap;
      }

      .{{ class_name }}-inner > * {
        white-space: initial;
      }
    </style>

    <div class={{ class_name }}>
      <div class={{ "#{class_name}-inner" }}>
        <slot />
      </div>
    </div>
    """
  end
end
