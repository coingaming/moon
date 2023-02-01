defmodule MoonWeb.Pages.Design.PopoverPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias Moon.Design.Popover
  alias Moon.Design.Button
  alias Moon.Design.Button.IconButton

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
          <Popover id="popover_id_1">
            <Popover.Trigger>
              <Button>Toggle Popover</Button>
            </Popover.Trigger>
            <Popover.Panel>
              <PopoverExample.Default />
            </Popover.Panel>
          </Popover>
        </:example>
        <:code>{popover_1_code()}</:code>
      </ExampleAndCode>
      <ExampleAndCode title="Position" id="position_example">
        <:note>{"The complete list of all possible positions is in the props table below."}</:note>
        <:example>
          <Popover id="popover_id_2">
            <Popover.Trigger>
              <Button>Top</Button>
            </Popover.Trigger>
            <Popover.Panel>
              <PopoverExample.Position />
            </Popover.Panel>
          </Popover>
          <Popover id="popover_id_3">
            <Popover.Trigger>
              <Button>Right</Button>
            </Popover.Trigger>
            <Popover.Panel position="right">
              <PopoverExample.Position />
            </Popover.Panel>
          </Popover>
          <Popover id="popover_id_4">
            <Popover.Trigger>
              <Button>Left</Button>
            </Popover.Trigger>
            <Popover.Panel position="left">
              <PopoverExample.Position />
            </Popover.Panel>
          </Popover>
        </:example>
        <:code>{popover_2_code()}</:code>
      </ExampleAndCode>
      <ExampleAndCode title="Trigger elements" id="trigger_elements_example">
        <:example>
          <Popover id="popover_id_5">
            <Popover.Trigger>
              <Button>Button</Button>
            </Popover.Trigger>
            <Popover.Panel>
              <PopoverExample.TriggerElements />
            </Popover.Panel>
          </Popover>
          <Popover id="popover_id_6">
            <Popover.Trigger>
              <IconButton icon_only="controls_chevron_down" variant="secondary" />
            </Popover.Trigger>
            <Popover.Panel>
              <PopoverExample.TriggerElements />
            </Popover.Panel>
          </Popover>
          <Popover id="popover_id_7">
            <Popover.Trigger>
              <span class="text-moon-14 text-trunks cursor-pointer hover:text-piccolo">
                Open popover
              </span>
            </Popover.Trigger>
            <Popover.Panel>
              <PopoverExample.TriggerElements />
            </Popover.Panel>
          </Popover>
        </:example>
        <:code>{popover_3_code()}</:code>
      </ExampleAndCode>
      <ExampleAndCode title="With close button" id="close_button_example">
        <:example>
          <Popover id="popover_id_8">
            <Popover.Trigger>
              <Button>Toggle Popover</Button>
            </Popover.Trigger>
            <Popover.Panel class="!w-96">
              <PopoverExample.WithClose />
            </Popover.Panel>
          </Popover>
        </:example>
        <:code>{popover_4_code()}</:code>
      </ExampleAndCode>
      <PropsTable title="Popover props" data={@props_info_array} />
      <PropsTable title="Popover.Panel" data={@panel_info_array} />
    </Page>
    """
  end

  defp popover_1_code() do
    """
    alias MoonWeb.Examples.Design.PopoverExample

    <Popover id="popover_id_1">
      <Popover.Trigger>
        <Button>Toggle Popover</Button>
      </Popover.Trigger>
      <Popover.Panel>
        <<PopoverExample.Default />
      </Popover.Panel>
    </Popover>
    """
  end

  defp popover_2_code() do
    """
    alias MoonWeb.Examples.Design.PopoverExample

    <Popover id="popover_id_2">
      <Popover.Trigger>
        <Button>Top</Button>
      </Popover.Trigger>
      <Popover.Panel>
      <PopoverExample.Position />
      </Popover.Panel>
    </Popover>
    <Popover id="popover_id_3">
      <Popover.Trigger>
        <Button>Right</Button>
      </Popover.Trigger>
      <Popover.Panel position="right">
      <PopoverExample.Position />
      </Popover.Panel>
    </Popover>
    <Popover id="popover_id_4">
      <Popover.Trigger>
        <Button>Left</Button>
      </Popover.Trigger>
      <Popover.Panel  position="left">
      <PopoverExample.Position />
      </Popover.Panel>
    </Popover>
    """
  end

  defp popover_3_code() do
    """
    alias MoonWeb.Examples.Design.PopoverExample

    <Popover id="popover_id_5">
      <Popover.Trigger>
        <Button>Button</Button>
      </Popover.Trigger>
      <Popover.Panel>
        <PopoverExample.TriggerElements />
      </Popover.Panel>
    </Popover>
    <Popover id="popover_id_6">
      <Popover.Trigger>
        <IconButton icon_only="controls_chevron_down" variant="secondary" />
      </Popover.Trigger>
      <Popover.Panel>
        <PopoverExample.TriggerElements />
      </Popover.Panel>
    </Popover>
    <Popover id="popover_id_7">
      <Popover.Trigger>
        <span class="text-moon-14 text-trunks cursor-pointer hover:text-piccolo">
          Open popover
        </span>
      </Popover.Trigger>
      <Popover.Panel>
        <PopoverExample.TriggerElements />
      </Popover.Panel>
    </Popover>
    """
  end

  defp popover_4_code() do
    """
    alias MoonWeb.Examples.Design.PopoverExample

    <Popover id="popover_id_8">
      <Popover.Trigger>
         <Button>Toggle Popover</Button>
      </Popover.Trigger>
      <Popover.Panel class="!w-96">
        <PopoverExample.WithClose />
      </Popover.Panel>
    </Popover>
    """
  end
end
