defmodule Moon.Assets.Icons.IconCurrencyKRW do
  use Moon.StatelessComponent
  use Moon.Components.Context

  property(color, :string)
  property(background_color, :string)
  property(font_size, :string)

  def render(assigns) do
    class_name =
      get_class_name(
        "Icons-IconCurrencyKRW-#{assigns.color}-#{assigns.background_color}-#{assigns.font_size}"
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

    <svg class={{ class_name }} width="1em" height="1em"  viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg"> <path d="M3.54254 20L2.39888 13.0812H0V11.0084H2.06416L1.72943 8.9916H0V6.91877H1.3947L0.251046 0H3.40307L4.46304 6.91877H7.02929L8.22873 0H11.7713L12.9428 6.91877H15.537L16.569 0H19.7211L18.5774 6.91877H20V8.9916H18.2427L17.9079 11.0084H20V13.0812H17.5732L16.4296 20H12.5244L11.2692 13.0812H8.70293L7.47559 20H3.54254ZM9.70711 6.91877H10.265L9.98605 4.34174L9.70711 6.91877ZM5.07671 11.0084H6.33194L6.66667 8.9916H4.76987L5.07671 11.0084ZM9.09344 11.0084H10.8787L10.516 8.9916H9.45607L9.09344 11.0084ZM13.6681 11.0084H14.9512L15.2301 8.9916H13.3054L13.6681 11.0084ZM5.66248 15.8824L5.99721 13.0812H5.35565L5.66248 15.8824ZM14.3375 15.8824L14.6444 13.0812H13.9749L14.3375 15.8824Z" fill="currentColor"/> </svg>
    </Context>
    """
  end
end
