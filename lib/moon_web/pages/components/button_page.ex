defmodule MoonWeb.Pages.Components.ButtonPage do
  use MoonWeb, :live_view
  alias Moon.Components.Button
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
      <Heading size={32}>Button</Heading>
      <p>
        <Link to="https://www.figma.com/file/d5oitzaWXGiOuMjKDatC1W/Lab---Templates?node-id=305%3A2562">Figma design</Link>
        <Link to="https://github.com/coingaming/moon/blob/master/lib/moon_web/pages/components/button_page.ex">Sourcecode of this page</Link>
        <Link to="https://moon.io/components/button">React implementation</Link>
      </p>

      <Heading size={18} class="mt-4" is_regular>Variants</Heading>

      <Heading size={24} class="mt-4" is_regular>Button Fill</Heading>

      To be used where the the button would be the main call to action on the page.
      <ExampleAndCode>
        <:example>
          <Button variant="fill">Fill</Button>
        </:example>

        <:code>
          <#CodePreview>
        <Button variant="fill">Fill</Button>
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <Heading size={24} class="mt-4" is_regular>Button Outline</Heading>
      To be used where the the button would be a optional call to action.
      <ExampleAndCode>
        <:example>
          <Button variant="outline">Outline</Button>
        </:example>

        <:code>
          <#CodePreview>
        <Button variant="outline">Outline</Button>
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <Heading size={24} class="mt-4" is_regular>Link</Heading>
      To be used where the the button is a link
      <ExampleAndCode>
        <:example>
          <Button variant="link">Link</Button>
        </:example>

        <:code>
          <#CodePreview>
        <Button variant="link">Link</Button>
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <Heading size={24} class="mt-4" is_regular>Link+Icon</Heading>
      To be used where the the button is a link
      <ExampleAndCode>
        <:example>
          <Button left_icon="icon_profile" variant="link">Link+Icon</Button>
        </:example>

        <:code>
          <#CodePreview>
        <Button left_icon="icon_profile" variant="link">Link+Icon</Button>
        </#CodePreview>
        </:code>
      </ExampleAndCode>

      <Heading size={24} class="mt-4" is_regular>Button Sizes</Heading>
      <ExampleAndCode>
        <:example>
          Fill
          <Button variant="fill" size="xsmall">
            Xsmall
          </Button>
          <Button variant="fill" size="small">
            Small
          </Button>

          <div class="my-8" />

          Outline
          <Button variant="outline" size="xsmall">
            Xsmall
          </Button>
          <Button variant="outline" size="small">
            Small
          </Button>

          <div class="my-8" />

          Link
          <Button variant="link" size="xsmall">
            Xsmall
          </Button>
          <Button variant="link" size="small">
            Small
          </Button>
        </:example>

        <:code>
          <#CodePreview>
        <Button variant="fill" size="xsmall">
        Xsmall
        </Button>
        <Button variant="fill" size="small">
        Small
        </Button>

        <Button variant="outline" size="xsmall">
          Xsmall
        </Button>
        <Button variant="outline" size="small">
          Small
        </Button>

        <Button variant="link" size="xsmall">
          Xsmall
        </Button>
        <Button variant="link" size="small">
          Small
        </Button>
      </#CodePreview>
        </:code>
      </ExampleAndCode>

      <Heading size={24} class="mt-4" is_regular>Full width</Heading>
      <ExampleAndCode>
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
    """
  end
end
