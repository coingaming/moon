defmodule MoonWeb.Examples.Design.DropdownExample.Customizations do
  @moduledoc false

  use Moon.StatefulComponent

  use MoonWeb, :example

  alias MoonWeb.Pages.Tutorials.AddDataUsingForm.User
  alias Moon.Design.Form
  alias Moon.Design.Form.Dropdown
  alias Moon.Design.Dropdown.Option
  alias Moon.Lego

  alias MoonWeb.Components.Anatomy

  prop(gender_options, :list,
    default: [
      [key: "Female", value: "female"],
      [key: "Male", value: "male"],
      [key: "Invalid choice", value: "invalid"],
      [key: "I identify as God and this is not important", value: "god", disabled: true]
    ]
  )

  prop(permissions, :list,
    default: [
      %{value: 1, key: "Read"},
      %{value: 2, key: "Write"},
      %{value: 3, key: "Update"},
      %{value: 4, key: "Delete"},
      %{value: 5, key: "Nuclear war", disabled: true}
    ]
  )

  prop(changeset1, :any, default: User.changeset(%User{}))
  prop(changeset2, :any, default: User.changeset(%User{}))
  prop(target2, :list, default: [])
  prop(changeset3, :any, default: User.changeset(%User{}))

  def handle_event("change" <> num, params, socket) do
    user_changeset = User.changeset(%User{}, Map.get(params, "user", %{}))

    {:noreply,
     assign(socket,
       "changeset#{num}": user_changeset,
       "target#{num}": Map.get(params, "_target", [])
     )}
  end

  def render(assigns) do
    ~F"""
    <Form for={@changeset3} change="change3" id="user3">
      <Form.Field field={:gender}>
        <Dropdown options={o <- @gender_options} prompt="Please select gender">
          <Option>
            <Lego.Title>{o[:key]}</Lego.Title>
            <Lego.Radio />
          </Option>
        </Dropdown>
      </Form.Field>
      <Anatomy title={false}>@changeset3 = {inspect(@changeset3, pretty: true)}</Anatomy>
    </Form>
    """
  end

  def code() do
    """

    """
  end
end
