defmodule MoonWeb.Pages.Components.TextPage do
  use MoonWeb, :live_view
  alias Moon.Components.Stack
  alias Moon.Components.Text
  alias Moon.Components.CodePreview
  alias Moon.Autolayouts.TopToDown
  alias Moon.Components.Heading
  alias Moon.Components.Link
  alias MoonWeb.Components.ExampleAndCode

  def mount(params, _session, socket) do
    {:ok,
     assign(socket, theme_name: params["theme_name"] || "sportsbet-dark", active_page: __MODULE__)}
  end

  @spec render(any) :: Phoenix.LiveView.Rendered.t()
  def render(assigns) do
    ~F"""
    <TopToDown>
      <Heading size={32}>Text</Heading>
      <p>
        <Link to="https://www.figma.com/file/S3q1SkVngbwHuwpxHKCsgtJj/Moon---Components?node-id=27856%3A9609">Figma design</Link>
        <Link to="https://github.com/coingaming/moon/blob/master/lib/moon_web/pages/components/text_page.ex">Sourcecode of this page</Link>
        <Link to="https://moon.io/typography">React implementation</Link>
      </p>

      <Heading size={24} class="mt-4" is_regular>Usage</Heading>
      <p>We treat semantic and visual/cosmetic decisions as two totally <Link to="https://csswizardry.com/2016/02/managing-typography-on-large-apps/">separate</Link> things.</p>
      <p>Our choice of p and span is a purely semantic decision, and doesn't impact cosmetics configured via the size prop.</p>

      <Heading size={20} class="mt-4">Sizes</Heading>
      <p>We have predefined font sizes: 10 | 12 | 14 | 16 | 18 | 20 | 24 | 32 | 48 | 56 | 64 | 72. Line heights are calculated automatically based on font size.</p>
      <p>By default font size is 16. You can choose any size.</p>

      <ExampleAndCode>
        <:example>
          <Stack>
            <Stack>
              <Text>Text with default font size</Text>
              <Text size={10}>Text with font size 10</Text>
              <Text size={12}>Text with font size 12</Text>
              <Text size={14}>Text with font size 14</Text>
              <Text size={16}>Text with font size 16</Text>
              <Text size={18}>Text with font size 18</Text>
              <Text size={20}>Text with font size 20</Text>
              <Text size={24}>Text with font size 24</Text>
              <Text size={32}>Text with font size 32</Text>
              <Text size={48}>font size 48</Text>
              <Text size={56}>font size 56</Text>
              <Text size={64}>font size 64</Text>
              <Text size={72}>font size 72</Text>
            </Stack>
          </Stack>
        </:example>

        <:code>
          <#CodePreview>
      <Stack>
        <Text>Text with default font size</Text>
        <Text size=10>Text with font size 10</Text>
        <Text size=12>Text with font size 12</Text>
        <Text size=14>Text with font size 14</Text>
        <Text size=16>Text with font size 16</Text>
        <Text size=18>Text with font size 18</Text>
        <Text size=20>Text with font size 20</Text>
        <Text size=24>Text with font size 24</Text>
        <Text size=32>Text with font size 32</Text>
        <Text size=48>font size 48</Text>
        <Text size=56>font size 56</Text>
        <Text size=64>font size 64</Text>
        <Text size=72>font size 72</Text>
      </Stack>
    </#CodePreview>
        </:code>
      </ExampleAndCode>

      <Heading size={20} class="mt-4">Bold</Heading>
      <p>By default font weight is regular. You can make it bolder.</p>

      <ExampleAndCode>
        <:example>
          <Stack>
            <Text size={24}>Text with default font weight</Text>
            <Text size={24} is_bold>
              Text with font-weight: semibold
            </Text>
          </Stack>
        </:example>
        <:code>
          <#CodePreview>
      <Stack>
        <Text size=24>Text with default font weight</Text>
        <Text size=24 is_bold=true>
          Text with font-weight: semibold
        </Text>
      </Stack>
    </#CodePreview>
        </:code>
      </ExampleAndCode>

      <Heading size={20} class="mt-4">Color</Heading>
      <ExampleAndCode>
        <:example>
          <Stack>
            <Text size={24}>Text with default color</Text>
            <Text size={24} color="trunks-100">
              Text with defined color
            </Text>
            <Text size={24} color="piccolo-100">
              Text with defined color
            </Text>
            <Text size={24} color="krillin-100">
              Text with defined color
            </Text>
          </Stack>
        </:example>

        <:code>
          <#CodePreview>
      <Stack>
        <Text size=24>Text with default color</Text>
        <Text size=24 color="trunks_100">
          Text with defined color
        </Text>
        <Text size=24 color="piccolo_100">
          Text with defined color
        </Text>
        <Text size=24 color="krillin_100">
          Text with defined color
        </Text>
      </Stack>
    </#CodePreview>
        </:code>
      </ExampleAndCode>
    </TopToDown>
    """
  end
end
