defmodule MoonWeb.Examples.Design.Form.SelectExample.WithLabel do
  @moduledoc false

  use Moon.StatelessComponent

  use MoonWeb, :example

  alias MoonWeb.Schema.User
  alias Moon.Design.Form
  alias Moon.Design.Form.Select
  alias Moon.Design.Form.Field

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
    {#for size <- ~w(sm md lg)}
      <Form for={@user_changeset} class="w-2/5">
        <Field label={"Label for #{size}"} field={:gender} {=size}>
          <Select {=size} field={:gender} options={@gender_options} />
        </Field>
      </Form>
    {/for}
    """
  end

  def code() do
    """
    alias MoonWeb.Schema.User
    alias Moon.Design.Form
    alias Moon.Design.Form.Select
    alias Moon.Design.Form.Field

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
      {#for size <- ~w(sm md lg)}
        <Form for={@user_changeset} class="w-2/5">
          <Field label={"Label for \#{size}"} field={:gender} {=size}>
            <Select {=size} field={:gender} options={@gender_options} />
          </Field>
        </Form>
      {/for}
      \"""
    end
    """
  end
end
