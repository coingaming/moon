defmodule Moon.Assets.Icons.IconHelp do
  use Moon.StatelessComponent
  use Moon.Components.Context

  prop(color, :string)
  prop(background_color, :string)
  prop(font_size, :string)

  def render(assigns) do
    class_name =
      get_class_name(
        "Icons-IconHelp-#{assigns.color}-#{assigns.background_color}-#{assigns.font_size}"
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

    <svg class={{ class_name }} width="1em" height="1em"  viewBox="0 0 32 32" fill="none" xmlns="http://www.w3.org/2000/svg"> <path d="M16 10C14.3431 10 13 11.3431 13 13C13 13.5523 12.5523 14 12 14C11.4477 14 11 13.5523 11 13C11 10.2386 13.2386 8 16 8C18.7614 8 21 10.2386 21 13C21 14.4965 20.0323 15.6453 19.1661 16.4768C18.7887 16.8392 18.3803 17.1864 18.0104 17.501C17.9413 17.5597 17.8734 17.6175 17.8074 17.6738C17.4951 17.9406 17.2235 18.1789 16.9977 18.4017C16.9625 18.9221 16.5293 19.3333 16 19.3333C15.4477 19.3333 15 18.8856 15 18.3333V18C15 17.7557 15.0894 17.5198 15.2514 17.3369C15.6192 16.9218 16.0772 16.5215 16.5082 16.1533C16.5809 16.0911 16.6531 16.0297 16.7248 15.9687L16.7259 15.9678C17.0963 15.6526 17.4511 15.3508 17.7811 15.034C18.5991 14.2487 19 13.6105 19 13C19 11.3431 17.6569 10 16 10Z" fill="currentColor"/> <path d="M17 22C17 22.5523 16.5523 23 16 23C15.4477 23 15 22.5523 15 22C15 21.4477 15.4477 21 16 21C16.5523 21 17 21.4477 17 22Z" fill="currentColor"/> <path fill-rule="evenodd" clip-rule="evenodd" d="M16 2C8.2728 2 2 8.23382 2 15.9343C2 23.6174 8.21385 30 15.9583 30C19.8404 30 23.6893 29.962 27.5679 29.9237L28.9681 29.91C29.2927 29.9068 29.5957 29.7462 29.7805 29.4793C29.9653 29.2123 30.0091 28.8722 29.8978 28.5672L27.9426 23.2092C29.2475 21.0914 30 18.5991 30 15.9343C30 8.23382 23.7272 2 16 2ZM4 15.9343C4 9.34793 9.3678 4 16 4C22.6322 4 28 9.34793 28 15.9343C28 18.3746 27.2646 20.6414 26.0019 22.5309C25.8247 22.796 25.7846 23.1297 25.8939 23.4293L27.534 27.9239C23.6591 27.9622 19.8251 28 15.9583 28C9.34343 28 4 22.538 4 15.9343Z" fill="currentColor"/> </svg>
    </Context>
    """
  end
end
