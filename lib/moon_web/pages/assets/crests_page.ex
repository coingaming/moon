defmodule MoonWeb.Pages.Assets.CrestsPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias Moon.Assets.Crests
  alias Moon.Autolayouts.TopToDown
  alias Moon.Components.CodePreview
  alias Moon.Components.Heading
  alias MoonWeb.Components.ExampleAndCode
  alias MoonWeb.Components.Page

  data breadcrumbs, :any,
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

  alias Crests.CrestArsenal
  alias Crests.CrestFlamengo
  alias Crests.CrestSaoPaulo
  alias Crests.CrestSouthampton
  alias Crests.CrestWatford

  def mount(params, _session, socket) do
    {:ok,
     assign(socket, theme_name: params["theme_name"] || "sportsbet-dark", active_page: __MODULE__)}
  end

  def handle_params(_params, uri, socket) do
    {:noreply, assign(socket, uri: uri)}
  end

  def render(assigns) do
    ~F"""
    <Page theme_name={@theme_name} active_page={@active_page} breadcrumbs={@breadcrumbs}>
      <TopToDown>
        <Heading size={56} class="mb-4">Crests</Heading>

        <ExampleAndCode id="crest_1" class="mt-4">
          <:example>
            <CrestArsenal font_size="10rem" />
          </:example>

          <:code>
            <#CodePreview>
              <CrestArsenal font_size="10rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="crest_2" class="mt-4">
          <:example>
            <CrestFlamengo font_size="10rem" />
          </:example>

          <:code>
            <#CodePreview>
              <CrestFlamengo font_size="10rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="crest_3" class="mt-4">
          <:example>
            <CrestSaoPaulo font_size="10rem" />
          </:example>

          <:code>
            <#CodePreview>
              <CrestSaoPaulo font_size="10rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="crest_4" class="mt-4">
          <:example>
            <CrestSouthampton font_size="10rem" />
          </:example>

          <:code>
            <#CodePreview>
              <CrestSouthampton font_size="10rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="crest_5" class="mt-4">
          <:example>
            <CrestWatford font_size="10rem" />
          </:example>

          <:code>
            <#CodePreview>
              <CrestWatford font_size="10rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>
      </TopToDown>
    </Page>
    """
  end
end
