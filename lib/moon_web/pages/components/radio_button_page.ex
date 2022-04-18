defmodule MoonWeb.Pages.Components.RadioButtonPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias Moon.Autolayouts.TopToDown
  alias Moon.Components.Button
  alias Moon.Components.RadioButton
  alias Moon.Components.ErrorTag
  alias Moon.Components.Field
  alias Moon.Components.Form
  alias Moon.Components.Heading
  alias MoonWeb.Components.ExampleAndCode
  alias MoonWeb.Components.Page
  alias MoonWeb.Pages.Tutorials.AddDataUsingForm.User

  data breadcrumbs, :any,
    default: [
      %{
        to: "#",
        name: "Components"
      },
      %{
        to: "/components/radio_button",
        name: "RadioButton"
      }
    ]

  def render(assigns) do
    ~F"""
    <Page theme_name={@theme_name} active_page={@active_page} breadcrumbs={@breadcrumbs}>
      <TopToDown>
        <Heading size={56} class="mb-4">RadioButton</Heading>

        <ExampleAndCode title="RadioButton" id="radio_button_1">
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

          <:code>{radio_button_1_code()}</:code>

          <:state>{radio_button_1_state(assigns)}</:state>
        </ExampleAndCode>
      </TopToDown>
    </Page>
    """
  end

  def mount(params, _session, socket) do
    user_changeset = User.changeset(%User{}, %{})

    {:ok,
     assign(socket,
       user_changeset: user_changeset,
       theme_name: params["theme_name"] || "sportsbet-dark",
       active_page: __MODULE__
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

  def radio_button_1_code do
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

  def radio_button_1_state(assigns) do
    ~F"""
    @user_changeset = {inspect(@user_changeset, pretty: true)}
    """
  end
end
