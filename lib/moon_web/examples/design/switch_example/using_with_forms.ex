defmodule MoonWeb.Examples.Design.SwitchExample.UsingWithForms do
  @moduledoc false

  use Moon.StatelessComponent
  use MoonWeb, :example

  alias Moon.Design.Form.Switch
  alias Moon.Components.Form
  alias MoonWeb.Pages.Tutorials.AddDataUsingForm.User

  prop(user_changeset, :any, default: User.changeset(%User{}))

  def render(assigns) do
    ~F"""
    <div>
      <Form for={@user_changeset}>
        <Switch name="notification" value="on" id="switch_11" />
      </Form>
    </div>
    """
  end

  def code() do
    """
    alias Moon.Design.Form.Switch
    alias Moon.Components.Form
    alias MoonWeb.Pages.Tutorials.AddDataUsingForm.User

    prop(user_changeset, :any, default: User.changeset(%User{}))

    ...

    <Form for={@user_changeset}>
      <Switch name="notification" value="on" id="switch_11" />
    </Form>
    """
  end
end
