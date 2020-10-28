defmodule Moon.Assets.Icons.IconHub88 do
  use Moon.StatelessComponent
  use Moon.Components.Context

  prop(color, :string)
  prop(background_color, :string)
  prop(font_size, :string)

  def render(assigns) do
    class_name =
      get_class_name(
        "Icons-IconHub88-#{assigns.color}-#{assigns.background_color}-#{assigns.font_size}"
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

    <svg class={{ class_name }} width="1em" height="1em"  viewBox="0 0 32 32" fill="none" xmlns="http://www.w3.org/2000/svg"> <path fill-rule="evenodd" clip-rule="evenodd" d="M12.6172 2.00002C17.3276 2.01767 21.1335 5.84742 21.1217 10.5579C21.11 15.2683 17.285 19.079 12.5745 19.0732C7.8641 19.0673 4.04862 15.2471 4.04858 10.5366C4.05746 5.81317 7.89372 1.99123 12.6172 2.00002Z" fill="white" stroke="currentColor" stroke-width="2"/> <path fill-rule="evenodd" clip-rule="evenodd" d="M17.3657 29.3171C22.0803 29.3171 25.9023 25.4951 25.9023 20.7805C25.9023 16.0659 22.0803 12.2439 17.3657 12.2439C12.6511 12.2439 8.8291 16.0659 8.8291 20.7805C8.8291 25.4951 12.6511 29.3171 17.3657 29.3171Z" fill="white" stroke="currentColor" stroke-width="2"/> <path fill-rule="evenodd" clip-rule="evenodd" d="M8.82927 30C12.601 30 15.6585 27.0953 15.6585 23.5122C15.6585 19.9291 12.601 17.0244 8.82927 17.0244C5.05757 17.0244 2 19.9291 2 23.5122C2 27.0953 5.05757 30 8.82927 30Z" fill="white" stroke="currentColor" stroke-width="2"/> <path fill-rule="evenodd" clip-rule="evenodd" d="M25.2357 14.9756C27.8738 14.9846 30.0059 17.1289 29.9999 19.767C29.9939 22.4051 27.852 24.5396 25.2139 24.5366C22.5758 24.5335 20.4389 22.394 20.439 19.7559C20.4436 17.1113 22.5911 14.9711 25.2357 14.9756Z" fill="white" stroke="currentColor" stroke-width="2"/> </svg>
    </Context>
    """
  end
end
