defmodule MoonWeb.Examples.Design.Form.CheckboxExample.WithForm do
  @moduledoc false

  use Moon.StatefulComponent

  use MoonWeb, :example

  alias Moon.Design.Form.Checkbox
  alias Moon.Design.Form
  alias Moon.Design.Form.Field
  alias MoonWeb.Schema.User

  prop(user_changeset, :any, default: User.changeset(%User{}))

  def handle_event("changed", %{"user" => params}, socket) do
    {:noreply, assign(socket, user_changeset: User.changeset(%User{}, params))}
  end

  def render(assigns) do
    ~F"""
    <Form for={@user_changeset} change="changed">
      <Field field={:agrees_to_terms_of_service}>
        <Checkbox label="With label" />
      </Field>
    </Form>
    """
  end

  def code() do
    """
    alias Moon.Design.Form.Checkbox
    alias Moon.Design.Form
    alias Moon.Design.Form.Field
    alias MoonWeb.Schema.User

    prop(user_changeset, :any, default: User.changeset(%User{}))

    def handle_event("changed", %{"user" => params}, socket) do
      {:noreply, assign(socket, user_changeset: User.changeset(%User{}, params))}
    end

    def render(assigns) do
      ~F\"""
      <Form for={@user_changeset} change="changed">
        <Field field={:agrees_to_terms_of_service}>
          <Checkbox label="With label" />
        </Field>
      </Form>
      \"""
    end
    """
  end
end
