defmodule Moon.Assets.Icons.IconErrorCircle do
  use Moon.StatelessComponent
  use Moon.Components.Context

  prop(color, :string)
  prop(background_color, :string)
  prop(font_size, :string)

  def render(assigns) do
    class_name =
      get_class_name(
        "Icons-IconErrorCircle-#{assigns.color}-#{assigns.background_color}-#{assigns.font_size}"
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

    <svg class={{ class_name }} width="1em" height="1em"  viewBox="0 0 32 32" fill="none" xmlns="http://www.w3.org/2000/svg"> <path fill-rule="evenodd" clip-rule="evenodd" d="M16 4C9.37258 4 4 9.37258 4 16C4 22.6274 9.37258 28 16 28C22.6274 28 28 22.6274 28 16C28 9.37258 22.6274 4 16 4ZM2 16C2 8.26801 8.26801 2 16 2C23.732 2 30 8.26801 30 16C30 23.732 23.732 30 16 30C8.26801 30 2 23.732 2 16ZM10.2307 10.2929C10.6212 9.90237 11.2544 9.90237 11.6449 10.2929L16 14.648L20.355 10.2929C20.7456 9.90238 21.3787 9.90238 21.7693 10.2929C22.1598 10.6834 22.1598 11.3166 21.7693 11.7071L17.4142 16.0622L21.7693 20.4172C22.1598 20.8078 22.1598 21.4409 21.7693 21.8315C21.3787 22.222 20.7456 22.222 20.355 21.8315L16 17.4764L11.6449 21.8315C11.2544 22.222 10.6212 22.222 10.2307 21.8315C9.84017 21.4409 9.84017 20.8078 10.2307 20.4173L14.5858 16.0622L10.2307 11.7071C9.84017 11.3166 9.84017 10.6834 10.2307 10.2929Z" fill="currentColor"/> </svg>
    </Context>
    """
  end
end
