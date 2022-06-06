defmodule MoonWeb.Pages.Components.CardPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias Moon.Autolayouts.TopToDown
  alias Moon.Components.Card
  alias Moon.Components.CodePreview
  alias Moon.Components.Heading
  alias Moon.Components.IconButton
  alias Moon.Components.Link
  alias MoonWeb.Components.ExampleAndCode
  alias MoonWeb.Components.Page

  data breadcrumbs, :any,
    default: [
      %{
        to: "#",
        name: "Components"
      },
      %{
        to: "/components/card",
        name: "Card"
      }
    ]

  def mount(params, _session, socket) do
    socket =
      assign(socket,
        theme_name: params["theme_name"] || "moon-design-light",
        active_page: __MODULE__
      )

    {:ok, socket}
  end

  def handle_params(_params, uri, socket) do
    {:noreply, assign(socket, uri: uri)}
  end

  def render(assigns) do
    ~F"""
    <Page theme_name={@theme_name} active_page={@active_page} breadcrumbs={@breadcrumbs}>
      <TopToDown>
        <Heading size={56} class="mb-4">Card</Heading>

        <p>
          <Link to="https://github.com/coingaming/moon/blob/main/lib/moon_web/pages/components/card_page.ex">Sourcecode of this page</Link>
        </p>

        <ExampleAndCode id="card_1" theme_name={@theme_name}>
          <:example>
            <Card title="Winers">
              <:buttons>
                <IconButton
                  id="winers-arrows-update"
                  icon_name="arrows_update"
                  height={8}
                  width={8}
                  hover_bg_color="bg-goku-100"
                />
                <IconButton icon_name="controls_expand" height={8} width={8} hover_bg_color="bg-goku-100" />
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
                  <IconButton icon_name="arrows_update" height={8} width={8} hover_bg_color="bg-goku-100" />
                  <IconButton icon_name="controls_expand" height={8} width={8} hover_bg_color="bg-goku-100" />
                </:buttons>
                <:content>
                  {Faker.Lorem.paragraph()}
                </:content>
              </Card>
            </#CodePreview>
          </:code>
        </ExampleAndCode>
      </TopToDown>
    </Page>
    """
  end
end
