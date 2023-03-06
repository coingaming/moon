defmodule MoonWeb.Pages.Design.SwitchPage do
  @moduledoc false

  require Logger
  use MoonWeb, :live_view

  alias MoonWeb.Components.Page
  alias MoonWeb.Components.ComponentPageDescription
  alias MoonWeb.Components.ExamplesList
  alias MoonWeb.Components.PropsTable

  alias MoonWeb.Examples.Design.SwitchExample

  data(breadcrumbs, :any,
    default: [
      %{
        to: "#",
        name: "Components v2"
      },
      %{
        to: "/components/v2/switch",
        name: "Switch"
      }
    ]
  )

  def render(assigns) do
    ~F"""
    <Page {=@theme_name} {=@active_page} {=@breadcrumbs} {=@direction}>
      <ComponentPageDescription is_in_progress is_aria_support is_rtl_support title="Switch">
        <p>
          Switch is a control that is used to quickly switch between two possible states.</p>
        <p>Switches are only used for these binary actions that occur immediately after the user “flips” the switch.</p>
        <p>They are commonly used for “on/off” switches.</p>
      </ComponentPageDescription>

      <ExamplesList examples={[
        SwitchExample.Default,
        SwitchExample.Sizes,
        SwitchExample.Disabled,
        SwitchExample.WithIcons,
        SwitchExample.CustomBackground,
        SwitchExample.UsingWithHTMLForms,
        SwitchExample.ForFullCustomization
      ]} />

      <PropsTable
        title="Switch props"
        data={[
          %{
            :name => 'default',
            :type => 'slot',
            :required => 'No',
            :default => '-',
            :description => 'Chip content'
          }
        ]}
      />
    </Page>
    """
  end
end
