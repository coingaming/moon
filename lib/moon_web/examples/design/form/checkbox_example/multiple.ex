defmodule MoonWeb.Examples.Design.Form.CheckboxExample.Multiple do
  @moduledoc false

  use Moon.StatefulComponent

  use MoonWeb, :example

  alias Moon.Design.Form.Checkbox
  alias Moon.Design.Form
  alias Moon.Design.Form.Field
  alias MoonWeb.Schema.User

  alias MoonWeb.Components.Anatomy

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

  def handle_event("changed", value, socket) do
    {:noreply,
     assign(socket, user_changeset: User.changeset(%User{}, Map.get(value, "user", %{})))}
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
          disabled={perm[:disabled]}
          is_multiple
        />
      </Field>
      <Anatomy title={false}>@user_changeset = {inspect(@user_changeset, pretty: true)}</Anatomy>
    </Form>
    """
  end

  def code() do
    """
    alias Moon.Design.Form.Checkbox
    alias Moon.Design.Form
    alias Moon.Design.Form.Field
    alias MoonWeb.Schema.User

    alias MoonWeb.Components.Anatomy

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

    def handle_event("changed", value, socket) do
      {:noreply,
      assign(socket, user_changeset: User.changeset(%User{}, Map.get(value, "user", %{})))}
    end

    def render(assigns) do
      ~F\"""
      <Form for={@user_changeset} change="changed">
        <Field field={:permissions} label="Permissions list">
          <Checkbox
            :for={perm <- @permissions}
            label={perm.key}
            hidden_input={false}
            checked_value={perm.value}
            disabled={perm[:disabled]}
            is_multiple
          />
        </Field>
        <Anatomy title={false}>@user_changeset = {inspect(@user_changeset, pretty: true)}</Anatomy>
      </Form>
      \"""
    end
    """
  end
end
