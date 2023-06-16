defmodule MoonWeb.Examples.Design.Form.InsetInputExample.CustomStyles do
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
    <Form for={@user_changeset} class="w-full">
      <InsetField>
        <Input placeholder="Placeholder" class="placeholder:text-frieza-60 bg-frieza-10" />
        <InsetField.Label class="text-piccolo">Label</InsetField.Label>
      </InsetField>
      <InsetField.Hint class="text-piccolo">Informative message holder</InsetField.Hint>
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
      <Form for={@user_changeset} class="w-full">
        <InsetField>
          <Input placeholder="Placeholder" class="placeholder:text-frieza-60 bg-frieza-10" />
          <InsetField.Label class="text-piccolo">Label</InsetField.Label>
        </InsetField>
        <InsetField.Hint class="text-piccolo">Informative message holder</InsetField.Hint>
      </Form>
      \"""
    end
    """
  end
end
