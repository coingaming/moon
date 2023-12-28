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
      %{value: 5, key: "Nuclear war", disabled: true}
    ]
  )

  def render(assigns) do
    ~H"""
    <div>
    <Moon.Light.form for={@user_changeset} change={%Event{name: "change", target: @myself}}>
      <.field label="User permissions" field={:permissions}>
        <.select field={:permissions} form={to_form(@user_changeset)} options={@permissions} />
      </.field>
    </Moon.Light.form>
    </div>
    """
  end

  def handle_event("change", %{"user" => params}, socket) do
    user_changeset = User.changeset(%User{}, params)
    {:noreply, assign(socket, user_changeset: user_changeset)}
  end

end
