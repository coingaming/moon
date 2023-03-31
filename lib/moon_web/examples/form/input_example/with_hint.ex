defmodule MoonWeb.Examples.Form.InputExample.WithHint do
  @moduledoc false

  use Moon.StatelessComponent

  use MoonWeb, :example

  alias Moon.Design.Form
  alias Moon.Design.Form.Input
  alias Moon.Design.Form.Field
  alias MoonWeb.Pages.Tutorials.AddDataUsingForm.User

  prop(user_changeset, :any, default: User.changeset(%User{}))

  def handle_event("changed", %{"user" => params}, socket) do
    {:noreply, assign(socket, user_changeset: User.changeset(%User{}, params))}
  end

  def render(assigns) do
    ~F"""
    <div class="flex flex-col lg:flex-row justify-around items-end w-full gap-2">
      {#for size <- ~w(sm md lg)}
        <Form for={@user_changeset}>
          <Field hint={"Hint for #{size}"} field={:email}>
            <Input {=size} placeholder={"Placeholder for #{size}"} />
          </Field>
        </Form>
      {/for}
    </div>
    """
  end

  def code() do
    """
    alias Moon.Design.Form.Input
    alias Moon.Design.Form.Field

    ...

    <div class="flex flex-col lg:flex-row justify-around items-end w-full gap-2">
      {#for size <- ~w(sm md lg)}
        <Field hint={"Hint for \#{size}"} field={:gender}>
          <Input {=size} field={:gender} placeholder={"Placeholder for \#{size}"} />
        </Field>
      {/for}
    </div>
    """
  end
end
