defmodule MoonWeb.Pages.Design.TooltipPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias MoonWeb.Components.Anatomy

  alias MoonWeb.Components.Page
  alias MoonWeb.Components.ComponentPageDescription
  alias MoonWeb.Components.PropsTable
  alias MoonWeb.Components.ExamplesList

  alias MoonWeb.Examples.Design.TooltipExample

  data(breadcrumbs, :any,
    default: [
      %{
        to: "#",
        name: "Components v2"
      },
      %{
        to: "/components/v2/tooltip",
        name: "Tooltip"
      }
    ]
  )

  def render(assigns) do
    ~F"""
    <Page {=@theme_name} {=@active_page} {=@breadcrumbs} {=@direction}>
      <ComponentPageDescription
        title="Tooltip"
        is_aria_support
        is_rtl_support
        image="facing/components/tooltip.png"
      >
        <p>
          A means of displaying a description or extra information about an element, usually on hover, but can also be on click or tap.
        </p>
      </ComponentPageDescription>

      <Anatomy>{component_anatomy()}</Anatomy>

      <ExamplesList examples={[
        TooltipExample.Default,
        TooltipExample.Positions,
        TooltipExample.WithoutArrow,
        TooltipExample.WithoutShadow,
        TooltipExample.Customizations
      ]} />

      <PropsTable
        title="Tooltip props"
        data={[
          %{
            :name => 'default',
            :type => 'slot',
            :required => 'Yes',
            :default => '-',
            :description => 'Message shown in tooltip, see Tooltip.Content'
          },
          %{
            :name => 'trigger',
            :type => 'slot',
            :required => 'Yes',
            :default => '-',
            :description => 'Hover element, see Tooltip.Trigger'
          }
        ]}
      />
      <PropsTable
        title="Tooltip.Content props"
        data={[
          %{
            :name => 'arrow',
            :type => 'slot',
            :required => 'No',
            :default => '-',
            :description => 'Arrow element, see Tooltip.Arrow'
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
            :description => 'Position of the tooltip'
          }
        ]}
      />
      <PropsTable
        title="Tooltip.Arrow props"
        data={[
          %{
            :name => 'class',
            :type => 'css_class',
            :required => 'No',
            :default => '-',
            :description => 'Classes for customization'
          }
        ]}
      />
    </Page>
    """
  end

  def component_anatomy do
    """
    <Tooltip>
      <Tooltip.Trigger>...</Tooltip.Trigger>
      <Tooltip.Content>
        ...
        <Tooltip.Arrow />
      </Tooltip.Content>
    </Tooltip>
    """
  end
end
