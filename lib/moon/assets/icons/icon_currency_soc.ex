defmodule Moon.Assets.Icons.IconCurrencySOC do
  use Moon.StatelessComponent
  use Moon.Components.Context

  property(color, :string)
  property(background_color, :string)
  property(font_size, :string)

  def render(assigns) do
    class_name =
      get_class_name(
        "Icons-IconCurrencySOC-#{assigns.color}-#{assigns.background_color}-#{assigns.font_size}"
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

    <svg class={{ class_name }} width="1em" height="1em"  viewBox="0 0 56 56" fill="none" xmlns="http://www.w3.org/2000/svg"> <path d="M28 56C12.5263 56 0 43.4737 0 28C0 12.5263 12.5263 0 28 0C43.4737 0 56 12.5263 56 28C56 43.4737 43.4328 56 28 56ZM35.4912 5.07602V9.25146L32.4948 8.39515L29.8421 7.69591V4.0117H25.5439V7.69591L22.9762 8.39515L20.0585 9.21053V5.1579C10.6023 8.43275 3.80702 17.4386 3.80702 28C3.80702 38.5614 10.6023 47.5673 20.0585 50.8421V46.3392L22.9682 47.1853L25.462 47.8538V52.0702C26.2807 52.1521 27.1404 52.193 27.9591 52.193C28.614 52.193 29.269 52.1521 29.924 52.1111V47.8947L32.6519 47.1853L35.4912 46.3801V51.0059C45.1521 47.8538 52.1111 38.7661 52.1111 28.0409C52.1521 17.3158 45.1521 8.22807 35.4912 5.07602Z" fill="currentColor"/> <path d="M27.7469 44.7017C33.2543 44.7017 39.9286 41.9013 39.9286 34.1069C39.9286 27.7127 35.448 26.2191 29.6138 23.9788C26.02 22.5786 24.8065 21.7385 24.8531 20.1516C24.8531 18.5647 26.02 17.5846 27.9336 17.5846C29.8005 17.5846 31.8541 18.4713 34.7012 20.7117L39.0885 15.0175C35.9147 12.3105 31.9475 10.6302 27.6069 10.7236C21.446 10.8169 16.732 14.9708 16.732 20.4783C16.732 27.0126 21.7727 29.3929 26.8134 31.1198C30.5473 32.38 31.7141 33.1734 31.7141 34.9937C31.7141 36.4872 30.594 37.7941 27.9802 37.7941C25.6933 37.7941 22.6595 36.6273 20.1391 33.8735L15.5652 39.4276C19.1123 43.0682 23.4996 44.7017 27.7469 44.7017Z" fill="currentColor"/> </svg>
    </Context>
    """
  end
end
