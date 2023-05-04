defmodule MoonWeb.Examples.Design.DropdownExample.CustomInForm do
  @moduledoc false

  use Moon.StatefulComponent

  use MoonWeb, :example

  alias MoonWeb.Schema.User
  alias Moon.Design.Form
  alias Moon.Design.Dropdown
  alias Moon.Lego

  alias MoonWeb.Components.Anatomy

  prop(gender_options, :list, default: User.gender_options())

  prop(permissions, :list, default: User.available_permissions())

  prop(changeset, :any, default: User.changeset(%User{}))

  def handle_event("change", params, socket) do
    changeset = User.changeset(%User{}, Map.get(params, "user", %{}))
    {:noreply, assign(socket, changeset: changeset)}
  end

  def render(assigns) do
    ~F"""
    <Form for={@changeset} change="change" id="user_very_custom">
      <Form.Field field={:gender}>
        <Dropdown id="my-custom-dropdown">
          <Dropdown.Select class="rotate-180" prompt="Select country" value="hello"/>
          <Dropdown.Options class="rounded-none my-0 shadow-chichi">
            <Dropdown.Option :for={o <- @gender_options}>
              <Form.Radio.Button value={o[:value]} label={o[:key]} />
            </Dropdown.Option>
          </Dropdown.Options>
        </Dropdown>
      </Form.Field>
      <Anatomy class="theme-moon-dark rounded-none" title={false}>@changeset = {inspect(@changeset, pretty: true)}</Anatomy>
    </Form>
    """
  end

  def code() do
    """

    """
  end
end
