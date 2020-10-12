defmodule Moon.Components.Stack do
  use Moon.StatelessComponent

  prop(style, :string, required: false, default: "")

  def render(assigns) do
    class_name = get_class_name("moon-components-stack-#{assigns.style}")

    ~H"""
    <style>
      @supports (grid-gap: 0) {
        .{{ class_name }} {
          display: grid;
          grid-gap: space;
        }
      }

      @supports not (grid-gap: 0) {
        .{{ class_name }} > * + * {
          margin-top: space;
        }
      }

      .{{ class_name }}> li {
        list-style-type: none;
      }

      .{{ class_name }}> li:before {
        position: absolute;
        content: "\\200B";
      }

      .{{ class_name }} {
        {{ @style }}
      }
    </style>

    <div class={{ class_name }}>
      <slot />
    </div>
    """
  end
end
