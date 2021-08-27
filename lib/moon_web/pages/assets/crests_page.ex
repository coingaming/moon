defmodule MoonWeb.Pages.Assets.CrestsPage do
  use MoonWeb, :live_view

  alias MoonWeb.Components.ExampleAndCode
  alias Moon.Components.CodePreview
  alias Moon.Autolayouts.TopToDown

  alias Moon.Assets.Crests
  alias Crests.CrestArsenal
  alias Crests.CrestFlamengo
  alias Crests.CrestSaoPaulo
  alias Crests.CrestSouthampton
  alias Crests.CrestWatford
  alias MoonWeb.Components.Breadcrumbs

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
     assign(socket, theme_name: params["theme_name"] || "sportsbet-dark", active_page: __MODULE__)}
  end

  def render(assigns) do
    ~F"""
    <TopToDown>
      <Breadcrumbs breadcrumbs={@breadcrumbs} class="mb-2" />
      <ExampleAndCode class="mt-4">
        <:example>
          <CrestArsenal font_size="10rem" />
        </:example>

        <:code>
          <#CodePreview>
        <CrestArsenal font_size="10rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <CrestFlamengo font_size="10rem" />
        </:example>

        <:code>
          <#CodePreview>
        <CrestFlamengo font_size="10rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <CrestSaoPaulo font_size="10rem" />
        </:example>

        <:code>
          <#CodePreview>
        <CrestSaoPaulo font_size="10rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <CrestSouthampton font_size="10rem" />
        </:example>

        <:code>
          <#CodePreview>
        <CrestSouthampton font_size="10rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
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
    """
  end
end
