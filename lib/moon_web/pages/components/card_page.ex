defmodule MoonWeb.Pages.Components.CardPage do
  use MoonWeb, :live_view

  alias MoonWeb.Components.ExampleAndCode
  alias Moon.Autolayouts.TopToDown
  alias Moon.Components.Card
  alias Moon.Components.CodePreview
  alias Moon.Components.Heading
  alias Moon.Components.IconButton

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
    <TopToDown>
      <Heading size={32}>Card</Heading>

      <ExampleAndCode>
        <:example>
          <Card title="Winers">
            <:buttons>
              <IconButton icon_name="icon_refresh" height={8} width={8} hover_bg_color="bg-goku-100" />
              <IconButton icon_name="icon_arrow_diagonals" height={8} width={8} hover_bg_color="bg-goku-100" />
            </:buttons>

            <:content>
              {Faker.Lorem.paragraph()}
            </:content>
          </Card>
        </:example>

        <:code>
          <#CodePreview>
        alias Moon.Components.Card
        alias Moon.Components.IconButton

        <Card title="Winers">
          <:buttons>
            <IconButton icon_name="icon_refresh" height={8} width={8} hover_bg_color="bg-goku-100" />
            <IconButton icon_name="icon_arrow_diagonals" height={8} width={8} hover_bg_color="bg-goku-100" />
          </:buttons>
          <:content>
            {Faker.Lorem.paragraph()}
          </:content>
        </Card>
      </#CodePreview>
        </:code>
      </ExampleAndCode>
    </TopToDown>
    """
  end
end
