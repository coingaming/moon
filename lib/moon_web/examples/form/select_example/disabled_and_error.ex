defmodule MoonWeb.Examples.Form.SelectExample.DisabledAndError do
  @moduledoc false

  use Moon.StatelessComponent

  use MoonWeb, :example

  alias MoonWeb.Pages.Tutorials.AddDataUsingForm.User
  alias Moon.Design.Form
  alias Moon.Design.Form.Select

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
      <div class="flex flex-col lg:flex-row justify-around items-end w-full gap-2">
        <Select disabled field={:gender} options={@gender_options} prompt="Please select gender" />
        <Select error field={:gender} options={@gender_options} prompt="Please select gender" />
      </div>
    </Form>
    """
  end

  def code() do
    """
    alias MoonWeb.Pages.Tutorials.AddDataUsingForm.User
    alias Moon.Design.Form
    alias Moon.Design.Form.Select

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
      ~F\"""
      <Form for={@user_changeset}>
        <Select disabled field={:gender} options={@gender_options} prompt="Please select gender" />
        <Select error field={:gender} options={@gender_options} prompt="Please select gender" />
      </Form>
      \"""
    end
    """
  end
end
