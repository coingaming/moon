defmodule MoonWeb.Pages.Components.HeadingPage do
  use MoonWeb, :live_view
  alias Moon.Components.Stack
  alias Moon.Components.CodePreview
  alias Moon.Autolayouts.TopToDown
  alias Moon.Components.Heading
  alias Moon.Components.Link
  alias MoonWeb.Components.ExampleAndCode

  def mount(params, _session, socket) do
    {:ok,
     assign(socket, theme_name: params["theme_name"] || "sportsbet-dark", active_page: __MODULE__)}
  end

  def render(assigns) do
    ~F"""
    <TopToDown>
      <Heading size={32}>Heading</Heading>
      <p>
        <Link to="https://www.figma.com/file/S3q1SkVngbwHuwpxHKCsgtJj/Moon---Components?node-id=27856%3A9609">Figma design</Link>
        <Link to="https://github.com/coingaming/moon/blob/master/lib/moon_web/pages/components/heading_page.ex">Sourcecode of this page</Link>
        <Link to="https://moon.io/typography">React implementation</Link>
      </p>

      <Heading size={24} class="mt-4" is_regular>Usage</Heading>

      <Heading size={20} class="mt-4">Sizes</Heading>
      <p>We have predefined font sizes: 16 | 18 | 20 | 24 | 32 | 48 | 56 | 64 | 72. Line heights are calculated automatically based on font size.</p>
      <p>By default font size is 16. You can choose any size.</p>

      <ExampleAndCode>
        <:example>
          <Stack>
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
          </Stack>
        </:example>

        <:code>
          <#CodePreview>
      <Stack>
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
      </Stack>
    </#CodePreview>
        </:code>
      </ExampleAndCode>

      <Heading size={20} class="mt-4">Is regular</Heading>
      <p>By default font weight is bold. You can make it thiner.</p>

      <ExampleAndCode>
        <:example>
          <Stack>
            <Heading size={24}>Heading with default font weight</Heading>
            <Heading size={24} is_regular>
              Heading with font-weight: regular
            </Heading>
          </Stack>
        </:example>

        <:code>
          <#CodePreview>
      <Stack>
        <Heading size=24>Heading with default font weight</Heading>
        <Heading size=24 is_regular=true>
          Heading with font-weight: regular
        </Heading>
      </Stack>
    </#CodePreview>
        </:code>
      </ExampleAndCode>

      <Heading size={20} class="mt-4">Color</Heading>

      <p>By default Heading color is bulma.100. You can use any color.</p>

      <ExampleAndCode>
        <:example>
          <Stack>
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
          </Stack>
        </:example>

        <:code>
          <#CodePreview>
      <Stack>
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
      </Stack>
    </#CodePreview>
        </:code>
      </ExampleAndCode>
    </TopToDown>
    """
  end
end
