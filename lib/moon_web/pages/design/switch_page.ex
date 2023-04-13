defmodule MoonWeb.Pages.Design.SwitchPage do
  @moduledoc false

  require Logger
  use MoonWeb, :live_view

  alias MoonWeb.Components.Page
  alias MoonWeb.Components.ComponentPageDescription
  alias MoonWeb.Components.ExamplesList
  alias MoonWeb.Components.PropsTable

  alias MoonWeb.Examples.Design.SwitchExample

  # TODO: move to example as soon as context will be propagated through moon helper
  alias MoonWeb.Components.ExampleAndCode
  alias Moon.Design.Switch

  def handle_event("toggle_dark", _params, socket) do
    is_dark = !String.contains?(socket.assigns.theme_name, "-dark")
    theme = String.replace(socket.assigns.theme_name, ["-light", "-dark"], "")
    {:noreply, assign(socket, theme_name: "#{theme}-#{(is_dark && "dark") || "light"}")}
  end

  defp dark_switch_code() do
    """
    alias Moon.Design.Switch

    def handle_event("toggle_dark", _params, socket) do
      is_dark = !String.contains?(socket.assigns.theme_name, "-dark")
      theme = String.replace(socket.assigns.theme_name, ["-light", "-dark"], "")
      {:noreply, assign(socket, theme_name: "\#{theme}-\#{is_dark && "dark" || "light"}")}
    end

    ...

    <Switch checked={String.contains?(@theme_name, "-dark")} on_change="toggle_dark" />
    """
  end

  data(breadcrumbs, :any,
    default: [
      %{
        to: "#",
        name: "Components"
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
      <ComponentPageDescription
        is_in_progress
        is_aria_support
        is_rtl_support
        title="Switch"
        image="facing/components/switch.png"
      >
        <p>
          Switch is a control that is used to quickly switch between two possible states.</p>
        <p>
          Switches are only used for these binary actions that occur immediately
          after the user “flips” the switch.
        </p>
        <p>They are commonly used for “on/off” switches.</p>
      </ComponentPageDescription>

      <ExamplesList examples={[
        # MoonWeb.Examples.FormExample.Registration,
        SwitchExample.Default,
        SwitchExample.Sizes,
        SwitchExample.Disabled,
        SwitchExample.WithIcons,
        SwitchExample.CustomBackground,
        SwitchExample.UsingWithForms,
        SwitchExample.CodeExampleForFullCustomization
      ]} />

      <ExampleAndCode title="On change" id="dark_switch">
        <:example>
          <Switch checked={String.contains?(@theme_name, "-dark")} on_change="toggle_dark" />
        </:example>
        <:code>{dark_switch_code()}</:code>
        <:state>@is_dark = {String.contains?(@theme_name, "-dark")} # example works only in our site's context</:state>
      </ExampleAndCode>

      <PropsTable
        title="Switch props"
        data={[
          %{
            :name => 'checked',
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
