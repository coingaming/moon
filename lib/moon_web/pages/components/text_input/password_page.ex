defmodule MoonWeb.Pages.Components.TextInput.PasswordPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias Moon.Autolayouts.TopToDown
  alias Moon.Components.Button
  alias Moon.Components.ErrorTag
  alias Moon.Components.Field
  alias Moon.Components.Form
  alias Moon.Components.Heading
  alias Moon.Components.PasswordInput
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
        to: "/components/text-input/password",
        name: "Password"
      }
    ]

  def mount(params, _session, socket) do
    user_changeset =
      User.changeset(%User{}, %{
        password: ""
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
        <Heading size={56} class="mb-4">Password Input</Heading>

        <ExampleAndCode id="example_1">
          <:example>
            <Form
              for={@user_changeset}
              change="login_form_update"
              submit="login_form_submit"
              autocomplete="off"
            >
              <TopToDown>
                <Field name={:password}>
                  <PasswordInput label="Password" placeholder="Password" id="login_password">
                    <:left_icon><Moon.Icons.SecurityLock /></:left_icon>
                  </PasswordInput>
                  <ErrorTag />
                </Field>
                <div>
                  <Button type="submit" right_icon="arrows_right" variant="primary">Login</Button>
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

  def handle_event(
        "login_form_update",
        %{
          "user" => %{
            "password" => password
          }
        },
        socket
      ) do
    user_changeset =
      User.changeset(%User{}, %{
        password: password
      })

    {:noreply, assign(socket, user_changeset: user_changeset)}
  end

  def handle_event("login_form_submit", _, socket) do
    user_changeset = Map.merge(socket.assigns.user_changeset, %{action: :insert})

    {:noreply, assign(socket, user_changeset: user_changeset)}
  end

  def example_1_code do
    """
    <Form
      for={@user_changeset}
      change="login_form_update"
      submit="login_form_submit"
      autocomplete="off"
    >
      <TopToDown>
        <Field name={:password}>
          <PasswordInput label="Password" placeholder="Password" id="login_password">
            <:left_icon><Moon.Icons.SecurityLock /></:left_icon>
          </PasswordInput>
          <ErrorTag />
        </Field>
        <div>
          <Button type="submit" right_icon="arrows_right" variant="primary">Login</Button>
        </div>
      </TopToDown>
    </Form>
    """
  end

  def example_1_state(assigns) do
    ~F"""
    @user_changeset = {inspect(@user_changeset, pretty: true)}
    """
  end
end
