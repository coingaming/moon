defmodule MoonWeb.Components.ShowRoomPage.Wizard.SidebarOptions do
  @moduledoc false

  use MoonWeb, :stateless_component

  alias Moon.Design.Form.Radio
  alias MoonWeb.Components.ShowRoomPage.Wizard.Card

  prop(value, :string)
  prop(on_change, :event)

  def render(assigns) do
    ~F"""
    <Card>
      <:title>Select the preferable sidebar type</:title>
      <:description>Tailor your app with Moon's dynamic sidebar options. Choose the layout to suit your preferences and needs.</:description>

      <Radio {=@value} {=@on_change}>
        <Radio.Button value="slim">
          <Radio.Indicator class="moon-checked:border-roshi after:bg-roshi" />Slim sidebar
        </Radio.Button>
        <Radio.Button value="generic">
          <Radio.Indicator class="moon-checked:border-roshi after:bg-roshi" />Generic sidebar
        </Radio.Button>
        <Radio.Button value="wide">
          <Radio.Indicator class="moon-checked:border-roshi after:bg-roshi" />Wide sidebar
        </Radio.Button>
      </Radio>
    </Card>
    """
  end
end
