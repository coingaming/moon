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
            :name => ~c"is_open",
            :type => ~c"boolean",
            :required => ~c"No",
            :default => ~c"false",
            :description => ~c"Whether or not the popover is open"
          },
          %{
            :name => ~c"default",
            :type => ~c"slot",
            :required => ~c"Yes",
            :default => ~c"-",
            :description => ~c"Content of Popover item, see Popover.Panel"
          },
          %{
            :name => ~c"trigger",
            :type => ~c"slot",
            :required => ~c"Yes",
            :default => ~c"-",
            :description => ~c"Trigger element of Popover item, see Popover.Trigger"
          },
          %{
            :name => ~c"class",
            :type => ~c"css_class",
            :required => ~c"No",
            :default => ~c"-",
            :description => ~c"Tailwind classes for custom styles"
          }
        ]}
      />

      <PropsTable
        title="Popover.Panel props"
        data={[
          %{
            :name => ~c"position",
            :type =>
              ~c"top | bottom | left | right | top-start | bottom-start | left-start | right-start | top-end | bottom-end | left-end | right-end",
            :required => ~c"No",
            :default => ~c"top",
            :description => ~c"Set placement for popover"
          },
          %{
            :name => ~c"class",
            :type => ~c"css_class",
            :required => ~c"No",
            :default => ~c"-",
            :description => ~c"Tailwind classes for custom styles"
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
