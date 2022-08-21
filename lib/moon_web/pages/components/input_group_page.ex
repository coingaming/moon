defmodule MoonWeb.Pages.Components.InputGroupPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias MoonWeb.Components.ComponentPageDescription
  alias MoonWeb.Components.ExampleAndCode
  alias MoonWeb.Components.Page

  alias Moon.Components.Form
  alias Moon.Components.InputGroup
  alias Moon.Components.Select.SingleSelect
  alias Moon.Components.TextInput

  alias MoonWeb.Pages.Tutorials.AddDataUsingForm.User

  data breadcrumbs, :any,
    default: [
      %{
        to: "#",
        name: "Components"
      },
      %{
        to: "/components/input-group",
        name: "Input group"
      }
    ]

  def render(assigns) do
    ~F"""
    <Page theme_name={@theme_name} active_page={@active_page} breadcrumbs={@breadcrumbs}>
      <ExampleAndCode title="Vertical" id="example_1">
        <:example>
          <Form for={@user_changeset} change="form_update" submit="form_update">
            <InputGroup orientation="vertical" error_from_field={:name_or_role_error}>
              <TextInput size="xl" label="Name" placeholder="e.g. 1234" field={:name} />
              <SingleSelect
                size="xlarge"
                id="user-roles-example-1"
                options={User.available_roles()}
                field={:role}
              />
            </InputGroup>
          </Form>

          <Form for={@user_changeset} change="form_update" submit="form_update">
            <InputGroup orientation="horizontal" error_from_field={:name_or_role_error}>
              <TextInput size="xl" label="Name" placeholder="e.g. 1234" field={:name} />
              <SingleSelect
                size="xlarge"
                id="user-roles-example-2"
                options={User.available_roles()}
                field={:role}
              />
            </InputGroup>
          </Form>
        </:example>
        <:code>{example_1_code()}</:code>
      </ExampleAndCode>
      <ComponentPageDescription title="Table">
        <p>
          Coming soon...
        </p>
      </ComponentPageDescription>
    </Page>
    """
  end

  def mount(params, _session, socket) do
    user = %User{}

    user_changeset =
      User.changeset(user, %{}) |> Ecto.Changeset.add_error(:name_or_role_error, "example error")

    user_changeset = Map.merge(user_changeset, %{action: :insert})

    {:ok,
     assign(socket,
       theme_name: params["theme_name"] || "moon-design-light",
       active_page: __MODULE__,
       user: user,
       user_changeset: user_changeset
     )}
  end

  def handle_event("form_update", params, socket) do
    user_changeset = User.changeset(socket.assigns.user, params["user"])

    {:noreply, assign(socket, user_changeset: user_changeset)}
  end

  def example_1_code() do
    """
    code1
    """
  end

  def example_2_code() do
    """
    code2
    """
  end
end
