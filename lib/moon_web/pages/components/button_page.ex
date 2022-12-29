defmodule MoonWeb.Pages.Components.ButtonPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias Moon.Components.Button
  alias MoonWeb.Components.ExampleAndCode
  alias MoonWeb.Components.Page
  alias MoonWeb.Components.ComponentPageDescription
  alias MoonWeb.Components.PropsTable
  alias MoonWeb.Components.Facing.DeprecationWarning

  data(breadcrumbs, :any,
    default: [
      %{
        to: "#",
        name: "Components v1"
      },
      %{
        to: "/components/button",
        name: "Button"
      }
    ]
  )

  data(props_info_array, :list,
    default: [
      %{
        :name => 'animation',
        :type => 'progress | success | error | pulse',
        :required => 'No',
        :default => '-',
        :description => 'Animation of button'
      },
      %{
        :name => 'disabled',
        :type => 'boolean',
        :required => 'No',
        :default => 'false',
        :description => 'Disabled Button'
      },
      %{
        :name => 'full_width',
        :type => 'boolean',
        :required => 'No',
        :default => 'false',
        :description => 'Full width Button'
      },
      %{
        :name => 'left_icon',
        :type => 'string',
        :required => 'No',
        :default => '-',
        :description => 'Asset name for the left icon'
      },
      %{
        :name => 'right_icon',
        :type => 'string',
        :required => 'No',
        :default => '-',
        :description => 'Asset name for the right icon'
      },
      %{
        :name => 'size',
        :type => 'xs | sm | md | lg | xl',
        :required => 'No',
        :default => 'md',
        :description => 'Size of button'
      },
      %{
        :name => 'variant',
        :type => 'primary | secondary | tertiary | ghost | link (deprecated) | none (deprecated)',
        :required => 'No',
        :default => 'primary',
        :description => 'Visual/Logical variant of button'
      }
    ]
  )

  def handle_params(_params, uri, socket) do
    {:noreply, assign(socket, uri: uri)}
  end

  def render(assigns) do
    ~F"""
    <Page {=@theme_name} {=@active_page} {=@breadcrumbs} {=@direction}>
      <ComponentPageDescription title="Button">
        <DeprecationWarning
          name="Button"
          href={live_path(MoonWeb.Endpoint, MoonWeb.Pages.Design.Button.ButtonPage,
            theme_name: @theme_name,
            direction: @direction
          )}
        />
      </ComponentPageDescription>

      <ExampleAndCode title="Default" id="button0">
        <:example>
          <Button>Default</Button>
        </:example>

        <:code>{button_0_code()}</:code>
      </ExampleAndCode>

      <ExampleAndCode title="Variants" id="button1">
        <:example>
          <Button>Primary is default</Button>
          <Button variant="secondary">Secondary</Button>
          <Button variant="tertiary">Tertiary</Button>
          <Button variant="ghost">Ghost</Button>
        </:example>

        <:code>{button_1_code()}</:code>
      </ExampleAndCode>

      <ExampleAndCode title="Sizes" id="button2">
        <:example>
          <Button variant="primary" size="xs">xSmall</Button>
          <Button variant="primary" size="sm">Small</Button>
          <Button variant="primary" size="md">Medium (Default)</Button>
          <Button variant="primary" size="lg">Large</Button>
          <Button variant="primary" size="xl">xLarge</Button>
        </:example>

        <:code>{button_2_code()}</:code>
      </ExampleAndCode>

      <ExampleAndCode title="Icons" id="button3">
        <:example>
          <Button left_icon="arrows_left" variant="primary">Left Icon</Button>
          <Button right_icon="arrows_right" variant="primary">Right Icon</Button>
          <Button variant="primary" left_icon="arrows_left" size="sm">Left Icon</Button>
          <Button variant="primary" right_icon="arrows_right" size="sm">Right Icon</Button>
          <Button variant="primary" icon_only="generic_settings" size="lg" />
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
          <Button animation="progress">Progress</Button>
          <Button animation="success">Success</Button>
          <Button animation="error">Error</Button>
          <Button animation="pulse">Pulse</Button>
        </:example>

        <:code>{button_6_code()}</:code>
      </ExampleAndCode>

      <PropsTable title="Button props" data={@props_info_array} />
    </Page>
    """
  end

  def button_0_code do
    """
    <Button>Default</Button>
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
    <Button variant="primary" size="xs">xSmall</Button>
    <Button variant="primary" size="sm">Small</Button>
    <Button variant="primary" size="md">Medium (Default)</Button>
    <Button variant="primary" size="lg">Large</Button>
    <Button variant="primary" size="xl">xLarge</Button>
    """
  end

  def button_3_code do
    """
    <Button left_icon="arrows_left" variant="primary">Left Icon</Button>
    <Button right_icon="arrows_right" variant="primary">Right Icon</Button>
    <Button variant="primary" left_icon="arrows_left" size="sm">Left Icon</Button>
    <Button variant="primary" right_icon="arrows_right" size="sm">Right Icon</Button>
    <Button variant="primary" icon_only="generic_settings" size="lg" />
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

  def button_6_code do
    """
    <Button animation="progress">Progress</Button>
    <Button animation="success">Success</Button>
    <Button animation="error">Error</Button>
    <Button animation="pulse">Pulse</Button>
    """
  end
end
