defmodule MoonWeb.Pages.Components.TextInputPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias Moon.Assets.Icons.IconMail
  alias Moon.Assets.Icons.IconUser
  alias Moon.Autolayouts.TopToDown
  alias Moon.Components.ErrorTag
  alias Moon.Components.Form
  alias Moon.Components.Field
  alias Moon.Components.Heading
  alias Moon.Components.TextInput
  alias Moon.Components.Button
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
        to: "/components/text_input",
        name: "Text Input"
      }
    ]

  data username, :string, default: ""
  data email, :string, default: ""

  def mount(params, _session, socket) do
    user_changeset =
      User.changeset(%User{}, %{
        username: "",
        email: ""
      })

    {:ok,
     assign(socket,
       theme_name: params["theme_name"] || "sportsbet-dark",
       active_page: __MODULE__,
       user_changeset: user_changeset
     )}
  end

  def handle_params(_params, uri, socket) do
    {:noreply, assign(socket, uri: uri)}
  end

  def render(assigns) do
    ~F"""
    <Page theme_name={@theme_name} active_page={@active_page} breadcrumbs={@breadcrumbs}>
      <TopToDown>
        <Heading size={56} class="mb-4">Text Input</Heading>

        <div>
          The input component is used when you need to let users enter the text of some kind, such as their name or phone number etc.
        </div>

        <ExampleAndCode id="example_1">
          <:example>
            <Form
              for={@user_changeset}
              change="register_form_update"
              submit="register_form_submit"
              autocomplete="off"
            >
              <TopToDown>
                <Field name={:username}>
                  <TextInput label="Username" placeholder="Username">
                    <:left_icon><IconUser /></:left_icon>
                    <:right_icon>
                      {#if String.length(@username) > 0}
                        <Moon.Icons.ControlsClose class="pointer" click="clear_username" />
                      {/if}
                    </:right_icon>
                  </TextInput>
                  <ErrorTag />
                </Field>
                <Field name={:email}>
                  <TextInput
                    label="Email"
                    placeholder="Email"
                    type="email"
                    disabled={!get_has_valid_username(@user_changeset)}
                  >
                    <:left_icon><IconMail /></:left_icon>
                  </TextInput>
                  <ErrorTag />
                </Field>
                <div>
                  <Button type="submit" right_icon="arrows_right" variant="primary">Register</Button>
                </div>
              </TopToDown>
            </Form>
          </:example>

          <:code>{example_1_code()}</:code>

          <:state>{example_1_state(assigns)}</:state>
        </ExampleAndCode>
      </TopToDown>
    </Page>
    """
  end

  def get_has_valid_username(user_changeset) do
    !Keyword.has_key?(user_changeset.errors, :username)
  end

  def handle_event(
        "register_form_update",
        %{
          "user" => %{
            "username" => username,
            "email" => email
          }
        },
        socket
      ) do
    user_changeset =
      User.changeset(%User{}, %{
        username: username,
        email: email
      })

    {:noreply, assign(socket, user_changeset: user_changeset, username: username, email: email)}
  end

  def handle_event(
        "register_form_update",
        %{
          "user" => %{
            "username" => username
          }
        },
        socket
      ) do
    user_changeset =
      User.changeset(%User{}, %{
        username: username,
        email: socket.assigns.email
      })

    {:noreply, assign(socket, user_changeset: user_changeset, username: username)}
  end

  def handle_event("register_form_submit", _, socket) do
    user_changeset = Map.merge(socket.assigns.user_changeset, %{action: :insert})

    {:noreply, assign(socket, user_changeset: user_changeset)}
  end

  def handle_event("clear_username", _, socket) do
    user_changeset =
      User.changeset(%User{}, %{
        username: "",
        email: socket.assigns.email
      })

    {:noreply, assign(socket, user_changeset: user_changeset, username: "")}
  end

  def example_1_code() do
    """
    <Form
      for={@user_changeset}
      change="register_form_update"
      submit="register_form_submit"
      autocomplete="off"
    >
      <TopToDown>
        <Field name={:username}>
          <TextInput label="Username" placeholder="Username">
            <:left_icon><IconUser /></:left_icon>
            <:right_icon>
              {#if String.length(@username) > 0}
                <Moon.Icons.ControlsClose class="pointer" click="clear_username" />
              {/if}
            </:right_icon>
          </TextInput>
          <ErrorTag />
        </Field>
        <Field name={:email}>
          <TextInput label="Email" placeholder="Email" type="email" disabled={!get_has_valid_username(@user_changeset)}>
            <:left_icon><IconMail /></:left_icon>
          </TextInput>
          <ErrorTag />
        </Field>
        <div>
          <Button type="submit" right_icon="arrows_right" variant="primary">Register</Button>
        </div>
      </TopToDown>
    </Form>
    """
  end

  def example_1_state(assigns) do
    ~F"""
    @user_changeset = {inspect(@user_changeset, pretty: true)}
    @username = {inspect(@username, pretty: true)}
    """
  end
end
