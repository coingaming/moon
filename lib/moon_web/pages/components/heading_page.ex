defmodule MoonWeb.Pages.Components.HeadingPage do
  use MoonWeb, :live_view
  alias Moon.Components.Link
  alias Moon.Components.Stack
  alias Moon.Components.Heading
  alias Moon.Components.CodePreview

  def mount(params, _session, socket) do
    {:ok, assign(socket, theme_name: params["theme_name"] || "sportsbet-dark", active_page: __MODULE__)}
  end

  def render(assigns) do
    ~H"""
    <h1>Heading</h1>

    <h2>Sizes</h2>
    <p>We have predefined font sizes: 16 | 18 | 20 | 24 | 32 | 48 | 56 | 64 | 72. Line heights are calculated automatically based on font size.</p>
    <p>By default font size is 16. You can choose any size.</p>

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

    <h2>Is regular</h2>
    <p>By default font weight is bold. You can make it thiner.</p>

    <Stack>
      <Heading size=24>Heading with default font weight</Heading>
      <Heading size=24 is_regular=true>
        Heading with font-weight: regular
      </Heading>
    </Stack>

    <#CodePreview>
      <Stack>
        <Heading size=24>Heading with default font weight</Heading>
        <Heading size=24 is_regular=true>
          Heading with font-weight: regular
        </Heading>
      </Stack>
    </#CodePreview>

    <h2>Color</h2>

    <p>By default Heading color is bulma.100. You can use any color.</p>

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
    """
  end
end
