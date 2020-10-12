defmodule Moon.Sites.Aposta10.Pages.MainPage.Picks.DatePicker.Item do
  use Moon.StatelessComponent
  use Moon.Components.Context
  alias Moon.Components.Text

  prop(day, :integer, required: true)
  prop(active, :boolean, required: false, default: false)

  def render(assigns) do
    class_name = get_class_name("site-body-picks-date-picker-item-#{assigns.active}")

    ~H"""
    <Context get={{ theme: theme }}>
      <style>
        .{{ class_name }} {
          display: inline-block;
          width: 65px;
          font-size: 14px;
          padding: 10px;
          padding-top: 0px;
          text-align: center;
          border-bottom: {{ @active && "solid 2px #{@theme.color.gohan_100}" || "none" }};
        }
      </style>

      <div class={{ class_name }}>
        <Text size=18 weight=500 color={{ @theme.color.gohan_100}}>Feb 7</Text>
        <Text size=14>Today</Text>
      </div>
    </Context>
    """
  end
end
