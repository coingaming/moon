defmodule MoonWeb.Pages.Design.ChipPage do
  @moduledoc false

  require Logger
  use MoonWeb, :live_view

  alias MoonWeb.Components.Page
  alias MoonWeb.Components.ComponentPageDescription
  alias MoonWeb.Components.ExamplesList
  alias MoonWeb.Components.PropsTable

  alias MoonWeb.Examples.Design.ChipExample

  data(breadcrumbs, :any,
    default: [
      %{
        to: "/components",
        name: "Components"
      },
      %{
        to: "/components/v2/chip",
        name: "Chip"
      }
    ]
  )

  def render(assigns) do
    ~F"""
    <Page {=@theme_name} {=@active_page} {=@breadcrumbs} {=@direction}>
      <ComponentPageDescription
        is_in_progress
        is_rtl_support
        title="Chip"
        image="facing/components/chip.png"
      >
        <p>
          Chips help filter content, or trigger actions.
        </p>
      </ComponentPageDescription>

      <ExamplesList examples={[
        ChipExample.Default,
        ChipExample.Sizes,
        ChipExample.Variants,
        ChipExample.Active,
        ChipExample.WithIcons,
        ChipExample.IsStroke,
        ChipExample.IsStrokeWithIcons,
        ChipExample.WithOnClick
      ]} />

      <PropsTable
        title="Chip props"
        data={[
          %{
            :name => ~c"default",
            :type => ~c"slot",
            :required => ~c"No",
            :default => ~c"-",
            :description => ~c"Chip content"
          },
          %{
            :name => ~c"left_icon",
            :type => ~c"slot",
            :required => ~c"No",
            :default => ~c"-",
            :description => ~c"Left icon"
          },
          %{
            :name => ~c"right_icon",
            :type => ~c"slot",
            :required => ~c"No",
            :default => ~c"-",
            :description => ~c"Right icon"
          },
          %{
            :name => ~c"icon_only",
            :type => ~c"slot",
            :required => ~c"No",
            :default => ~c"-",
            :description => ~c"Icon without text"
          },
          %{
            :name => ~c"size",
            :type => ~c"sm | md",
            :required => ~c"No",
            :default => ~c"md",
            :description => ~c"Size of chip"
          },
          %{
            :name => ~c"is_active",
            :type => ~c"boolean",
            :required => ~c"No",
            :default => ~c"false",
            :description => ~c"Active state"
          },
          %{
            :name => ~c"is_stroke",
            :type => ~c"boolean",
            :required => ~c"No",
            :default => ~c"false",
            :description => ~c"Shows stroke on hover/active"
          },
          %{
            :name => ~c"variant",
            :type => ~c"default | ghost",
            :required => ~c"No",
            :default => ~c"default",
            :description => ~c"Visual/Logical variant of chip"
          },
          %{
            :name => ~c"on_click",
            :type => ~c"event",
            :required => ~c"No",
            :default => ~c"-",
            :description => ~c"Event to be fired on click"
          },
          %{
            :name => ~c"class",
            :type => ~c"css_classs",
            :required => ~c"No",
            :default => ~c"-",
            :description => ~c"Tailwind classes for customization"
          }
        ]}
      />
    </Page>
    """
  end
end
