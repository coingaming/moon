defmodule Moon.Assets.Icons.IconChartRound do
  use Moon.StatelessComponent
  use Moon.Components.Context

  prop(color, :string)
  prop(background_color, :string)
  prop(font_size, :string)

  def render(assigns) do
    class_name =
      get_class_name(
        "Icons-IconChartRound-#{assigns.color}-#{assigns.background_color}-#{assigns.font_size}"
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

    <svg class={{ class_name }} width="1em" height="1em"  viewBox="0 0 32 32" fill="none" xmlns="http://www.w3.org/2000/svg"> <path fill-rule="evenodd" clip-rule="evenodd" d="M16 2C8.26801 2 2 8.26801 2 16C2 23.732 8.26801 30 16 30C23.732 30 30 23.732 30 16C30 8.26801 23.732 2 16 2ZM15 4.04107C9.1702 4.52202 4.52202 9.17021 4.04107 15H9.06668C9.50525 11.932 11.932 9.50525 15 9.06668V4.04107ZM17 9.06668C20.3946 9.55194 23.0042 12.4712 23.0042 16C23.0042 19.8683 19.8683 23.0042 16 23.0042C12.4712 23.0042 9.55195 20.3946 9.06668 17H4.04107C4.54923 23.1595 9.70934 28 16 28C22.6274 28 28 22.6274 28 16C28 9.70934 23.1595 4.54922 17 4.04107V9.06668ZM10.9958 16C10.9958 13.2363 13.2363 10.9958 16 10.9958C18.7637 10.9958 21.0042 13.2363 21.0042 16C21.0042 18.7637 18.7637 21.0042 16 21.0042C13.2363 21.0042 10.9958 18.7637 10.9958 16Z" fill="currentColor"/> </svg>
    </Context>
    """
  end
end
