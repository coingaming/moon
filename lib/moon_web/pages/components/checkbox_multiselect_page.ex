defmodule MoonWeb.Pages.Components.CheckboxMultiselectPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias Moon.Autolayouts.TopToDown
  alias Moon.Components.CheckboxMultiselect
  alias Moon.Components.ErrorTag
  alias Moon.Components.Field
  alias Moon.Components.Form
  alias MoonWeb.Components.Page
  alias MoonWeb.Components.ExampleAndCode
  alias MoonWeb.Pages.Tutorials.AddDataUsingForm.User

  data breadcrumbs, :any,
    default: [
      %{
        to: "#",
        name: "Components"
      },
      %{
        to: "/components/dropbox#checkbox-multiselct",
        name: "Checkbox multiselect"
      }
    ]

  data available_roles, :any
  data user_changeset, :any

  def render(assigns) do
    ~F"""
    <Page theme_name={@theme_name} active_page={@active_page} breadcrumbs={@breadcrumbs}>
      <TopToDown>
        <h1>Checkbox multiselect</h1>

        <ExampleAndCode id="example_1">
          <:example>
            <Form
              for={@user_changeset}
              change="register_form_update"
              submit="register_form_submit"
              autocomplete="off"
            >
              <TopToDown>
                <Field name={:applied_roles}>
                  <CheckboxMultiselect
                    options={@available_roles}
                  />
                  <ErrorTag />
                </Field>
              </TopToDown>
            </Form>
          </:example>
        </ExampleAndCode>
      </TopToDown>
    </Page>
    """
  end

  def mount(params, _session, socket) do
    available_roles = [
      %{id: 1, name: "Admin"},
      %{id: 2, name: "User"}
    ]

    user_changeset =
      User.changeset(%User{}, %{
        applied_roles: [1]
      })

    socket =
      assign(socket,
        user_changeset: user_changeset,
        available_roles: available_roles,
        theme_name: params["theme_name"] || "sportsbet-dark",
        active_page: __MODULE__
      )

    {:ok, socket}
  end

  def handle_event(
        "register_form_update",
        %{
          "user" => params
        },
        socket
      ) do
    IO.puts(inspect(params))
    #user_changeset = User.changeset(%User{}, params)
    # {:noreply, assign(socket, user_changeset: user_changeset)}
    {:noreply, socket}
  end

  def handle_params(_params, uri, socket) do
    {:noreply, assign(socket, uri: uri)}
  end
end
