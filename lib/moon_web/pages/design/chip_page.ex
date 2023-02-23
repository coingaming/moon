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
        to: "#",
        name: "Components v2"
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
      <ComponentPageDescription is_in_progress is_rtl_support title="Chip">
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
            :name => 'default',
            :type => 'slot',
            :required => 'No',
            :default => '-',
            :description => 'Chip content'
          },
          %{
            :name => 'left_icon',
            :type => 'slot',
            :required => 'No',
            :default => '-',
            :description => 'Left icon'
          },
          %{
            :name => 'right_icon',
            :type => 'slot',
            :required => 'No',
            :default => '-',
            :description => 'Right icon'
          },
          %{
            :name => 'icon_only',
            :type => 'slot',
            :required => 'No',
            :default => '-',
            :description => 'Icon without text'
          },
          %{
            :name => 'size',
            :type => 'sm | md',
            :required => 'No',
            :default => 'md',
            :description => 'Size of chip'
          },
          %{
            :name => 'is_active',
            :type => 'boolean',
            :required => 'No',
            :default => 'false',
            :description => 'Active state'
          },
          %{
            :name => 'is_stroke',
            :type => 'boolean',
            :required => 'No',
            :default => 'false',
            :description => 'Shows stroke on hover/active'
          },
          %{
            :name => 'variant',
            :type => 'default | ghost',
            :required => 'No',
            :default => 'default',
            :description => 'Visual/Logical variant of chip'
          },
          %{
            :name => 'on_click',
            :type => 'event',
            :required => 'No',
            :default => '-',
            :description => 'Event to be fired on click'
          },
          %{
            :name => 'class',
            :type => 'css_classs',
            :required => 'No',
            :default => '-',
            :description => 'Tailwind classes for customization'
          }
        ]}
      />
    </Page>
    """
  end
end
