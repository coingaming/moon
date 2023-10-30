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
  alias MoonWeb.Components.Facing.DeprecationWarning

  data(breadcrumbs, :any,
    default: [
      %{
        to: "#",
        name: "Components v1"
      },
      %{
        to: "/components/radio-button",
        name: "RadioButton"
      }
    ]
  )

  data(props_info_array, :list,
    default: [
      %{
        :name => ~c"id",
        :type => ~c"string",
        :required => ~c"Yes",
        :default => ~c"-",
        :description => ~c"Unique element's identifier"
      },
      %{
        :name => ~c"default",
        :type => ~c"slot",
        :required => ~c"Yes",
        :default => ~c"-",
        :description => ~c"Represent a caption for an item"
      },
      %{
        :name => ~c"field",
        :type => ~c"atom",
        :required => ~c"Yes",
        :default => ~c"-",
        :description => ~c"Field name for underlying surface radio button component"
      },
      %{
        :name => ~c"aria_label",
        :type => ~c"-",
        :required => ~c"-",
        :default => ~c"-",
        :description => ~c"TODO - Defines a string value that labels the current element"
      },
      %{
        :name => ~c"checked",
        :type => ~c"boolean",
        :required => ~c"No",
        :default => ~c"false",
        :description =>
          ~c"A Boolean indicating whether or not this radio button is the default-selected item in the group"
      },
      %{
        :name => ~c"click",
        :type => ~c"event",
        :required => ~c"Yes",
        :default => ~c"-",
        :description => ~c"Event handler"
      }
    ]
  )

  def render(assigns) do
    ~F"""
    <Page {=@theme_name} {=@active_page} {=@breadcrumbs} {=@direction}>
      <ComponentPageDescription title="RadioButton">
        <DeprecationWarning
          name="Radio"
          href={live_path(MoonWeb.Endpoint, MoonWeb.Pages.Design.Form.RadioPage)}
        />
      </ComponentPageDescription>

      <ExampleAndCode title="RadioButton" id="radiobutton_1">
        <:example>
          <Form for={@user_changeset} change="register_form_update" submit="register_form_submit">
            <TopToDown>
              <Field name={:role}>
                <RadioButton id="role_admin" value="1">
                  Admin
                </RadioButton>
                <ErrorTag />
              </Field>
              <Field name={:role}>
                <RadioButton id="role_editor" value="2">
                  Editor
                </RadioButton>
                <ErrorTag />
              </Field>
              <Field name={:role}>
                <RadioButton id="role_user" value="3" disabled>
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

      <PropsTable title="RadioButton props" data={@props_info_array} />
    </Page>
    """
  end

  def mount(_params, _session, socket) do
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
