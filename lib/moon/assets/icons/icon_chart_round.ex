defmodule Moon.Assets.Icons.IconChartRound do
  use Moon.StatelessComponent
  use Moon.Components.Context

  property(color, :string)
  property(background_color, :string)
  property(font_size, :string)

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

    <svg class={{ class_name }} width="1em" height="1em"  viewBox="0 0 28 28" fill="none" xmlns="http://www.w3.org/2000/svg">  <path fill-rule="evenodd" clip-rule="evenodd" d="M14 0C6.26801 0 0 6.26801 0 14C0 21.732 6.26801 28 14 28C21.732 28 28 21.732 28 14C28 6.26801 21.732 0 14 0ZM13 2.04107C7.1702 2.52202 2.52202 7.17021 2.04107 13H7.06668C7.50525 9.93201 9.932 7.50525 13 7.06668V2.04107ZM15 7.06668C18.3946 7.55194 21.0042 10.4712 21.0042 14C21.0042 17.8683 17.8683 21.0042 14 21.0042C10.4712 21.0042 7.55195 18.3946 7.06668 15H2.04107C2.54923 21.1595 7.70934 26 14 26C20.6274 26 26 20.6274 26 14C26 7.70934 21.1595 2.54922 15 2.04107V7.06668ZM8.99583 14C8.99583 11.2363 11.2363 8.99583 14 8.99583C16.7637 8.99583 19.0042 11.2363 19.0042 14C19.0042 16.7637 16.7637 19.0042 14 19.0042C11.2363 19.0042 8.99583 16.7637 8.99583 14Z" fill="currentColor"/> </svg>
    </Context>
    """
  end
end
