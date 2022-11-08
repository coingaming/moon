
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

  def handle_params(_params, uri, socket) do
    {:noreply, assign(socket, uri: uri)}
  end

  def render(assigns) do
    ~F"""
    <Page {=@theme_name} {=@active_page} {=@breadcrumbs} {=@direction}>
      <TopToDown>
      <Heading size={56} class="mb-4">Patterns</Heading>
      
        <ExampleAndCode id="pattern_1" class="mt-4">
          <#template slot="example">
            <Pattern name="PatternCircles" font_size="10rem" />
          </#template>

          <#template slot="code">
            <#CodePreview>
              <Pattern name="PatternCircles" font_size="10rem" />
            </#CodePreview>
          </#template>
        </ExampleAndCode>
      

        <ExampleAndCode id="pattern_2" class="mt-4">
          <#template slot="example">
            <Pattern name="PatternCrosses" font_size="10rem" />
          </#template>

          <#template slot="code">
            <#CodePreview>
              <Pattern name="PatternCrosses" font_size="10rem" />
            </#CodePreview>
          </#template>
        </ExampleAndCode>
      

        <ExampleAndCode id="pattern_3" class="mt-4">
          <#template slot="example">
            <Pattern name="PatternDotted" font_size="10rem" />
          </#template>

          <#template slot="code">
            <#CodePreview>
              <Pattern name="PatternDotted" font_size="10rem" />
            </#CodePreview>
          </#template>
        </ExampleAndCode>
      

        <ExampleAndCode id="pattern_4" class="mt-4">
          <#template slot="example">
            <Pattern name="PatternPerspectiveDotted" font_size="10rem" />
          </#template>

          <#template slot="code">
            <#CodePreview>
              <Pattern name="PatternPerspectiveDotted" font_size="10rem" />
            </#CodePreview>
          </#template>
        </ExampleAndCode>
      

        <ExampleAndCode id="pattern_5" class="mt-4">
          <#template slot="example">
            <Pattern name="PatternRipple" font_size="10rem" />
          </#template>

          <#template slot="code">
            <#CodePreview>
              <Pattern name="PatternRipple" font_size="10rem" />
            </#CodePreview>
          </#template>
        </ExampleAndCode>
      

        <ExampleAndCode id="pattern_6" class="mt-4">
          <#template slot="example">
            <Pattern name="PatternSpeed" font_size="10rem" />
          </#template>

          <#template slot="code">
            <#CodePreview>
              <Pattern name="PatternSpeed" font_size="10rem" />
            </#CodePreview>
          </#template>
        </ExampleAndCode>
      

        <ExampleAndCode id="pattern_7" class="mt-4">
          <#template slot="example">
            <Pattern name="PatternWave" font_size="10rem" />
          </#template>

          <#template slot="code">
            <#CodePreview>
              <Pattern name="PatternWave" font_size="10rem" />
            </#CodePreview>
          </#template>
        </ExampleAndCode>
      
      </TopToDown>
    </Page>
    """
  end
end
    