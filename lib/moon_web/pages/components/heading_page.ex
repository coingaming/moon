defmodule MoonWeb.Pages.Components.HeadingPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias Moon.Autolayouts.TopToDown
  alias Moon.Autolayouts.TopToDown
  alias Moon.Components.CodePreview
  alias Moon.Components.Heading
  alias Moon.Components.Link
  alias MoonWeb.Components.ExampleAndCode
  alias MoonWeb.Components.Page

  data(breadcrumbs, :any,
    default: [
      %{
        to: "#",
        name: "Components"
      },
      %{
        to: "/components/heading",
        name: "Heading"
      }
    ]
  )

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
        <Heading size={56} class="mb-4">Heading</Heading>
        <p>
          <Link to="https://www.figma.com/file/S3q1SkVngbwHuwpxHKCsgtJj/Moon---Components?node-id=27856%3A9609">Figma design</Link>
          <Link to="https://github.com/coingaming/moon/blob/main/lib/moon_web/pages/components/heading_page.ex">Sourcecode of this page</Link>
          <Link to="https://moon.io/typography">React implementation</Link>
        </p>

        <ExampleAndCode title="Sizes" id="heading_1">
          <:note>
            <p>We have predefined font sizes: 16 | 18 | 20 | 24 | 32 | 48 | 56 | 64 | 72. Line heights are calculated automatically based on font size.</p>
            <p>By default font size is 16. You can choose any size.</p>
          </:note>
          <:example>
            <TopToDown>
              <Heading>Heading with default font size</Heading>
              <Heading size={16}>Heading with font size 16</Heading>
              <Heading size={18}>Heading with font size 18</Heading>
              <Heading size={20}>Heading with font size 20</Heading>
              <Heading size={24}>Heading with font size 24</Heading>
              <Heading size={32}>Heading with font size 32</Heading>
              <Heading size={48}>font size 48</Heading>
              <Heading size={56}>font size 56</Heading>
              <Heading size={64}>font size 64</Heading>
              <Heading size={72}>font size 72</Heading>
            </TopToDown>
          </:example>

          <:code>
            <#CodePreview>
      <TopToDown>
        <Heading>Heading with default font size</Heading>
        <Heading size=16>Heading with font size 16</Heading>
        <Heading size=18>Heading with font size 18</Heading>
        <Heading size=20>Heading with font size 20</Heading>
        <Heading size=24>Heading with font size 24</Heading>
        <Heading size=32>Heading with font size 32</Heading>
        <Heading size=48>font size 48</Heading>
        <Heading size=56>font size 56</Heading>
        <Heading size=64>font size 64</Heading>
        <Heading size=72>font size 72</Heading>
      </TopToDown>
    </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode title="Is regular" id="heading_2">
          <:note>
            By default font weight is bold. You can make it thiner.
          </:note>
          <:example>
            <TopToDown>
              <Heading size={24}>Heading with default font weight</Heading>
              <Heading size={24} is_regular>
                Heading with font-weight: regular
              </Heading>
            </TopToDown>
          </:example>

          <:code>
            <#CodePreview>
      <TopToDown>
        <Heading size=24>Heading with default font weight</Heading>
        <Heading size=24 is_regular=true>
          Heading with font-weight: regular
        </Heading>
      </TopToDown>
    </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode title="Color" id="heading_3">
          <:note>
            By default Heading color is bulma.100. You can use any color.
          </:note>

          <:example>
            <TopToDown>
              <Heading size={24}>Heading with default color</Heading>
              <Heading size={24} color="trunks-100">
                Heading with defined color
              </Heading>
              <Heading size={24} color="piccolo-100">
                Heading with defined color
              </Heading>
              <Heading size={24} color="krillin-100">
                Heading with defined color
              </Heading>
            </TopToDown>
          </:example>

          <:code>
            <#CodePreview>
      <TopToDown>
        <Heading size=24>Heading with default color</Heading>
        <Heading size=24 color="trunks-100">
          Heading with defined color
        </Heading>
        <Heading size=24 color="piccolo-100">
          Heading with defined color
        </Heading>
        <Heading size=24 color="krillin-100">
          Heading with defined color
        </Heading>
      </TopToDown>
    </#CodePreview>
          </:code>
        </ExampleAndCode>
      </TopToDown>
    </Page>
    """
  end
end
