defmodule MoonWeb.Pages.Assets.PatternsPage do
  use MoonWeb, :live_view

  alias MoonWeb.Components.Breadcrumbs
  alias Moon.Autolayouts.TopToDown
  alias Moon.Components.Heading
  alias MoonWeb.Components.ExampleAndCode
  alias Moon.Components.CodePreview
  alias Moon.Assets.Patterns
  alias MoonWeb.Components.Footer

  data breadcrumbs, :any,
    default: [
      %{
        to: "#",
        name: "Assets"
      },
      %{
        to: "/assets/patterns",
        name: "Patterns"
      }
    ]

  alias Patterns.PatternCircles
  alias Patterns.PatternLines
  alias Patterns.PatternRipple
  alias Patterns.PatternSpeed
  alias Patterns.PatternStars
  alias Patterns.PatternWave

  def mount(params, _session, socket) do
    {:ok,
     assign(socket, theme_name: params["theme_name"] || "sportsbet-dark", active_page: __MODULE__)}
  end

  def handle_params(_params, uri, socket) do
    {:noreply, assign(socket, uri: uri)}
  end

  def render(assigns) do
    ~F"""
    <TopToDown>
      <Breadcrumbs theme_name={@theme_name} breadcrumbs={@breadcrumbs} class="mb-2" />
      <Heading size={56} class="mb-4">Patterns</Heading>

      <ExampleAndCode id="pattern_1" class="mt-4">
        <:example>
          <PatternCircles font_size="10rem" />
        </:example>

        <:code>
          <#CodePreview>
            <PatternCircles font_size="10rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="pattern_2" class="mt-4">
        <:example>
          <PatternLines font_size="10rem" />
        </:example>

        <:code>
          <#CodePreview>
            <PatternLines font_size="10rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="pattern_3" class="mt-4">
        <:example>
          <PatternRipple font_size="10rem" />
        </:example>

        <:code>
          <#CodePreview>
            <PatternRipple font_size="10rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="pattern_4" class="mt-4">
        <:example>
          <PatternSpeed font_size="10rem" />
        </:example>

        <:code>
          <#CodePreview>
            <PatternSpeed font_size="10rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="pattern_5" class="mt-4">
        <:example>
          <PatternStars font_size="10rem" />
        </:example>

        <:code>
          <#CodePreview>
            <PatternStars font_size="10rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode id="pattern_6" class="mt-4">
        <:example>
          <PatternWave font_size="10rem" />
        </:example>

        <:code>
          <#CodePreview>
            <PatternWave font_size="10rem" />
          </#CodePreview>
        </:code>
      </ExampleAndCode>

      <Footer />
    </TopToDown>
    """
  end
end
