defmodule MoonWeb.Pages.Components.CardPage do
  use MoonWeb, :live_view

  alias MoonWeb.Components.ExampleAndCode
  alias Moon.Assets.Icon
  alias Moon.Components.Card
  alias Moon.Components.CodePreview
  alias Moon.Components.Heading
  alias Moon.Components.MenuButton
  alias Moon.Components.Stack

  def mount(params, _session, socket) do
    socket =
      assign(socket,
        theme_name: params["theme_name"] || "sportsbet-dark",
        active_page: __MODULE__
      )

    {:ok, socket}
  end

  def render(assigns) do
    ~F"""
    <Stack>
      <Heading size={32}>Card</Heading>

      <ExampleAndCode>
        <#template slot="example">
          <Card title="Winers">
            <:buttons>
              <MenuButton height={8} width={8} hover_bg_color="bg-goku-100">
                <Icon name="icon_refresh" />
              </MenuButton>

              <MenuButton height={8} width={8} hover_bg_color="bg-goku-100">
                <Icon name="icon_arrow_diagonals" />
              </MenuButton>
            </:buttons>

            <:content>
              {Faker.Lorem.paragraph()}
            </:content>
          </Card>
        </#template>

        <#template slot="code">
      <#CodePreview>
        alias Moon.Assets.Icon
        alias Moon.Components.Card
        alias Moon.Components.MenuButton

        <Card title="Winers">
          <:buttons>
            <MenuButton height={8} width={8} hover_bg_color="bg-goku-100">
              <Icon name="icon_refresh" />
            </MenuButton>

            <MenuButton height={8} width={8} hover_bg_color="bg-goku-100">
              <Icon name="icon_arrow_diagonals" />
            </MenuButton>
          </:buttons>
          <:content>
            {Faker.Lorem.paragraph()}
          </:content>
        </Card>
      </#CodePreview>
        </#template>
      </ExampleAndCode>
    </Stack>
    """
  end

end
