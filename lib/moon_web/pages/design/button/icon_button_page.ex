defmodule MoonWeb.Pages.Design.IconButtonPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias Moon.Design.IconButton
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
        to: "/components/v2/icon-button",
        name: "IconButton"
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
        :description => 'Disabled button'
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
      <ComponentPageDescription is_in_progress title="IconButton">
        <p>Buttons allow users to take actions, and make choices, with a single tap.</p>
        <p>Buttons communicate actions that users can take. They are typically placed throughout your UI, in places like:</p>
        <ul class="list-disc ps-6">
          <li>Modal windows</li>
          <li>Forms</li>
          <li>Cards</li>
          <li>Toolbars</li>
        </ul>
      </ComponentPageDescription>

      <ExampleAndCode title="Default" id="button0">
        <:example>
          <IconButton icon_only="generic_settings" />
        </:example>

        <:code>{button_0_code()}</:code>
      </ExampleAndCode>

      <ExampleAndCode title="Button as a link HTML element" id="button1">
        <:example>
          <IconButton icon_only="generic_settings" as="a" href="/components/v2/button" />
        </:example>

        <:code>{button_1_code()}</:code>
      </ExampleAndCode>

      <ExampleAndCode title="Variants" id="button2">
        <:example>
          <IconButton icon_only="generic_settings" />
          <IconButton icon_only="generic_settings" variant="secondary" />
          <IconButton icon_only="generic_settings" variant="tertiary" />
          <IconButton icon_only="generic_settings" variant="ghost" />
        </:example>

        <:code>{button_2_code()}</:code>
      </ExampleAndCode>

      <ExampleAndCode title="Sizes" id="button3">
        <:example>
          <IconButton icon_only="generic_settings" variant="primary" size="xs" />
          <IconButton icon_only="generic_settings" variant="primary" size="sm" />
          <IconButton icon_only="generic_settings" variant="primary" size="md" />
          <IconButton icon_only="generic_settings" variant="primary" size="lg" />
          <IconButton icon_only="generic_settings" variant="primary" size="xl" />
        </:example>

        <:code>{button_3_code()}</:code>
      </ExampleAndCode>

      <ExampleAndCode title="Disabled" id="button4">
        <:example>
          <IconButton icon_only="generic_settings" variant="primary" disabled="true" />
        </:example>

        <:code>{button_4_code()}</:code>
      </ExampleAndCode>

      <ExampleAndCode title="Animation" id="button5">
        <:example>
          <IconButton icon_only="generic_settings" animation="progress" />
          <IconButton icon_only="generic_settings" animation="success" />
          <IconButton icon_only="generic_settings" animation="error" />
          <IconButton icon_only="generic_settings" animation="pulse" />
        </:example>

        <:code>{button_5_code()}</:code>
      </ExampleAndCode>

      <PropsTable title="Button props" data={@props_info_array} />
    </Page>
    """
  end

  def button_0_code do
    """
    <IconButton icon_only="generic_settings" />
    """
  end

  def button_1_code do
    """
    <IconButton icon_only="generic_settings" as="a" href="/components/v2/button" />
    """
  end

  def button_2_code do
    """
    <IconButton icon_only="generic_settings" />
    <IconButton icon_only="generic_settings" variant="secondary" />
    <IconButton icon_only="generic_settings" variant="tertiary" />
    <IconButton icon_only="generic_settings" variant="ghost" />
    """
  end

  def button_3_code do
    """
    <IconButton icon_only="generic_settings" variant="primary" size="xs" />
    <IconButton icon_only="generic_settings" variant="primary" size="sm" />
    <IconButton icon_only="generic_settings" variant="primary" size="md" />
    <IconButton icon_only="generic_settings" variant="primary" size="lg" />
    <IconButton icon_only="generic_settings" variant="primary" size="xl" />
    """
  end

  def button_4_code do
    """
    <IconButton icon_only="generic_settings" variant="primary" disabled="true" />
    """
  end

  def button_5_code do
    """
    <IconButton icon_only="generic_settings" animation="progress" />
    <IconButton icon_only="generic_settings" animation="success" />
    <IconButton icon_only="generic_settings" animation="error" />
    <IconButton icon_only="generic_settings" animation="pulse" />
    """
  end
end
