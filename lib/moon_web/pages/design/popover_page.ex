defmodule MoonWeb.Pages.Design.PopoverPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias MoonWeb.Components.Anatomy
  alias MoonWeb.Components.Page
  alias MoonWeb.Components.ComponentPageDescription
  alias MoonWeb.Components.ExamplesList
  alias MoonWeb.Components.PropsTable

  alias MoonWeb.Examples.Design.PopoverExample

  data(breadcrumbs, :any,
    default: [
      %{
        to: "/components",
        name: "Components"
      },
      %{
        to: "/components/v2/popover",
        name: "Popover"
      }
    ]
  )

  def render(assigns) do
    ~F"""
    <Page {=@theme_name} {=@active_page} {=@breadcrumbs} {=@direction}>
      <ComponentPageDescription
        is_aria_support
        is_rtl_support
        title="Popover"
        image="facing/components/popover.png"
      >
        <p>Popovers are perfect for floating panels with arbitrary content like navigation menus, mobile menus and flyout menus.</p>
      </ComponentPageDescription>

      <Anatomy>{component_anatomy()}</Anatomy>

      <ExamplesList examples={[
        PopoverExample.Default,
        PopoverExample.Position,
        PopoverExample.TriggerElements,
        PopoverExample.WithClose
      ]} />

      <PropsTable
        title="Popover props"
        data={[
          %{
            :name => 'is_open',
            :type => 'boolean',
            :required => 'No',
            :default => 'false',
            :description => 'Whether or not the popover is open'
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
          },
          %{
            :name => 'class',
            :type => 'css_class',
            :required => 'No',
            :default => '-',
            :description => 'Tailwind classes for custom styles'
          }
        ]}
      />

      <PropsTable
        title="Popover.Panel props"
        data={[
          %{
            :name => 'position',
            :type =>
              'top | bottom | left | right | top-start | bottom-start | left-start | right-start | top-end | bottom-end | left-end | right-end',
            :required => 'No',
            :default => 'top',
            :description => 'Set placement for popover'
          },
          %{
            :name => 'class',
            :type => 'css_class',
            :required => 'No',
            :default => '-',
            :description => 'Tailwind classes for custom styles'
          }
        ]}
      />
    </Page>
    """
  end

  def component_anatomy do
    """
    <Popover>
      <Popover.Trigger>...</Popover.Trigger>
      <Popover.Panel>...</Popover.Panel>
    </Popover>
    """
  end
end
