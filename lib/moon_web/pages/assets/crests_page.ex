defmodule MoonWeb.Pages.Assets.CrestsPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias Moon.Assets.Crest
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

  def mount(params, _session, socket) do
    {:ok,
     assign(socket,
       theme_name: params["theme_name"] || "moon-design-light",
       active_page: __MODULE__
     )}
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
            <Crest name="crest_arsenal" font_size="10rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Crest name="crest_arsenal" font_size="10rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="crest_2" class="mt-4">
          <:example>
            <Crest name="crest_flamengo" font_size="10rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Crest name="crest_flamengo" font_size="10rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="crest_3" class="mt-4">
          <:example>
            <Crest name="crest_sao_paulo" font_size="10rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Crest name="crest_sao_paulo" font_size="10rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="crest_4" class="mt-4">
          <:example>
            <Crest name="crest_southampton" font_size="10rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Crest name="crest_southampton" font_size="10rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="crest_5" class="mt-4">
          <:example>
            <Crest name="crest_watford" font_size="10rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Crest name="crest_watford" font_size="10rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>
      </TopToDown>
    </Page>
    """
  end
end
