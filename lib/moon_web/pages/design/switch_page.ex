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
        SwitchExample.UsingWithForms,
        SwitchExample.CodeExampleForFullCustomization
      ]} />

      <PropsTable
        title="Switch props"
        data={[
          %{
            :name => 'is_switched',
            :type => 'boolean',
            :required => 'No',
            :default => 'false',
            :description => 'Is switch checked/unchecked'
          },
          %{
            :name => 'disabled',
            :type => 'boolean',
            :required => 'No',
            :default => '-',
            :description => 'Set disabled/not disabled switch'
          },
          %{
            :name => 'on_bg_color',
            :type => 'css_class',
            :required => 'No',
            :default => 'bg-piccolo',
            :description => 'Tailwind class for custom on-state background color'
          },
          %{
            :name => 'off_bg_color',
            :type => 'css_class',
            :required => 'No',
            :default => 'bg-beerus',
            :description => 'Tailwind class for custom off-state background color'
          },
          %{
            :name => 'on_icon',
            :type => 'slot',
            :required => 'No',
            :default => '-',
            :description => 'Set icon for checked state'
          },
          %{
            :name => 'off_icon',
            :type => 'slot',
            :required => 'No',
            :default => '-',
            :description => 'Set icon for unchecked state'
          },
          %{
            :name => 'size',
            :type => '2xs | xs | sm',
            :required => 'No',
            :default => 'sm',
            :description => 'Size of switch'
          },
          %{
            :name => 'on_change',
            :type => 'event',
            :required => 'No',
            :default => '-',
            :description => 'The function to call when the switch is toggled'
          },
          %{
            :name => 'value',
            :type => 'string',
            :required => 'No',
            :default => '-',
            :description => 'The value used when using this component inside a form, if it is checked'
          },
          %{
            :name => 'class',
            :type => 'css_class',
            :required => 'No',
            :default => '-',
            :description => 'Tailwind classes for customization'
          },
          %{
            :name => 'switcher_class',
            :type => 'css_class',
            :required => 'No',
            :default => '-',
            :description => 'Tailwind classes for customization of switcher element'
          }
        ]}
      />
    </Page>
    """
  end
end
