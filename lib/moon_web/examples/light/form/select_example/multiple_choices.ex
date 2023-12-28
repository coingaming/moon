defmodule MoonWeb.Examples.Light.Form.SelectExample.MultipleChoices do
  @moduledoc false
  use Moon.Light.LiveComponent
  use MoonWeb, :example

  alias MoonWeb.Schema.User

  import Elixir.Moon.Light.Form

  attr(:user_changeset, :any, default: User.changeset(%User{}, %{permissions: [1, 2]}))

  attr(:permissions, :list,
    default: [
      %{value: 1, key: "Read"},
      %{value: 2, key: "Write"},
      %{value: 3, key: "Update"},
      %{value: 4, key: "Delete"},
      %{value: 5, key: "Nuclear war", disabled: true},
      %{value: 100, key: "Invalid"}
    ]
  )

  def render(assigns) do
    ~H"""
    <div>
      <.form :let={form} for={@user_changeset} phx-change="change" phx-target={@myself}>
        <.field label="User permissions" field={form[:permissions]}>
          <.select is_multiple field={form[:permissions]} options={@permissions} />
        </.field>
        <pre>
        <%= inspect(form[:permissions], pretty: true) %>
      </pre>
      </.form>
    </div>
    """
  end

  def handle_event("change", %{"user" => params}, socket) do
    user_changeset = User.changeset(%User{}, params)
    {:noreply, assign(socket, user_changeset: user_changeset)}
  end
end
