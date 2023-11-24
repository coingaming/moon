defmodule MoonWeb.Components.ShowRoomPage.Wizard.HeaderOptions do
  @moduledoc false

  use MoonWeb, :stateless_component

  alias MoonWeb.Components.ShowRoomPage.Wizard.Card
  alias Moon.Design.Tabs
  alias MoonWeb.Components.ShowRoomPage.Wizard.HeaderOptions

  prop(has_breadcrumbs, :boolean, default: true)
  prop(has_button_group, :boolean, default: true)
  prop(has_left_button, :boolean, default: true)
  prop(has_right_button, :boolean, default: true)

  prop(has_other_button_group, :boolean, default: true)
  prop(has_other_left_button, :boolean, default: true)
  prop(has_other_right_button, :boolean, default: true)

  prop(change_title, :event)
  prop(change_default_title, :event)
  prop(change_description, :event)
  prop(header_change, :event)

  prop(title, :string)
  prop(default_title, :string)
  prop(description, :string)
  prop(tab_index, :integer)

  def render(assigns) do
    ~F"""
    <Card>
      <:title>Header customization playground</:title>
      <:description>Witness the adaptability of Moon's headers across different screen dimensions. Explore the options available and find the perfect fit for your BackOffice environment.</:description>

      <Tabs id="header_options" class="pb-4" on_change={@header_change} selected={@tab_index}>
        <Tabs.List>
          <Tabs.Tab class="hover:text-roshi after:bg-roshi" selected_class="text-roshi after:scale-x-100">Header with all options</Tabs.Tab>
          <Tabs.Tab class="hover:text-roshi after:bg-roshi" selected_class="text-roshi after:scale-x-100">Header with title only</Tabs.Tab>
        </Tabs.List>
        <Tabs.Panels>
          <Tabs.Panel>
            <HeaderOptions.Default
              {=@has_breadcrumbs}
              {=@has_button_group}
              {=@has_left_button}
              {=@has_right_button}
              {=@change_default_title}
              {=@change_description}
              {=@default_title}
              {=@description}
            />
          </Tabs.Panel>
          <Tabs.Panel>
            <HeaderOptions.TitleOnly
              {=@has_other_button_group}
              {=@has_other_left_button}
              {=@has_other_right_button}
              {=@change_title}
              {=@title}
            />
          </Tabs.Panel>
        </Tabs.Panels>
      </Tabs>
    </Card>
    """
  end
end
