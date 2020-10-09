defmodule Moon.Assets.Icons.IconCurrencyCAD do
  use Moon.StatelessComponent
  use Moon.Components.Context

  property color, :string
  property background_color, :string

  def render(assigns) do
    class_name =
      get_class_name("Icons-IconCurrencyCAD-#{assigns.color}-#{assigns.background_color}")

    ~H"""
    <Context get={{ :theme }}>
    <style>
      .{{ class_name }} {
        vertical-align: middle;

        
        color: {{ get_color(@color, @theme) }};
        background-color: {{ get_color(@background_color, @theme) }};
        display: inline-block;
        overflow: hidden;
        

        
      }
    </style>

    <svg class={{ class_name }} width="1em" height="auto"  viewBox="0 0 78 59" fill="none" xmlns="http://www.w3.org/2000/svg"> <path d="M24.0134 51.576C32.0774 51.576 38.4134 47.736 42.3174 42.936L34.5094 36.216C31.8854 39.352 28.2374 41.336 24.0134 41.336C16.5894 41.336 11.7894 35.64 11.7894 28.344C11.7894 20.024 17.3574 15.16 23.9494 15.16C28.3654 15.16 32.0134 17.528 34.4454 20.408L42.2534 13.688C37.2614 7.60803 30.3494 4.92003 23.9494 4.92003C8.97339 4.92003 0.525391 15.352 0.525391 28.344C0.525391 43.448 10.9574 51.576 24.0134 51.576Z" fill="currentColor"/> <path d="M77.9569 38.072C77.9569 29.56 72.3889 27.256 63.4929 24.568C59.2689 23.288 57.9249 22.2 57.9249 20.664C57.9249 19.064 59.2049 18.104 61.8929 18.104C64.5169 18.104 67.5889 19 71.2369 21.56L77.1889 14.136C74.1169 11.64 69.7649 9.52803 65.5409 8.69603V0.952026H58.6289V8.44003C51.0769 9.46403 46.7249 14.584 46.7249 21.368C46.7249 29.688 53.1889 32.312 60.4849 34.488C65.4129 35.96 66.6289 37.048 66.6289 38.904C66.6289 40.568 65.1569 41.784 62.6609 41.784C59.5889 41.784 55.3649 40.376 51.7809 36.984L45.6369 44.472C49.4129 48.248 53.8289 50.36 58.5649 51.128V58.488H65.4129V51.192C73.0289 50.168 77.9569 45.368 77.9569 38.072Z" fill="currentColor"/> </svg>
    </Context>
    """
  end
end
