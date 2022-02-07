defmodule MoonWeb.Pages.Components.ButtonPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias Moon.Autolayouts.LeftToRight
  alias Moon.Autolayouts.TopToDown
  alias Moon.Components.Button
  alias Moon.Components.CodePreview
  alias Moon.Components.Heading
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
        to: "/components/button",
        name: "Button"
      }
    ]

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
        <h1>IFrame</h1>
        <iframe src="https://fast-rat-41.loca.lt/aposta10-dark/iframe/button" />
        <Heading size={56} class="mb-4">Button</Heading>
        <p>
          <Link to="https://www.figma.com/file/d5oitzaWXGiOuMjKDatC1W/Lab---Templates?node-id=305%3A2562">Figma design</Link>
          <Link to="https://github.com/coingaming/moon/blob/master/lib/moon_web/pages/components/button_page.ex">Sourcecode of this page</Link>
          <Link to="https://moon.io/components/button">React implementation</Link>
        </p>

        <Heading size={18} class="mt-4" is_regular>Variants</Heading>

        <ExampleAndCode title="Button Fill" id="button1">
          <:note>
            To be used where the the button would be the main call to action on the page.
          </:note>

          <:example>
            <Button variant="fill">Fill</Button>
          </:example>

          <:code>
            <#CodePreview>
        <Button variant="fill">Fill</Button>
        </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode title="Button Outline" id="button2">
          <:note>
            To be used where the the button would be a optional call to action.
          </:note>
          <:example>
            <Button variant="outline">Outline</Button>
          </:example>

          <:code>
            <#CodePreview>
        <Button variant="outline">Outline</Button>
        </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode title="Link" id="button3">
          <:note>
            To be used where the the button is a link
          </:note>
          <:example>
            <Button variant="link">Link</Button>
          </:example>

          <:code>
            <#CodePreview>
        <Button variant="link">Link</Button>
        </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode title="Leading and trailing icons" id="button4">
          <:example>
            <LeftToRight class="items-center">
              <Button left_icon="arrows_left" variant="primary">Left Icon</Button>
              <Button right_icon="arrows_right" variant="primary">Right Icon</Button>
            </LeftToRight>
          </:example>

          <:code>
            <#CodePreview>
        <Button left_icon="arrows_left" variant="primary">Left Icon</Button>
        <Button right_icon="arrows_right" variant="primary">Right Icon</Button>
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode title="Button Sizes" id="button5">
          <:example>
            Fill
            <LeftToRight gap="gap-4" centered class="mb-6">
              <Button variant="fill" size="xsmall">Xsmall</Button>
              <Button variant="fill" size="small">Small</Button>
              <Button variant="fill" size="medium">Medium</Button>
              <Button variant="fill" size="large">Large</Button>
            </LeftToRight>

            With icons
            <LeftToRight gap="gap-4" centered class="mb-6">
              <Button left_icon="chart_bar" variant="fill" size="xsmall">Xsmall</Button>
              <Button left_icon="chart_line" variant="fill" size="small">Small</Button>
              <Button left_icon="chart_pie_chart" variant="fill" size="medium">Medium</Button>
              <Button left_icon="chart_round" variant="fill" size="large">Large</Button>
            </LeftToRight>

            Outline
            <LeftToRight gap="gap-4" centered class="mb-6">
              <Button variant="outline" size="xsmall">Xsmall</Button>
              <Button variant="outline" size="small">Small</Button>
              <Button variant="outline" size="medium">Medium</Button>
              <Button variant="outline" size="large">Large</Button>
            </LeftToRight>

            Link
            <LeftToRight gap="gap-4" centered>
              <Button variant="link" size="xsmall">Xsmall</Button>
              <Button variant="link" size="small">Small</Button>
              <Button variant="link" size="medium">Medium</Button>
              <Button variant="link" size="large">Large</Button>
            </LeftToRight>
          </:example>

          <:code>
            <#CodePreview>
        <Button variant="fill" size="xsmall">Xsmall</Button>
        <Button variant="fill" size="small">Small</Button>
        <Button variant="fill" size="medium">Medium</Button>
        <Button variant="fill" size="large">Large</Button>
      </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode title="Full width" id="button6">
          <:example>
            <Button variant="fill" full_width="true">
              Full Width
            </Button>
          </:example>

          <:code>
            <#CodePreview>
          <Button variant="fill" full_width="true">
            Full Width
          </Button>
          </#CodePreview>
          </:code>
        </ExampleAndCode>
      </TopToDown>
    </Page>
    """
  end
end
