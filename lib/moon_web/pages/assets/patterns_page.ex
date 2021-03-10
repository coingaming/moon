defmodule MoonWeb.Pages.Assets.PatternsPage do
  use MoonWeb, :live_view

  alias MoonWeb.Components.ExampleAndCode
  alias Moon.Components.CodePreview

  alias Moon.Assets.Patterns
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

  def render(assigns) do
    ~H"""

    <ExampleAndCode class="mt-4">
      <template slot="example">
        <PatternCircles font_size="10rem" />
      </template>

      <template slot="code">
        <#CodePreview>
        <PatternCircles font_size="10rem" />
        </#CodePreview>
      </template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <template slot="example">
        <PatternLines font_size="10rem" />
      </template>

      <template slot="code">
        <#CodePreview>
        <PatternLines font_size="10rem" />
        </#CodePreview>
      </template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <template slot="example">
        <PatternRipple font_size="10rem" />
      </template>

      <template slot="code">
        <#CodePreview>
        <PatternRipple font_size="10rem" />
        </#CodePreview>
      </template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <template slot="example">
        <PatternSpeed font_size="10rem" />
      </template>

      <template slot="code">
        <#CodePreview>
        <PatternSpeed font_size="10rem" />
        </#CodePreview>
      </template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <template slot="example">
        <PatternStars font_size="10rem" />
      </template>

      <template slot="code">
        <#CodePreview>
        <PatternStars font_size="10rem" />
        </#CodePreview>
      </template>
    </ExampleAndCode>


    <ExampleAndCode class="mt-4">
      <template slot="example">
        <PatternWave font_size="10rem" />
      </template>

      <template slot="code">
        <#CodePreview>
        <PatternWave font_size="10rem" />
        </#CodePreview>
      </template>
    </ExampleAndCode>

    """
  end
end
