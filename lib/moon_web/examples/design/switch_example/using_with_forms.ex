defmodule MoonWeb.Examples.Design.SwitchExample.UsingWithForms do
  @moduledoc false

  use Moon.StatefulComponent
  use MoonWeb, :example

  alias Moon.Design.Form.Switch
  alias Moon.Design.Form
  alias Moon.Design.Form.Field
  alias MoonWeb.Pages.Tutorials.AddDataUsingForm.User

  prop(user_changeset, :any, default: User.changeset(%User{}))

  def handle_event("change", %{"user" => params}, socket) do
    user_changeset = User.changeset(%User{}, params)
    {:noreply, assign(socket, user_changeset: user_changeset)}
  end

  def render(assigns) do
    ~F"""
    <div>
      <Form for={@user_changeset} change="change">
        <Field field={:notification}>
          <Switch />
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
