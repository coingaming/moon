defmodule MoonWeb.Pages.Design.DropdownPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias MoonWeb.Components.Page
  alias MoonWeb.Components.ComponentPageDescription
  alias MoonWeb.Components.PropsTable
  alias MoonWeb.Components.ExamplesList

  alias MoonWeb.Examples.Design.DropdownExample

  import Moon.Helpers.Positions

  data(breadcrumbs, :any,
    default: [
      %{
        to: "#",
        name: "Components v2"
      },
      %{
        to: "/components/v2/dropdown",
        name: "Dropdown"
      }
    ]
  )

  def handle_params(_params, uri, socket) do
    {:noreply, assign(socket, uri: uri)}
  end

  def render(assigns) do
    ~F"""
    <Page {=@theme_name} {=@active_page} {=@breadcrumbs} {=@direction}>
      <ComponentPageDescription title="Dropdown" is_aria_support is_rtl_support is_in_progress>
        <p>Dropdowns is a custom select component that allows users to make single or multiple selections (Multi select not supported currently).</p>
        <p>An option that's been selected can represent a corresponding value in forms or be used to filter/sort content.</p>
        <p>Based on Headless approach.</p>
      </ComponentPageDescription>

      <ExamplesList examples={[
        DropdownExample.Default,
        DropdownExample.TriggerElements,
        DropdownExample.OptionLayouts,
        DropdownExample.Positions,
        DropdownExample.Sizes
      ]} />

      <PropsTable
        title="Dropdown props"
        data={[
          %{
            :name => 'option',
            :type => 'slot',
            :required => '-',
            :default => '-',
            :description => 'Message shown in Dropdown, see Dropdown.Option'
          },
          %{
            :name => 'trigger',
            :type => 'slot',
            :required => 'Yes',
            :default => '-',
            :description => 'Hover element, see Dropdown.Trigger'
          },
          %{
            :name => 'option_titles',
            :type => 'list',
            :required => 'No',
            :default => '[]',
            :description => 'List of options when no slot given'
          },
          %{
            :name => 'option_module',
            :type => 'atom',
            :required => 'No',
            :default => 'Option',
            :description => 'Module to render option_titles'
          },
          %{
            :name => 'class',
            :type => 'css_class',
            :required => 'No',
            :default => '-',
            :description => 'CSS class for options container'
          },
          %{
            :name => 'size',
            :type => 'sm | md | lg',
            :required => 'No',
            :default => 'md',
            :description => 'Size of options'
          },
          %{
            :name => 'position',
            :type => position_list() |> Enum.join(" | "),
            :required => 'No',
            :default => '-',
            :description => 'Position of options list'
          },
          %{
            :name => 'is_open',
            :type => 'boolean',
            :required => 'No',
            :default => 'false',
            :description => 'Visibility of options list'
          },
          %{
            :name => 'on_change',
            :type => 'event',
            :required => 'No',
            :default => '-',
            :description => 'Event to be fired on item(s) select'
          },
          %{
            :name => 'on_trigger',
            :type => 'event',
            :required => 'No',
            :default => '-',
            :description => 'Event to be fired on show/hide'
          },
          %{
            :name => 'value',
            :type => 'any',
            :required => 'No',
            :default => '-',
            :description => 'Value specifies item(s) selected'
          }
        ]}
      />
      <PropsTable
        title="Dropdown.Option props"
        data={[
          %{
            :name => 'default',
            :type => 'slot',
            :required => 'No',
            :default => '-',
            :description => 'Content to be shown. In no is given - title is here'
          },
          %{
            :name => 'class',
            :type => 'css_class',
            :required => 'No',
            :default => '-',
            :description => 'Classes for customization'
          },
          %{
            :name => 'title',
            :type => 'string',
            :required => 'No',
            :default => '-',
            :description => 'Title to be shown instead of default slot'
          },
          %{
            :name => 'value',
            :type => 'any',
            :required => 'No',
            :default => '-',
            :description => 'Value of the option'
          }
        ]}
      />
    </Page>
    """
  end
end
