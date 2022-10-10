defmodule MoonWeb.Pages.Assets.PatternsPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias Moon.Assets.Pattern
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
        to: "/assets/patterns",
        name: "Patterns"
      }
    ]

  def mount(params, _session, socket) do
    {:ok,
     assign(socket,
       theme_name: params["theme_name"] || "moon-design-light",
       direction: params["direction"] || "ltr",
       active_page: __MODULE__
     )}
  end

  def handle_params(_params, uri, socket) do
    {:noreply, assign(socket, uri: uri)}
  end

  def render(assigns) do
    ~F"""
    <Page {=@theme_name} {=@active_page} {=@breadcrumbs} {=@direction}>
      <TopToDown>
        <Heading size={56} class="mb-4">Patterns</Heading>

        <ExampleAndCode id="pattern_1" class="mt-4">
          <:example>
            <Pattern name="pattern_circles" font_size="10rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Pattern name="pattern_circles" font_size="10rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="pattern_2" class="mt-4">
          <:example>
            <Pattern name="pattern_lines" font_size="10rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Pattern name="pattern_lines" font_size="10rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="pattern_3" class="mt-4">
          <:example>
            <Pattern name="pattern_ripple" font_size="10rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Pattern name="pattern_ripple" font_size="10rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="pattern_4" class="mt-4">
          <:example>
            <Pattern name="pattern_speed" font_size="10rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Pattern name="pattern_speed" font_size="10rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="pattern_5" class="mt-4">
          <:example>
            <Pattern name="pattern_stars" font_size="10rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Pattern name="pattern_stars" font_size="10rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode id="pattern_6" class="mt-4">
          <:example>
            <Pattern name="pattern_wave" font_size="10rem" />
          </:example>

          <:code>
            <#CodePreview>
              <Pattern name="pattern_wave" font_size="10rem" />
            </#CodePreview>
          </:code>
        </ExampleAndCode>
      </TopToDown>
    </Page>
    """
  end
end
