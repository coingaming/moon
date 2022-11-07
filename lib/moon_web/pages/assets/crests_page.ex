defmodule MoonWeb.Pages.Assets.CrestsPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias Moon.Assets.Crest
  alias Moon.Autolayouts.TopToDown
  alias Moon.Components.CodePreview
  alias Moon.Components.Heading
  alias MoonWeb.Components.ExampleAndCode
  alias MoonWeb.Components.Page

  data(breadcrumbs, :any,
    default: [
      %{
        to: "#",
        name: "Assets"
      },
      %{
        to: "/assets/crests",
        name: "Crests"
      }
    ]
  )

  def handle_params(_params, uri, socket) do
    {:noreply, assign(socket, uri: uri)}
  end

  def render(assigns) do
    ~F"""
    <Page {=@theme_name} {=@active_page} {=@breadcrumbs} {=@direction}>
      <TopToDown>
        <Heading size={56} class="mb-4">Crests</Heading>

        <ExampleAndCode id="crest_1" class="mt-4">
          <:example>
            <Crest name="CrestArsenal" font_size="10rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Crest name="CrestArsenal" font_size="10rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="crest_2" class="mt-4">
          <:example>
            <Crest name="CrestFlamengo" font_size="10rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Crest name="CrestFlamengo" font_size="10rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="crest_3" class="mt-4">
          <:example>
            <Crest name="CrestSaoPaulo" font_size="10rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Crest name="CrestSaoPaulo" font_size="10rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="crest_4" class="mt-4">
          <:example>
            <Crest name="CrestSouthampton" font_size="10rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Crest name="CrestSouthampton" font_size="10rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="crest_5" class="mt-4">
          <:example>
            <Crest name="CrestWatford" font_size="10rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Crest name="CrestWatford" font_size="10rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>
      </TopToDown>
    </Page>
    """
  end
end
