defmodule MoonWeb.Examples.Design.Form.SelectExample.MultipleChoices do
  @moduledoc false

  use Moon.StatefulComponent
  use MoonWeb, :example

  alias MoonWeb.Schema.User
  alias Moon.Design.Form

  prop(user_changeset, :any, default: User.changeset(%User{}, %{permissions: [1, 2]}))

  prop(permissions, :list,
    default: [
      %{value: 1, key: "Read"},
      %{value: 2, key: "Write"},
      %{value: 3, key: "Update"},
      %{value: 4, key: "Delete"},
      %{value: 5, key: "Nuclear war", disabled: true}
    ]
  )

  def handle_event("change", %{"user" => params}, socket) do
    user_changeset = User.changeset(%User{}, params)
    {:noreply, assign(socket, user_changeset: user_changeset)}
  end

  def render(assigns) do
    ~F"""
    <div>
      <Form for={@user_changeset} change="change">
        <Form.Field label="User permissions" field={:permissions}>
          <Form.Select is_multiple options={@permissions} />
        </Form.Field>
      </Form>
    </div>
    """
  end

  def code() do
    """
    alias MoonWeb.Schema.User
    alias Moon.Design.Form

    prop(user_changeset, :any, default: User.changeset(%User{}, %{permissions: [1, 2]}))

    prop(permissions, :list,
      default: [
        %{value: 1, key: "Read"},
        %{value: 2, key: "Write"},
        %{value: 3, key: "Update"},
        %{value: 4, key: "Delete"},
        %{value: 5, key: "Nuclear war", disabled: true}
      ]
    )

    def handle_event("change", %{"user" => params}, socket) do
      user_changeset = User.changeset(%User{}, params)
      {:noreply, assign(socket, user_changeset: user_changeset)}
    end

    def render(assigns) do
      ~F\"""
      <Form for={@user_changeset} change="change">
        <Form.Field label="User permissions" field={:permissions}>
          <Form.Select options={@permissions} />
        </Form.Field>
      </Form>
      \"""
    end
    """
  end
end
