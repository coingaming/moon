defmodule MoonWeb.Examples.Design.Form.AuthCodeExample.CustomLength do
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
    <Form for={@user_changeset}>
      <Field>
        <AuthCode length={4}>
          <AuthCode.Input />
        </AuthCode>
      </Field>
    </Form>
    """
  end

  def code() do
    """

    """
  end
end
