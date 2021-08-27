defmodule MoonWeb.Pages.Assets.PatternsPage do
  use MoonWeb, :live_view

  alias MoonWeb.Components.ExampleAndCode
  alias Moon.Components.CodePreview
  alias Moon.Autolayouts.TopToDown
  alias MoonWeb.Components.Breadcrumbs

  alias Moon.Assets.Patterns
  alias Patterns.PatternCircles
  alias Patterns.PatternLines
  alias Patterns.PatternRipple
  alias Patterns.PatternSpeed
  alias Patterns.PatternStars
  alias Patterns.PatternWave

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
          <PatternCircles font_size="10rem" />
        </:example>

        <:code>
          <#CodePreview>
        <PatternCircles font_size="10rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <PatternLines font_size="10rem" />
        </:example>

        <:code>
          <#CodePreview>
        <PatternLines font_size="10rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <PatternRipple font_size="10rem" />
        </:example>

        <:code>
          <#CodePreview>
        <PatternRipple font_size="10rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <PatternSpeed font_size="10rem" />
        </:example>

        <:code>
          <#CodePreview>
        <PatternSpeed font_size="10rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <PatternStars font_size="10rem" />
        </:example>

        <:code>
          <#CodePreview>
        <PatternStars font_size="10rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <ExampleAndCode class="mt-4">
        <:example>
          <PatternWave font_size="10rem" />
        </:example>

        <:code>
          <#CodePreview>
        <PatternWave font_size="10rem" />
        </#CodePreview>
        </:code>
      </ExampleAndCode>
    </TopToDown>
    """
  end
end
