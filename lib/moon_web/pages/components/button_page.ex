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
  alias Moon.Icons.GenericSettings
  alias MoonWeb.Components.Table.Table
  alias MoonWeb.Components.Table.Column

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
        <Heading size={56} class="mb-4">Button</Heading>
        <p>
          <Link to="https://www.figma.com/file/d5oitzaWXGiOuMjKDatC1W/Lab---Templates?node-id=305%3A2562">Figma design</Link>
          <Link to="https://github.com/coingaming/moon/blob/main/lib/moon_web/pages/components/button_page.ex">Sourcecode of this page</Link>
          <Link to="https://moon.io/components/button">React implementation</Link>
        </p>

        <ExampleAndCode title="Variants" id="button0">
          <:note>
            To be used where the the button would be the main call to action on the page.
          </:note>

          <:example>
            <div class="flex gap-4 justify-items-center justify-evenly">
              <Button>Primary (default)</Button>
              <Button variant="secondary">Secondary</Button>
              <Button variant="tertiary">Tertiary</Button>
              <Button variant="ghost">Ghost</Button>
            </div>
          </:example>

          <:code>
            <#CodePreview>
              <Button>Primary (default)</Button>
              <Button variant="secondary">Secondary</Button>
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode title="Sizes" id="button2">
          <:example>
            <LeftToRight gap="gap-4 justify-items-center justify-evenly" centered class="mb-6">
              <Button variant="primary" size="xsmall">Xsmall</Button>
              <Button variant="primary" size="small">Small</Button>
              <Button variant="primary" size="medium">Medium</Button>
              <Button variant="primary" size="large">Large</Button>
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

        <ExampleAndCode title="Icons" id="button4">
          <:example>
            <LeftToRight class="justify-items-center justify-evenly">
              <Button left_icon="arrows_left" variant="primary">Left Icon</Button>
              <Button right_icon="arrows_right" variant="primary">Right Icon</Button>
              <Button variant="primary"><GenericSettings /> Left Icon</Button>
              <Button variant="primary">Right Icon <GenericSettings /></Button>
            </LeftToRight>
          </:example>

          <:code>
            <#CodePreview>
              <Button left_icon="arrows_left" variant="primary">Left Icon</Button>
              <Button right_icon="arrows_right" variant="primary">Right Icon</Button>
              <Button variant="primary"><GenericSettings /> Left Icon</Button>
              <Button variant="primary">Right Icon <GenericSettings /></Button>
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode title="Full width" id="button6">
          <:example>
            <Button variant="primary" full_width="true">
              Full Width
            </Button>
          </:example>

          <:code>
            <#CodePreview>
          <Button variant="primary" full_width="true">
            Full Width
          </Button>
          </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode title="Animation" id="button5">
          <:example>
            Coming soon...
            <LeftToRight gap="gap-4" centered class="mb-6">
            </LeftToRight>
          </:example>

          <:code>
            <#CodePreview>
              Coming soon...
            </#CodePreview>
          </:code>
        </ExampleAndCode>

        <div>
          <div class="text-bulma-100 items-center text-xl leading-7 font-normal my-4">Props</div>
          <Table items={[
            %{
              :name => 'variant',
              :type => 'primary | secondary | tertiary | ghost | link (deprecated)',
              :required => 'false',
              :default => 'primary',
              :description => 'Visual/Logical variant of Button'
            },
            %{
              :name => 'size',
              :type => 'xsmall | small | medium | large | xlarge',
              :required => 'false',
              :default => 'medium',
              :description => 'Size of Button'
            },
            %{
              :name => 'left_icon',
              :type => 'string',
              :required => 'false',
              :default => '-',
              :description => 'Asset name for the left icon'
            },
            %{
              :name => 'right_icon',
              :type => 'string',
              :required => 'false',
              :default => '-',
              :description => 'Asset name for the right icon'
            },
            %{
              :name => 'fullWidth',
              :type => 'boolean',
              :required => 'false',
              :default => 'false',
              :description => 'Full width Button'
            },
            %{
              :name => 'disabled',
              :type => 'boolean',
              :required => 'false',
              :default => 'false',
              :description => 'Disabled Button'
            }
          ]}>
            <Column name="name" label="Name" :let={item: item}>
              {item.name}
            </Column>
            <Column name="type" label="Type" :let={item: item}>
              {item.type}
            </Column>
            <Column name="required" label="Required" :let={item: item}>
              {item.required}
            </Column>
            <Column name="default" label="Default" :let={item: item}>
              {item.default}
            </Column>
            <Column name="description" label="Description" :let={item: item}>
              {item.description}
            </Column>
          </Table>
        </div>
      </TopToDown>
    </Page>
    """
  end
end
