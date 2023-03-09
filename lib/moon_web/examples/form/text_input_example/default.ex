defmodule MoonWeb.Examples.Form.TextInputExample.Default do
  @moduledoc false

  use Moon.StatelessComponent

  use MoonWeb, :example

  alias MoonWeb.Pages.Tutorials.AddDataUsingForm.User
  alias Moon.Design.Form.TextInput

  prop(user_changeset, :any, default: User.changeset(%User{}))

  def render(assigns) do
    ~F"""
    <TextInput field={:username} />
    """
  end

  def code() do
    """

    """
  end
end
