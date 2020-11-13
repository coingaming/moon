defmodule MoonWeb.Pages.Components.TextPage do
  use Moon.LiveView
  use Moon.Components.Context

  alias MoonWeb.Layouts.DefaultLayout
  alias Moon.Themed
  alias Moon.Components.Stack
  alias Moon.Components.Text
  alias Moon.Components.CodePreview

  data(theme, :any, default: Moon.Themes.SportsbetLight.get_config())

  def render(assigns) do
    ~H"""
    <Themed theme={{ @theme }}>
      <DefaultLayout id="moondocs" user_token={{ "user_token" }}>
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
      </DefaultLayout>
    </Themed>
    """
  end
end
