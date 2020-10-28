defmodule Moon.Assets.Icons.IconCode do
  use Moon.StatelessComponent
  use Moon.Components.Context

  prop(color, :string)
  prop(background_color, :string)
  prop(font_size, :string)

  def render(assigns) do
    class_name =
      get_class_name(
        "Icons-IconCode-#{assigns.color}-#{assigns.background_color}-#{assigns.font_size}"
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

    <svg class={{ class_name }} width="1em" height="1em"  viewBox="0 0 32 32" fill="none" xmlns="http://www.w3.org/2000/svg"> <path d="M14.7071 15.2929C15.0976 15.6834 15.0976 16.3166 14.7071 16.7071L12.4142 19L14.7071 21.2929C15.0976 21.6834 15.0976 22.3166 14.7071 22.7071C14.3166 23.0976 13.6834 23.0976 13.2929 22.7071L10.2929 19.7071C9.90237 19.3166 9.90237 18.6834 10.2929 18.2929L13.2929 15.2929C13.6834 14.9024 14.3166 14.9024 14.7071 15.2929Z" fill="currentColor"/> <path d="M17.2929 17.2929C16.9024 17.6834 16.9024 18.3166 17.2929 18.7071L19.5858 21L17.2929 23.2929C16.9024 23.6834 16.9024 24.3166 17.2929 24.7071C17.6834 25.0976 18.3166 25.0976 18.7071 24.7071L21.7071 21.7071C22.0976 21.3166 22.0976 20.6834 21.7071 20.2929L18.7071 17.2929C18.3166 16.9024 17.6834 16.9024 17.2929 17.2929Z" fill="currentColor"/> <path fill-rule="evenodd" clip-rule="evenodd" d="M13 2C12.7348 2 12.4805 2.10536 12.2929 2.29289L5.29293 9.29289C5.10539 9.48043 5.00003 9.73478 5.00003 10L5 25C4.99999 27.7614 7.23857 30 10 30H22C24.7615 30 27 27.7614 27 25L27 7C27 4.23858 24.7615 2 22 2H13ZM13 10V4.41425L7.41425 10H13ZM14 12H7.00003L7 25C7 26.6569 8.34314 28 10 28H22C23.6569 28 25 26.6569 25 25L25 7C25 5.34315 23.6569 4 22 4H15V11C15 11.5523 14.5523 12 14 12Z" fill="currentColor"/> </svg>
    </Context>
    """
  end
end
