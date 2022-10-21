defmodule MoonWeb.Pages.Components.ButtonPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias Moon.Components.Button
  alias MoonWeb.Components.ExampleAndCode
  alias MoonWeb.Components.Page
  alias MoonWeb.Components.ComponentPageDescription
  alias MoonWeb.Components.PropsTable

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
        :name => 'animation',
        :type => 'progress | success | error | pulse',
        :required => 'false',
        :default => '-',
        :description => 'Animation of button'
      },
      %{
        :name => 'disabled',
        :type => 'boolean',
        :required => 'false',
        :default => 'false',
        :description => 'Disabled Button'
      },
      %{
        :name => 'fullWidth',
        :type => 'boolean',
        :required => 'false',
        :default => 'false',
        :description => 'Full width Button'
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
        :name => 'size',
        :type => 'xs | sm | md | lg | xl',
        :required => 'false',
        :default => 'md',
        :description => 'Size of button'
      },
      %{
        :name => 'variant',
        :type => 'primary | secondary | tertiary | ghost | link (deprecated) | none (deprecated)',
        :required => 'false',
        :default => 'primary',
        :description => 'Visual/Logical variant of button'
      }
    ]

  def mount(params, _session, socket) do
    {:ok,
     assign(socket,
       theme_name: params["theme_name"] || "moon-design-light",
       direction: params["direction"] || "ltr",
       active_page: __MODULE__
     )}
  end

  def handle_params(_params, uri, socket) do
    {:noreply, assign(socket, uri: uri)}
  end

  def render(assigns) do
    ~F"""
    <Page {=@theme_name} {=@active_page} {=@breadcrumbs} {=@direction}>
      <ComponentPageDescription title="Button">
        <p>
          Buttons are calls-to-action used to prompt users. They encourage users to interact with us in multiple ways throughout our galaxy, based on what the label of the button indicates. Buttons are clickable elements with label text that describe the action that will happen when the users interact with it.
        </p>
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
          <Button variant="primary" size="xsmall">xSmall</Button>
          <Button variant="primary" size="small">Small</Button>
          <Button variant="primary" size="medium">Medium (Default)</Button>
          <Button variant="primary" size="large">Large</Button>
          <Button variant="primary" size="xlarge">xLarge</Button>
        </:example>

        <:code>{button_2_code()}</:code>
      </ExampleAndCode>

      <ExampleAndCode title="Icons" id="button3">
        <:example>
          <Button left_icon="arrows_left" variant="primary">Left Icon</Button>
          <Button right_icon="arrows_right" variant="primary">Right Icon</Button>
          <Button variant="primary" left_icon="arrows_left" size="small">Left Icon</Button>
          <Button variant="primary" right_icon="arrows_right" size="small">Right Icon</Button>
          <Button variant="primary" right_icon="generic_settings" size="large" />
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

      <PropsTable data={@props_info_array} />
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

  def button_6_code do
    """
    <Button animation="progress">Progress</Button>
    <Button animation="success">Success</Button>
    <Button animation="error">Error</Button>
    <Button animation="pulse">Pulse</Button>
    """
  end
end
