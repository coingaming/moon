defmodule Moon.Sites.Aposta10.Body.Picks.DatePicker.Item do
  use Moon.StatelessComponent
  alias Moon.Sites.Aposta10.Config
  alias Moon.Components.Text

  property day, :integer, required: true
  property active, :boolean, required: false, default: false

  def render(assigns) do
    class_name = get_classname("site-body-picks-date-picker-item-#{assigns.active}")

    ~H"""
    <style>
      .{{ class_name }} {
        display: inline-block;
        width: 65px;
        font-size: 14px;
        padding: 10px;
        padding-top: 0px;
        text-align: center;
        border-bottom: {{ @active && "solid 2px #{Config.colors.color4}" || "none" }};
      }
    </style>

    <div class={{ class_name }}>
      <Text size=18 weight=500 color={{ Config.colors.color4 }}>Feb 7</Text>
      <Text size=14>Today</Text>
    </div>
    """
  end
end
