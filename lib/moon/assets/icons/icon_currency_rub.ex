defmodule Moon.Assets.Icons.IconCurrencyRUB do
  use Moon.StatelessComponent
  use Moon.Components.Context

  property color, :string
  property background_color, :string

  def render(assigns) do
    class_name =
      get_class_name("Icons-IconCurrencyRUB-#{assigns.color}-#{assigns.background_color}")

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

    <svg class={{ class_name }} width="auto" height="1em"  viewBox="0 0 37 44" fill="none" xmlns="http://www.w3.org/2000/svg"> <path d="M21.4206 27.552C29.9966 27.552 36.2686 23.84 36.2686 13.984C36.2686 6.04798 31.7246 0.0319824 20.9086 0.0319824H4.84464V21.536H0.556641V27.552H4.84464V30.752H0.556641V36.256H4.84464V44H15.2126V36.256H29.1006V30.752H15.2126V27.552H21.4206ZM15.0846 9.50398H19.5646C23.2126 9.50398 25.1966 11.552 25.1966 14.752C25.1966 18.08 23.3406 20.256 19.5646 20.256H15.0846V9.50398Z" fill="currentColor"/> </svg>
    </Context>
    """
  end
end
