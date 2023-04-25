defmodule MoonWeb.Examples.Design.DropdownExample.InForm do
  @moduledoc false

  use Moon.StatelessComponent

  use MoonWeb, :example

  alias MoonWeb.Pages.Tutorials.AddDataUsingForm.User
  alias Moon.Design.Form
  alias Moon.Design.Form.Dropdown

  prop(gender_options, :list,
    default: [
      [key: "Female", value: "female"],
      [key: "Male", value: "male"],
      [key: "Invalid choice", value: "invalid"],
      [key: "I identify as God and this is not important", value: "god", disabled: true]
    ]
  )

  prop(user_changeset, :any, default: User.changeset(%User{}))

  def render(assigns) do
    ~F"""
    <Form for={@user_changeset}>
      <Form.Field field={:gender}>
        <Dropdown options={_o <- @gender_options} prompt="Please select gender" />
      </Form.Field>
    </Form>
    """
  end

  def code() do
    """

    """
  end
end
