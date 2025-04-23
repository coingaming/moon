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
        to: "/components",
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
          <Switch
            checked={String.contains?(@theme_name, "-dark")}
            on_change={"toggle_dark_mode", target: :live_view}
          />
        </:example>
        <:code>{dark_switch_code()}</:code>
        <:state>@is_dark = {String.contains?(@theme_name, "-dark")} # example works only in our site's context</:state>
      </ExampleAndCode>

      <PropsTable
        title="Switch props"
        data={[
          %{
            :name => ~c"checked",
            :type => ~c"boolean",
            :required => ~c"No",
            :default => ~c"false",
            :description => ~c"Is switch checked/unchecked"
          },
          %{
            :name => ~c"disabled",
            :type => ~c"boolean",
            :required => ~c"No",
            :default => ~c"-",
            :description => ~c"Set disabled/not disabled switch"
          },
          %{
            :name => ~c"on_bg_color",
            :type => ~c"css_class",
            :required => ~c"No",
            :default => ~c"bg-piccolo",
            :description => ~c"Tailwind class for custom on-state background color"
          },
          %{
            :name => ~c"off_bg_color",
            :type => ~c"css_class",
            :required => ~c"No",
            :default => ~c"bg-beerus",
            :description => ~c"Tailwind class for custom off-state background color"
          },
          %{
            :name => ~c"on_icon",
            :type => ~c"slot",
            :required => ~c"No",
            :default => ~c"-",
            :description => ~c"Set icon for checked state"
          },
          %{
            :name => ~c"off_icon",
            :type => ~c"slot",
            :required => ~c"No",
            :default => ~c"-",
            :description => ~c"Set icon for unchecked state"
          },
          %{
            :name => ~c"size",
            :type => ~c"2xs | xs | sm",
            :required => ~c"No",
            :default => ~c"sm",
            :description => ~c"Size of switch"
          },
          %{
            :name => ~c"on_change",
            :type => ~c"event",
            :required => ~c"No",
            :default => ~c"-",
            :description => ~c"The function to call when the switch is toggled"
          },
          %{
            :name => ~c"class",
            :type => ~c"css_class",
            :required => ~c"No",
            :default => ~c"-",
            :description => ~c"Tailwind classes for customization"
          },
          %{
            :name => ~c"switcher_class",
            :type => ~c"css_class",
            :required => ~c"No",
            :default => ~c"-",
            :description => ~c"Tailwind classes for customization of switcher element"
          }
        ]}
      />
    </Page>
    """
  end
end
