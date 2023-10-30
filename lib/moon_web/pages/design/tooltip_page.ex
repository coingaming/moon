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
        to: "/components",
        name: "Components"
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
            :name => ~c"default",
            :type => ~c"slot",
            :required => ~c"Yes",
            :default => ~c"-",
            :description => ~c"Message shown in tooltip, see Tooltip.Content"
          },
          %{
            :name => ~c"trigger",
            :type => ~c"slot",
            :required => ~c"Yes",
            :default => ~c"-",
            :description => ~c"Hover element, see Tooltip.Trigger"
          }
        ]}
      />
      <PropsTable
        title="Tooltip.Content props"
        data={[
          %{
            :name => ~c"arrow",
            :type => ~c"slot",
            :required => ~c"No",
            :default => ~c"-",
            :description => ~c"Arrow element, see Tooltip.Arrow"
          },
          %{
            :name => ~c"class",
            :type => ~c"css_class",
            :required => ~c"No",
            :default => ~c"-",
            :description => ~c"Classes for customization"
          },
          %{
            :name => ~c"position",
            :type =>
              ~c"top-start | top-center | top-end | bottom-start | bottom-center | bottom-end | right | left",
            :required => ~c"No",
            :default => ~c"top-center",
            :description => ~c"Position of the tooltip"
          }
        ]}
      />
      <PropsTable
        title="Tooltip.Arrow props"
        data={[
          %{
            :name => ~c"class",
            :type => ~c"css_class",
            :required => ~c"No",
            :default => ~c"-",
            :description => ~c"Classes for customization"
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
