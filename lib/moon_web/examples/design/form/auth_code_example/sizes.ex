defmodule MoonWeb.Examples.Design.Form.AuthCodeExample.Sizes do
  @moduledoc false

  use Moon.StatelessComponent
  use MoonWeb, :example

  alias Moon.Design.Form
  alias Moon.Design.Form.Field
  alias Moon.Design.Form.AuthCode

  alias MoonWeb.Schema.User

  prop(user_changeset, :any, default: User.changeset(%User{}))

  def render(assigns) do
    ~F"""
    <div class="flex flex-col gap-4">
      <Form for={@user_changeset}>
        <Field>
          <AuthCode size="sm">
            <AuthCode.Input />
          </AuthCode>
        </Field>
      </Form>
      <Form for={@user_changeset}>
        <Field>
          <AuthCode size="md">
            <AuthCode.Input />
          </AuthCode>
        </Field>
      </Form>
      <Form for={@user_changeset}>
        <Field>
          <AuthCode>
            <AuthCode.Input />
          </AuthCode>
        </Field>
      </Form>
      <Form for={@user_changeset}>
        <Field>
          <AuthCode size="xl">
            <AuthCode.Input />
          </AuthCode>
        </Field>
      </Form>
    </div>
    """
  end

  def code() do
    """

    """
  end
end
