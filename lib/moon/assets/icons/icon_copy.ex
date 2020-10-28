defmodule Moon.Assets.Icons.IconCopy do
  use Moon.StatelessComponent
  use Moon.Components.Context

  prop(color, :string)
  prop(background_color, :string)
  prop(font_size, :string)

  def render(assigns) do
    class_name =
      get_class_name(
        "Icons-IconCopy-#{assigns.color}-#{assigns.background_color}-#{assigns.font_size}"
      )

    ~H"""
    <Context get={{ theme: theme }}>
    <style>
      .{{ class_name }} {
        vertical-align: middle;
        width: 1em;
        color: {{ get_color(@color, theme) }};
        background-color: {{ get_color(@background_color, theme) }};
        font-size: {{ @font_size }};
        display: inline-block;
        overflow: hidden;
        
      }
    </style>

    <svg class={{ class_name }} width="1em" height="1em"  viewBox="0 0 32 32" fill="none" xmlns="http://www.w3.org/2000/svg"> <path fill-rule="evenodd" clip-rule="evenodd" d="M9.93498 2.2979C10.1229 2.1073 10.3794 2 10.6471 2H17C19.7614 2 22 4.23858 22 7C24.7614 7 27 9.23858 27 12L27 25C27 27.7614 24.7614 30 22 30H14C11.2386 30 9 27.7614 9 25C6.23858 25 4 22.7614 4 20V8.72727C4 8.4645 4.10343 8.21228 4.28792 8.02517L9.93498 2.2979ZM20 7L20 20C20 21.6569 18.6569 23 17 23H9C7.34314 23 6 21.6569 6 20V11H12C12.5523 11 13 10.5523 13 10V4H17C18.6569 4 20 5.34315 20 7ZM11 4.06634V9H6.13544L11 4.06634ZM14 28C12.3431 28 11 26.6569 11 25H17C19.7614 25 22 22.7614 22 20V9C23.6569 9 25 10.3431 25 12L25 25C25 26.6569 23.6569 28 22 28H14Z" fill="currentColor"/> </svg>
    </Context>
    """
  end
end
