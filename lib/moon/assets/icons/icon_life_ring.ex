defmodule Moon.Assets.Icons.IconLifeRing do
  use Moon.StatelessComponent
  use Moon.Components.Context

  prop(color, :string)
  prop(background_color, :string)
  prop(font_size, :string)

  def render(assigns) do
    class_name =
      get_class_name(
        "Icons-IconLifeRing-#{assigns.color}-#{assigns.background_color}-#{assigns.font_size}"
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

    <svg class={{ class_name }} width="1em" height="1em"  viewBox="0 0 32 32" fill="none" xmlns="http://www.w3.org/2000/svg"> <path fill-rule="evenodd" clip-rule="evenodd" d="M16 2C8.26801 2 2 8.26801 2 16C2 23.732 8.26801 30 16 30C23.732 30 30 23.732 30 16C30 8.26801 23.732 2 16 2ZM4 16C4 13.0463 5.06716 10.3418 6.83695 8.25116L10.2929 11.7071C10.3267 11.741 10.3624 11.7719 10.3996 11.7999C9.52077 12.9698 9 14.4241 9 16C9 17.5759 9.52077 19.0302 10.3996 20.2001C10.3624 20.2281 10.3267 20.259 10.2929 20.2929L6.83695 23.7488C5.06716 21.6582 4 18.9537 4 16ZM11.7071 21.7071C11.741 21.6733 11.7719 21.6376 11.7999 21.6004C12.9698 22.4792 14.4241 23 16 23C17.5759 23 19.0302 22.4792 20.2001 21.6004C20.2281 21.6376 20.259 21.6733 20.2929 21.7071L23.7488 25.1631C21.6582 26.9328 18.9537 28 16 28C13.0463 28 10.3418 26.9328 8.25116 25.1631L11.7071 21.7071ZM25.1631 23.7488C26.9328 21.6582 28 18.9537 28 16C28 13.0463 26.9328 10.3418 25.1631 8.25116L21.7071 11.7071C21.6733 11.741 21.6376 11.7719 21.6004 11.7999C22.4792 12.9698 23 14.4241 23 16C23 17.5759 22.4792 19.0302 21.6004 20.2001C21.6376 20.2281 21.6733 20.259 21.7071 20.2929L25.1631 23.7488ZM20.2001 10.3996C20.2281 10.3624 20.259 10.3267 20.2929 10.2929L23.7488 6.83695C21.6582 5.06716 18.9537 4 16 4C13.0463 4 10.3418 5.06716 8.25116 6.83695L11.7071 10.2929C11.741 10.3267 11.7719 10.3624 11.7999 10.3996C12.9698 9.52077 14.4241 9 16 9C17.5759 9 19.0302 9.52077 20.2001 10.3996ZM11 16C11 13.2386 13.2386 11 16 11C18.7614 11 21 13.2386 21 16C21 18.7614 18.7614 21 16 21C13.2386 21 11 18.7614 11 16Z" fill="currentColor"/> </svg>
    </Context>
    """
  end
end
