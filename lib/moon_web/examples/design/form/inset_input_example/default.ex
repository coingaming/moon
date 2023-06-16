defmodule MoonWeb.Examples.Design.Form.InsetInputExample.Default do
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
    <Form for={@user_changeset}>
      <InsetField label="Label">
        <Input placeholder="Placeholder" />
      </InsetField>
    </Form>
    """
  end

  def code() do
    """
    alias Moon.Design.Form
    alias Moon.Design.Form.Input
    alias Moon.Design.Form.InsetField
    alias MoonWeb.Schema.User

    prop(user_changeset, :any, default: User.changeset(%User{}))

    def handle_event("changed", %{"user" => params}, socket) do
      {:noreply, assign(socket, user_changeset: User.changeset(%User{}, params))}
    end

    def render(assigns) do
      ~F\"""
      <Form for={@user_changeset}>
        <InsetField label="Label">
          <Input placeholder="Placeholder" />
        </InsetField>
      </Form>
      \"""
    end
    """
  end
end
