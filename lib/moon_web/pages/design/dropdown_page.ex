defmodule MoonWeb.Pages.Design.DropdownPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias MoonWeb.Components.ExampleAndCode
  alias MoonWeb.Components.Page
  alias MoonWeb.Components.ComponentPageDescription
  alias MoonWeb.Components.PropsTable
  alias MoonWeb.Components.ExamplesList

  alias MoonWeb.Examples.Design.DropdownExample

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

  data(dropdown_props, :list,
    default: [
      %{
        :name => 'default',
        :type => 'slot',
        :required => 'Yes',
        :default => '-',
        :description => 'Message shown in Dropdown, see Dropdown.Content'
      },
      %{
        :name => 'trigger',
        :type => 'slot',
        :required => 'Yes',
        :default => '-',
        :description => 'Hover element, see Dropdown.Trigger'
      }
    ]
  )

  data(content_props, :list,
    default: [
      %{
        :name => 'arrow',
        :type => 'slot',
        :required => 'No',
        :default => '-',
        :description => 'Arrow element, see Dropdown.Arrow'
      },
      %{
        :name => 'class',
        :type => 'css_class',
        :required => 'No',
        :default => '-',
        :description => 'Classes for customization'
      },
      %{
        :name => 'position',
        :type =>
          'top-start | top-center | top-end | bottom-start | bottom-center | bottom-end | right | left',
        :required => 'No',
        :default => 'top-center',
        :description => 'Position of the Dropdown'
      }
    ]
  )

  data(arrow_props, :list,
    default: [
      %{
        :name => 'class',
        :type => 'css_class',
        :required => 'No',
        :default => '-',
        :description => 'Classes for customization'
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

      <ExamplesList examples={[DropdownExample.Default, DropdownExample.TriggerElements, DropdownExample.OptionLayouts]} />

      <ExampleAndCode title="Default dropdown" id="drop-example-02">
        <:example>
        </:example>
        <:code />
      </ExampleAndCode>

      <PropsTable title="Dropdown props" data={@dropdown_props} />
      <PropsTable title="Dropdown.Option props" data={@content_props} />
      <PropsTable title="Dropdown.Arrow props" data={@arrow_props} />
    </Page>
    """
  end
end
