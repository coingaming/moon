defmodule MoonWeb.Examples.Design.Form.Simple do
  @moduledoc false

  use Moon.StatelessComponent

  use MoonWeb, :example

  alias MoonWeb.Pages.Tutorials.AddDataUsingForm.User
  alias Moon.Design.Form
  alias Moon.Design.Form.Select
  alias Moon.Design.Form.Input
  alias Moon.Design.Form.Textarea
  alias Moon.Design.Form.Field
  alias Moon.Design.Form.Switch

  prop(user_changeset, :any,
    default:
      User.changeset(%User{
        gender: "invalid",
        username: "userName",
        email: "my@e.mail",
        agrees_to_terms_of_service: false,
        agrees_to_marketing_emails: true
      })
  )

  prop(gender_options, :list,
    default: [
      [key: "Female", value: "female"],
      [key: "Male", value: "male"],
      [key: "Invalid choice", value: "invalid"],
      [key: "I identify as God and this is not important", value: "god", disabled: true]
    ]
  )

  def render(assigns) do
    ~F"""
    <Form for={@user_changeset}>
      <Field label="Label for select" hint="Hint for Select" field={:gender}>
        <Select options={@gender_options} />
      </Field>
      <Field label="Label for textinput" hint="Hint for Textinput" field={:username}>
        <Input />
      </Field>
      <Field label="Label for Textarea" hint="Hint for Textarea" field={:email}>
        <Textarea />
      </Field>
      <Field label="I agree terma of service" field={:agrees_to_terms_of_service}>
        <Switch id="test-form-switch" />
      </Field>
      <Field label="Marketing emails" field={:agrees_to_marketing_emails}>
        <Surface.Components.Form.Checkbox />
      </Field>
    </Form>
    """
  end

  def code() do
    """
    """
  end
end
