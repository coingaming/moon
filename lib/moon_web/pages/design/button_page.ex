defmodule MoonWeb.Pages.Design.ButtonPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias Moon.Design.Button
  alias MoonWeb.Components.ExampleAndCode
  alias MoonWeb.Components.Page
  alias MoonWeb.Components.ComponentPageDescription
  alias MoonWeb.Components.PropsTable

  data(breadcrumbs, :any,
    default: [
      %{
        to: "#",
        name: "Components v2"
      },
      %{
        to: "/components/v2/button",
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
        :name => 'as',
        :type => 'a | button',
        :required => 'No',
        :default => 'button',
        :description => 'Rendered HTML element'
      },
      %{
        :name => 'disabled',
        :type => 'boolean',
        :required => 'No',
        :default => 'false',
        :description => 'Disabled button'
      },
      %{
        :name => 'full_width',
        :type => 'boolean',
        :required => 'No',
        :default => 'false',
        :description => 'Full width button'
      },
      %{
        :name => 'icon',
        :type => 'slot',
        :required => 'No',
        :default => '-',
        :description => 'Icon'
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
        :type => 'primary | secondary | tertiary | ghost',
        :required => 'No',
        :default => 'primary',
        :description => 'Visual/Logical variant of button'
      },
      %{
        :name => 'class',
        :type => 'css_class',
        :required => 'No',
        :default => '-',
        :description => 'Additional CSS class(es) for the item'
      }
    ]
  )

  def handle_params(_params, uri, socket) do
    {:noreply, assign(socket, uri: uri)}
  end

  def render(assigns) do
    ~F"""
    <Page {=@theme_name} {=@active_page} {=@breadcrumbs} {=@direction}>
      <ComponentPageDescription
        is_in_progress
        is_rtl_support
        title="Button"
        image="facing/components/button.png"
      >
        <p>Buttons allow users to take actions, and make choices, with a single tap.</p>
        <p>
          Buttons communicate actions that users can take. They are typically
          placed throughout your UI, in places like:
        </p>
        <ul class="list-disc ps-5">
          <li>Modal windows</li>
          <li>Forms</li>
          <li>Cards</li>
          <li>Toolbars</li>
        </ul>
      </ComponentPageDescription>

      <ExampleAndCode title="Default" id="button0">
        <:example>
          <Button>Default</Button>
        </:example>

        <:code>{button_0_code()}</:code>
      </ExampleAndCode>

      <ExampleAndCode title="Button as a link HTML element" id="button1">
        <:example>
          <Button as="a" href="/components/v2/button">Link HTML element</Button>
        </:example>

        <:code>{button_1_code()}</:code>
      </ExampleAndCode>

      <ExampleAndCode title="Variants" id="button2">
        <:example>
          <Button>Primary is default</Button>
          <Button variant="secondary">Secondary</Button>
          <Button variant="tertiary">Tertiary</Button>
          <Button variant="ghost">Ghost</Button>
        </:example>

        <:code>{button_2_code()}</:code>
      </ExampleAndCode>

      <ExampleAndCode title="Sizes" id="button3">
        <:example>
          <Button left_icon="generic_settings" variant="primary" button_gap="gap-1" size="xs">XS Button</Button>
          <Button left_icon="generic_settings" variant="primary" button_gap="gap-1" size="sm">SM Button</Button>
          <Button left_icon="generic_settings" variant="primary" size="md">MD Button is default</Button>
          <Button left_icon="generic_settings" variant="primary" size="lg">LG Button</Button>
          <Button left_icon="generic_settings" variant="primary" size="xl">XL Button</Button>
        </:example>

        <:code>{button_3_code()}</:code>
      </ExampleAndCode>

      <ExampleAndCode title="Icons" id="button4">
        <:example>
          <Button left_icon="generic_settings" variant="primary">Icon Left</Button>
          <Button right_icon="generic_settings" variant="primary">Icon Right</Button>
        </:example>

        <:code>{button_4_code()}</:code>
      </ExampleAndCode>

      <ExampleAndCode title="Full width" id="button5">
        <:example>
          <Button right_icon="generic_settings" variant="primary" full_width="true">
            Full width
          </Button>
        </:example>

        <:code>{button_5_code()}</:code>
      </ExampleAndCode>

      <ExampleAndCode title="Disabled" id="button6">
        <:example>
          <Button variant="primary" disabled="true">
            Disabled
          </Button>
        </:example>

        <:code>{button_6_code()}</:code>
      </ExampleAndCode>

      <ExampleAndCode title="Animation" id="button7">
        <:example>
          <Button animation="progress">Progress</Button>
          <Button animation="success">Success</Button>
          <Button animation="error">Error</Button>
          <Button animation="pulse">Pulse</Button>
        </:example>

        <:code>{button_7_code()}</:code>
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
    <Button as="a" href="/components/v2/button">Link HTML element</Button>
    """
  end

  def button_2_code do
    """
    <Button>Primary (default)</Button>
    <Button variant="secondary">Secondary</Button>
    <Button variant="tertiary">Tertiary</Button>
    <Button variant="ghost">Ghost</Button>
    """
  end

  def button_3_code do
    """
    <Button left_icon="generic_settings" variant="primary" button_gap="gap-1" size="xs">XS Button</Button>
    <Button left_icon="generic_settings" variant="primary" button_gap="gap-1" size="sm">SM Button</Button>
    <Button left_icon="generic_settings" variant="primary" size="md">MD Button is default</Button>
    <Button left_icon="generic_settings" variant="primary" size="lg">LG Button</Button>
    <Button left_icon="generic_settings" variant="primary" size="xl">XL Button</Button>
    """
  end

  def button_4_code do
    """
    <Button left_icon="generic_settings" variant="primary">Left Icon</Button>
    <Button right_icon="generic_settings" variant="primary">Right Icon</Button>
    """
  end

  def button_5_code do
    """
    <Button right_icon="generic_settings" variant="primary" full_width="true">
      Full width
    </Button>
    """
  end

  def button_6_code do
    """
    <Button variant="primary" disabled="true">
      Disabled
    </Button>
    """
  end

  def button_7_code do
    """
    <Button animation="progress">Progress</Button>
    <Button animation="success">Success</Button>
    <Button animation="error">Error</Button>
    <Button animation="pulse">Pulse</Button>
    """
  end
end
