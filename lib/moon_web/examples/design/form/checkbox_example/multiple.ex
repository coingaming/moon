defmodule MoonWeb.Examples.Design.Form.CheckboxExample.Multiple do
  @moduledoc false

  use Moon.StatefulComponent

  use MoonWeb, :example

  alias Moon.Design.Form.Checkbox
  alias Moon.Design.Form
  alias Moon.Design.Form.Field
  alias MoonWeb.Pages.Tutorials.AddDataUsingForm.User

  prop(user_changeset, :any, default: User.changeset(%User{}))

  prop(permissions, :list,
    default: [
      %{value: 1, key: "Read"},
      %{value: 2, key: "Write"},
      %{value: 3, key: "Update"},
      %{value: 4, key: "Delete"},
      %{value: 5, key: "Nuclear war", disabled: true}
    ]
  )

  def handle_event("changed", %{"user" => params}, socket) do
    {:noreply, assign(socket, user_changeset: User.changeset(%User{}, params))}
  end

  def render(assigns) do
    ~F"""
    <Form for={@user_changeset} change="changed">
      <Field field={:permissions} label="Permissions list">
        <Checkbox
          :for={perm <- @permissions}
          label={perm.key}
          hidden_input={false}
          checked_value={perm.value}
          is_multiple
        />
      </Field>
    </Form>
    """
  end

  def code() do
    """

    """
  end
end
