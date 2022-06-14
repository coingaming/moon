defmodule MoonWeb.Pages.Components.ButtonPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias Moon.Autolayouts.LeftToRight
  alias Moon.Autolayouts.TopToDown
  alias Moon.Components.Button
  alias Moon.Components.Heading
  alias Moon.Components.Link
  alias MoonWeb.Components.ExampleAndCode
  alias MoonWeb.Components.Page
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

  data props_info_array, :list,
    default: [
      %{
        :name => 'variant',
        :type => 'primary | secondary | tertiary | ghost | link (deprecated) | none (deprecated)',
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
    ]

  def mount(params, _session, socket) do
    {:ok,
     assign(socket,
       theme_name: params["theme_name"] || "moon-design-light",
       active_page: __MODULE__
     )}
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

        <Context put={theme_class: @theme_name}>
          <ExampleAndCode title="Variants" id="button1">
            <:note>
              Primary variant is used where the the button would be the main call to action on the page.
            </:note>

            <:example>
              <div class="flex gap-4 justify-items-center justify-evenly">
                <Button>Primary (default)</Button>
                <Button variant="secondary">Secondary</Button>
                <Button variant="tertiary">Tertiary</Button>
                <Button variant="ghost">Ghost</Button>
              </div>
            </:example>

            <:code>{button_1_code()}</:code>
          </ExampleAndCode>

          <ExampleAndCode title="Sizes" id="button2">
            <:example>
              <LeftToRight gap="gap-4 justify-items-center justify-evenly" centered>
                <Button variant="primary" size="xsmall">xSmall</Button>
                <Button variant="primary" size="small">Small</Button>
                <Button variant="primary" size="medium">Medium (Default)</Button>
                <Button variant="primary" size="large">Large</Button>
                <Button variant="primary" size="xlarge">xLarge</Button>
              </LeftToRight>
            </:example>

            <:code>{button_2_code()}</:code>
          </ExampleAndCode>

          <ExampleAndCode title="Icons" id="button3">
            <:example>
              <LeftToRight class="justify-items-center justify-evenly items-center">
                <Button left_icon="arrows_left" variant="primary">Left Icon</Button>
                <Button right_icon="arrows_right" variant="primary">Right Icon</Button>
                <Button variant="primary" left_icon="arrows_left" size="small">Left Icon</Button>
                <Button variant="primary" right_icon="arrows_right" size="small">Right Icon</Button>
                <Button variant="primary" right_icon="generic_settings" size="large" />
              </LeftToRight>
            </:example>

            <:code>{button_3_code()}</:code>
          </ExampleAndCode>

          <ExampleAndCode title="Full width" id="button4">
            <:example>
              <Button variant="primary" full_width="true">
                Full Width
              </Button>
            </:example>

            <:code>{button_4_code()}</:code>
          </ExampleAndCode>

          <ExampleAndCode title="Disabled" id="button5">
            <:example>
              <Button variant="primary" disabled="true">
                Disabled
              </Button>
            </:example>

            <:code>{button_5_code()}</:code>
          </ExampleAndCode>

          <ExampleAndCode title="Animation" id="button6">
            <:example>
              Coming soon...
              <LeftToRight gap="gap-4" centered class="mb-6">
              </LeftToRight>
            </:example>

            <:code>
              Coming soon...
            </:code>
          </ExampleAndCode>
        </Context>

        <div>
          <div class="text-bulma-100 items-center text-moon-20 font-normal my-4">Props</div>
          <Table items={@props_info_array}>
            <Column name="name" label="Name" :let={item: item} is_row_header>
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

  def button_1_code do
    """
      <Button>Primary (default)</Button>
      <Button variant="secondary">Secondary</Button>
      <Button variant="tertiary">Tertiary</Button>
      <Button variant="ghost">Ghost</Button>
    """
  end

  def button_2_code do
    """
      <Button variant="primary" size="xsmall">xSmall</Button>
      <Button variant="primary" size="small">Small</Button>
      <Button variant="primary" size="medium">Medium (Default)</Button>
      <Button variant="primary" size="large">Large</Button>
      <Button variant="primary" size="xlarge">xLarge</Button>
    """
  end

  def button_3_code do
    """
      <Button left_icon="arrows_left" variant="primary">Left Icon</Button>
      <Button right_icon="arrows_right" variant="primary">Right Icon</Button>
      <Button variant="primary" left_icon="arrows_left" size="small">Left Icon</Button>
      <Button variant="primary" right_icon="arrows_right" size="small">Right Icon</Button>
      <Button variant="primary" right_icon="generic_settings" size="large" />
    """
  end

  def button_4_code do
    """
    <Button variant="primary" full_width="true">
      Full Width
    </Button>
    """
  end

  def button_5_code do
    """
      <Button variant="primary" disabled="true">
        Disabled
      </Button>
    """
  end
end
