defmodule Moon.Assets.Icons.IconSuccessCircle do
  use Moon.StatelessComponent
  use Moon.Components.Context

  prop(color, :string)
  prop(background_color, :string)
  prop(font_size, :string)

  def render(assigns) do
    class_name =
      get_class_name(
        "Icons-IconSuccessCircle-#{assigns.color}-#{assigns.background_color}-#{assigns.font_size}"
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

    <svg class={{ class_name }} width="1em" height="1em"  viewBox="0 0 32 32" fill="none" xmlns="http://www.w3.org/2000/svg"> <path d="M22.727 12.6866C23.1062 12.2851 23.0881 11.6522 22.6866 11.273C22.2851 10.8938 21.6522 10.9119 21.273 11.3134L14.4444 18.5436L10.727 14.6075C10.3478 14.206 9.7149 14.1879 9.31338 14.5671C8.91186 14.9463 8.89378 15.5792 9.27299 15.9807L13.7174 20.6866C13.9063 20.8866 14.1693 21 14.4444 21C14.7196 21 14.9826 20.8866 15.1715 20.6866L22.727 12.6866Z" fill="currentColor"/> <path fill-rule="evenodd" clip-rule="evenodd" d="M16 2C8.26801 2 2 8.26801 2 16C2 23.732 8.26801 30 16 30C23.732 30 30 23.732 30 16C30 8.26801 23.732 2 16 2ZM4 16C4 9.37258 9.37258 4 16 4C22.6274 4 28 9.37258 28 16C28 22.6274 22.6274 28 16 28C9.37258 28 4 22.6274 4 16Z" fill="currentColor"/> </svg>
    </Context>
    """
  end
end
