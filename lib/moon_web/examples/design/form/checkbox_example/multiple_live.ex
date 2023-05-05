defmodule MoonWeb.Examples.Design.Form.CheckboxExample.MultipleLive do
  @moduledoc """
  https://fly.io/phoenix-files/making-a-checkboxgroup-input/
  """

  use Phoenix.LiveComponent

  alias MoonWeb.Schema.User

  def handle_event("changed", %{"user" => params}, socket) do
    {:noreply, assign(socket, user: to_form(User.changeset(%User{}, params)))}
  end

  attr :user, Phoenix.HTML.Form, default: to_form(User.changeset(%User{permissions: [1, 2, 3]}))

  attr :permissions, :list,
    default: [
      %{value: 1, key: "Read"},
      %{value: 2, key: "Write"},
      %{value: 3, key: "Update"},
      %{value: 4, key: "Delete"},
      %{value: 5, key: "Nuclear war", disabled: true}
    ]

  def render(assigns) do
    ~H"""
    <div>
      <.form for={@user} phx-change="changed" phx-target={@myself}>
        <%= for perm <- @permissions do %>
          <label for={"user_permissions_#{perm.value}"}>
            <input
              type="checkbox"
              value={perm.value}
              name="user[permissions][]"
              id={"user_permissions_#{perm.value}"}
              checked={perm.value in (@user[:permissions].value || [])}
            />
            <%= perm.key %>
          </label>
        <% end %>
        <pre>@user = <%= inspect(@user, pretty: true) %></pre>
      </.form>
    </div>
    """
  end

  def code() do
    """

    """
  end
end
