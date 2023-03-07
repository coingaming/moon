defmodule MoonWeb.Pages.Design.SwitchPage do
  @moduledoc false

  require Logger
  use MoonWeb, :live_view

  alias MoonWeb.Components.Page
  alias MoonWeb.Components.ComponentPageDescription
  alias MoonWeb.Components.ExamplesList
  alias MoonWeb.Components.PropsTable

  alias MoonWeb.Examples.Design.SwitchExample

  alias MoonWeb.Components.ExampleAndCode

  alias Moon.Design.TestSwitch
  alias Moon.Components.Field
  alias Moon.Components.Form
  alias MoonWeb.Pages.Tutorials.AddDataUsingForm.User

  alias Moon.Icons.GenericCheckRounded
  alias Moon.Icons.GenericClose

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

      <ExampleAndCode title="Working example" id="switch_2_sample">
        <:example>
        <Form for={@user_changeset} change="register_form_update" submit="register_form_submit">
        <Field name={:agrees_to_terms_of_service}>
          <TestSwitch id="switch_3_1" size="2xs">
            <:on_icon><GenericCheckRounded /></:on_icon>
            <:off_icon><GenericClose /></:off_icon>
          </TestSwitch>
        </Field>
       </Form>
        </:example>
        <:example>
        <Form for={@user_changeset} change="register_form_update" submit="register_form_submit">
        <Field name={:agrees_to_terms_of_service}>
          <TestSwitch id="switch_3_1" size="xs">
            <:on_icon><GenericCheckRounded /></:on_icon>
            <:off_icon><GenericClose /></:off_icon>
          </TestSwitch>
        </Field>
       </Form>
        </:example>
        <:example>
        <Form for={@user_changeset} change="register_form_update" submit="register_form_submit">
        <Field name={:agrees_to_terms_of_service}>
          <TestSwitch id="switch_3_1">
            <:on_icon><GenericCheckRounded /></:on_icon>
            <:off_icon><GenericClose /></:off_icon>
          </TestSwitch>
        </Field>
       </Form>
        </:example>
      </ExampleAndCode>



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
          }
        ]}
      />
    </Page>
    """
  end

  def mount(_params, _session, socket) do
    user = %User{}

    user_changeset =
      User.changeset(%User{}, %{
        agrees_to_terms_of_service: true,
        agrees_to_marketing_emails: false
      })

    socket =
      assign(socket,
        user_changeset: user_changeset,
        small_switch_checked: false,
        medium_switch_checked: false,
        large_switch_checked: false,
        icons_switch_checked: false,
        captions_switch_checked: false,
        user: user
      )

    {:ok, socket}
  end

  def handle_params(_params, uri, socket) do
    {:noreply, assign(socket, uri: uri)}
  end

  def handle_event(
        "register_form_update",
        %{
          "user" => params
        },
        socket
      ) do
    user_changeset = User.changeset(socket.assigns.user, params)
    {:noreply, assign(socket, user_changeset: user_changeset)}
  end

  def handle_event("register_form_submit", params, socket) do
    user_changeset =
      User.changeset(socket.assigns.user, params["user"]) |> Map.merge(%{action: :insert})

    {:noreply, assign(socket, user_changeset: user_changeset)}
  end

  def switch_1_state(assigns) do
    ~F"""
    @user_changeset = {inspect(@user_changeset, pretty: true)}
    """
  end
end
