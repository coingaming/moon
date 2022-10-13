defmodule MoonWeb.Pages.Components.RadioButtonPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias Moon.Components.Button
  alias Moon.Components.RadioButton
  alias Moon.Components.ErrorTag
  alias Moon.Components.Field
  alias Moon.Components.Form
  alias Moon.Autolayouts.TopToDown
  alias MoonWeb.Components.ExampleAndCode
  alias MoonWeb.Components.Page
  alias MoonWeb.Components.ComponentPageDescription
  alias MoonWeb.Components.PropsTable
  alias MoonWeb.Pages.Tutorials.AddDataUsingForm.User

  data breadcrumbs, :any,
    default: [
      %{
        to: "#",
        name: "Components"
      },
      %{
        to: "/components/radio-button",
        name: "RadioButton"
      }
    ]

  data props_info_array, :list,
    default: [
      %{
        :name => 'id',
        :type => 'string',
        :required => 'true',
        :default => '-',
        :description => 'Unique element\'s identifier'
      },
      %{
        :name => 'default',
        :type => 'slot',
        :required => 'true',
        :default => '-',
        :description => 'Represent a caption for an item'
      },
      %{
        :name => 'field',
        :type => 'atom',
        :required => 'true',
        :default => '-',
        :description => 'Field name for underlying surface radio button component'
      },
      %{
        :name => 'aria_label',
        :type => '-',
        :required => '-',
        :default => '-',
        :description => 'TODO - Defines a string value that labels the current element'
      },
      %{
        :name => 'checked',
        :type => 'boolean',
        :required => 'false',
        :default => 'false',
        :description =>
          'A Boolean indicating whether or not this radio button is the default-selected item in the group'
      },
      %{
        :name => 'click',
        :type => 'event',
        :required => 'true',
        :default => '-',
        :description => 'Event handler'
      }
    ]

  def render(assigns) do
    ~F"""
    <Page {=@theme_name} {=@active_page} {=@breadcrumbs} {=@direction}>
      <ComponentPageDescription title="RadioButton">
        <p>
          Radio buttons are used to represent a group or category of choices whereby users can only select one option - the main difference from checkboxes that allow users to select multiple options.
        </p>
      </ComponentPageDescription>

      <ExampleAndCode title="RadioButton" id="radiobutton_1">
        <:example>
          <Form for={@user_changeset} change="register_form_update" submit="register_form_submit">
            <TopToDown>
              <Field name={:role}>
                <RadioButton id="role_admin" value={1}>
                  Admin
                </RadioButton>
                <ErrorTag />
              </Field>
              <Field name={:role}>
                <RadioButton id="role_editor" value={2}>
                  Editor
                </RadioButton>
                <ErrorTag />
              </Field>
              <Field name={:role}>
                <RadioButton id="role_user" value={3} disabled>
                  User (disabled)
                </RadioButton>
                <ErrorTag />
              </Field>
              <div>
                <Button type="submit" right_icon="arrows_right" variant="primary">Save</Button>
              </div>
            </TopToDown>
          </Form>
        </:example>
        <:code>{radiobutton_1_code()}</:code>
        <:state>{radiobutton_1_state(assigns)}</:state>
      </ExampleAndCode>

      <PropsTable data={@props_info_array} />
    </Page>
    """
  end

  def postmount(_params, _session, socket) do
    user_changeset =
      User.changeset(%User{}, %{
        role: 1
      })

    {:ok,
     assign(socket,
       user_changeset: user_changeset
     )}
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
    user_changeset = User.changeset(%User{}, params)

    {:noreply, assign(socket, user_changeset: user_changeset)}
  end

  def handle_event("register_form_submit", _, socket) do
    user_changeset = Map.merge(socket.assigns.user_changeset, %{action: :insert})

    {:noreply, assign(socket, user_changeset: user_changeset)}
  end

  def radiobutton_1_code do
    """
    <Form for={@user_changeset} change="register_form_update" submit="register_form_submit">
      <TopToDown>
        <Field name={:role}>
          <RadioButton id="role_admin" value={1}>
            Admin
          </RadioButton>
          <ErrorTag />
        </Field>
        <Field name={:role}>
          <RadioButton id="role_editor" value={2}>
            Editor
          </RadioButton>
          <ErrorTag />
        </Field>
        <Field name={:role}>
          <RadioButton id="role_user" value={3} disabled>
            User (disabled)
          </RadioButton>
          <ErrorTag />
        </Field>
        <div>
          <Button type="submit" right_icon="arrows_right" variant="primary">Save</Button>
        </div>
      </TopToDown>
    </Form>
    """
  end

  def radiobutton_1_state(assigns) do
    ~F"""
    @user_changeset = {inspect(@user_changeset, pretty: true)}
    """
  end
end
