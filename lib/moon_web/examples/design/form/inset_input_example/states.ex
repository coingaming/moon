defmodule MoonWeb.Examples.Design.Form.InsetInputExample.States do
  @moduledoc false

  use Moon.StatelessComponent

  use MoonWeb, :example

  alias Moon.Design.Form
  alias Moon.Design.Form.Input
  alias Moon.Design.Form.InsetField

  alias MoonWeb.Schema.User

  prop(user_changeset, :any, default: User.changeset(%User{}))

  def handle_event("changed", %{"user" => params}, socket) do
    {:noreply, assign(socket, user_changeset: User.changeset(%User{}, params))}
  end

  def render(assigns) do
    ~F"""
    <div class="flex flex-col lg:flex-row justify-around w-full gap-2">
      <Form for={@user_changeset}>
        <InsetField disabled label="Label" hint="Informative message holder">
          <Input placeholder="Disabled input" />
        </InsetField>
      </Form>
      <Form for={@user_changeset}>
        <InsetField readonly label="Label" hint="Informative message holder">
          <Input value="Read-only input" />
        </InsetField>
      </Form>
      <Form for={@user_changeset}>
        <InsetField label="Label">
          <Input error placeholder="Invalid input" />
        </InsetField>
        <InsetField.Hint class="text-chichi">Error message</InsetField.Hint>
      </Form>
    </div>
    """
  end

  def code() do
    """

    """
  end
end
