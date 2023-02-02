defmodule MoonWeb.Pages.Design.PopoverPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias MoonWeb.Components.Page
  alias MoonWeb.Components.ComponentPageDescription
  alias MoonWeb.Components.ExampleAndCode
  alias MoonWeb.Components.PropsTable

  alias MoonWeb.Examples.Design.PopoverExample

  data(breadcrumbs, :any,
    default: [
      %{
        to: "#",
        name: "Components v2"
      },
      %{
        to: "/components/v2/popover",
        name: "Popover"
      }
    ]
  )

  data(props_info_array, :list,
    default: [
      %{
        :name => 'is_open',
        :type => 'boolean',
        :required => 'No',
        :default => 'false',
        :description => 'Whether or not the popover is open.'
      },
      %{
        :name => 'default',
        :type => 'slot',
        :required => 'Yes',
        :default => '-',
        :description => 'Content of Popover item, see Popover.Panel'
      },
      %{
        :name => 'trigger',
        :type => 'slot',
        :required => 'Yes',
        :default => '-',
        :description => 'Trigger element of Popover item, see Popover.Trigger'
      }
    ]
  )

  data(panel_info_array, :list,
    default: [
      %{
        :name => 'position',
        :type =>
          'top-start | top-center | top-end | bottom-start | bottom-center | bottom-end | right | left',
        :required => 'No',
        :default => 'top-center',
        :description => 'Set placement for popover'
      },
      %{
        :name => 'class',
        :type => 'css_class',
        :required => 'No',
        :default => '-',
        :description => 'Tailwind classes for custom styles.'
      }
    ]
  )

  def handle_params(_params, uri, socket) do
    {:noreply, assign(socket, uri: uri)}
  end

  def render(assigns) do
    ~F"""
    <Page {=@theme_name} {=@active_page} {=@breadcrumbs} {=@direction}>
      <ComponentPageDescription is_in_progress is_aria_support title="Popover">
        <p>Popovers are perfect for floating panels with arbitrary content like navigation menus, mobile menus and flyout menus.</p>
      </ComponentPageDescription>
      <ExampleAndCode title="Default" id="default_example">
        <:example>
          <PopoverExample.Default />
        </:example>
        <:code>{PopoverExample.Default.code()}</:code>
      </ExampleAndCode>
      <ExampleAndCode title="Position" id="position_example">
        <:note>{"The complete list of all possible positions is in the props table below."}</:note>
        <:example>
          <PopoverExample.Position />
        </:example>
        <:code>{PopoverExample.Position.code()}</:code>
      </ExampleAndCode>
      <ExampleAndCode title="Trigger elements" id="trigger_elements_example">
        <:example>
          <PopoverExample.TriggerElements />
        </:example>
        <:code>{PopoverExample.TriggerElements.code()}</:code>
      </ExampleAndCode>
      <ExampleAndCode title="With close button" id="close_button_example">
        <:example>
          <PopoverExample.WithClose />
        </:example>
        <:code>{PopoverExample.WithClose.code()}</:code>
      </ExampleAndCode>
      <PropsTable title="Popover props" data={@props_info_array} />
      <PropsTable title="Popover.Panel" data={@panel_info_array} />
    </Page>
    """
  end
end
