defmodule MoonWeb.Examples.Form.TextInputExample.Disabled do
  @moduledoc false

  use Moon.StatelessComponent

  use MoonWeb, :example

  alias MoonWeb.Pages.Tutorials.AddDataUsingForm.User
  alias Moon.Design.Form.TextInput

  prop(user_changeset, :any, default: User.changeset(%User{}))

  def render(assigns) do
    ~F"""
    <div class="flex flex-col lg:flex-row justify-around items-end w-full gap-2">
      <TextInput disabled placeholder="Disabled input" />
      <TextInput readonly placeholder="Read-only input" />
    </div>
    """
  end

  def code() do
    """

    """
  end
end
