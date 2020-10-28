defmodule Moon.Assets.Icons.IconSliders do
  use Moon.StatelessComponent
  use Moon.Components.Context

  prop(color, :string)
  prop(background_color, :string)
  prop(font_size, :string)

  def render(assigns) do
    class_name =
      get_class_name(
        "Icons-IconSliders-#{assigns.color}-#{assigns.background_color}-#{assigns.font_size}"
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

    <svg class={{ class_name }} width="1em" height="1em"  viewBox="0 0 32 32" fill="none" xmlns="http://www.w3.org/2000/svg"> <path fill-rule="evenodd" clip-rule="evenodd" d="M8 3L8 14.083C5.16229 14.559 3 17.027 3 20C3 22.973 5.16229 25.441 8 25.917V29C8 29.5523 8.44772 30 9 30C9.55228 30 10 29.5523 10 29V25.917C12.8377 25.441 15 22.973 15 20C15 17.027 12.8377 14.559 10 14.083L10 3C10 2.44771 9.55228 2 9 2C8.44771 2 8 2.44771 8 3ZM9 16C6.79086 16 5 17.7909 5 20C5 22.2091 6.79086 24 9 24C11.2091 24 13 22.2091 13 20C13 17.7909 11.2091 16 9 16Z" fill="currentColor"/> <path fill-rule="evenodd" clip-rule="evenodd" d="M24 17.917C26.8377 17.441 29 14.973 29 12C29 9.027 26.8377 6.55904 24 6.08296V3C24 2.44772 23.5523 2 23 2C22.4477 2 22 2.44772 22 3V6.08296C19.1623 6.55904 17 9.027 17 12C17 14.973 19.1623 17.441 22 17.917V29C22 29.5523 22.4477 30 23 30C23.5523 30 24 29.5523 24 29V17.917ZM19 12C19 9.79086 20.7909 8 23 8C25.2091 8 27 9.79086 27 12C27 14.2091 25.2091 16 23 16C20.7909 16 19 14.2091 19 12Z" fill="currentColor"/> </svg>
    </Context>
    """
  end
end
