defmodule MoonWeb.Pages.Components.TextPage do
  use MoonWeb, :live_view
  alias Moon.Components.Link
  alias Moon.Components.Stack
  alias Moon.Components.Text
  alias Moon.Components.CodePreview

  def mount(params, _session, socket) do
    {:ok,
     assign(socket, theme_name: params["theme_name"] || "sportsbet-dark", active_page: __MODULE__)}
  end

  def render(assigns) do
    ~H"""
    <h1>Text</h1>
    <p>We treat semantic and visual/cosmetic decisions as two totally <Link to="https://csswizardry.com/2016/02/managing-typography-on-large-apps/">separate</Link> things.</p>
    <p>Our choice of p and span is a purely semantic decision, and doesn't impact cosmetics configured via the size prop.</p>

    <h2>Sizes</h2>
    <p>We have predefined font sizes: 10 | 12 | 14 | 16 | 18 | 20 | 24 | 32 | 48 | 56 | 64 | 72. Line heights are calculated automatically based on font size.</p>
    <p>By default font size is 16. You can choose any size.</p>

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

    <h2>Bold</h2>
    <p>By default font weight is regular. You can make it bolder.</p>

    <Stack>
      <Text size=24>Text with default font weight</Text>
      <Text size=24 is_bold=true>
        Text with font-weight: semibold
      </Text>
    </Stack>

    <#CodePreview>
      <Stack>
        <Text size=24>Text with default font weight</Text>
        <Text size=24 is_bold=true>
          Text with font-weight: semibold
        </Text>
      </Stack>
    </#CodePreview>

    <h2>Color</h2>

    <Stack>
      <Text size=24>Text with default color</Text>
      <Text size=24 color="trunks-100">
        Text with defined color
      </Text>
      <Text size=24 color="piccolo-100">
        Text with defined color
      </Text>
      <Text size=24 color="krillin-100">
        Text with defined color
      </Text>
    </Stack>

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
    """
  end
end
