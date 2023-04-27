defmodule MoonWeb.Examples.Design.Form.CheckboxExample.Readonly do
  @moduledoc false

  use Moon.StatefulComponent

  use MoonWeb, :example

  alias Moon.Design.Form
  alias Moon.Design.Form.Checkbox
  alias Moon.Design.Form.Field
  alias MoonWeb.Pages.Tutorials.AddDataUsingForm.User

  prop(user_changeset, :any,
    default:
      User.changeset(%User{
        agrees_to_marketing_emails: false,
        agrees_to_terms_of_service: true
      })
  )

  def handle_event("changed", %{"user" => params}, socket) do
    {:noreply, assign(socket, user_changeset: User.changeset(%User{}, params))}
  end

  def render(assigns) do
    ~F"""
    <Form
      for={@user_changeset}
      change="changed"
      class="flex flex-wap gap-2 w-full items-center justify-around"
    >
      <Field field={:agrees_to_terms_of_service}>
        <Checkbox readonly label="Readonly checked" />
      </Field>
      <Field field={:agrees_to_marketing_emails}>
        <Checkbox readonly label="Readonly unchecked" />
      </Field>
    </Form>
    """
  end

  def code() do
    """
    alias Moon.Design.Form
    alias Moon.Design.Form.Checkbox
    alias Moon.Design.Form.Field
    alias MoonWeb.Pages.Tutorials.AddDataUsingForm.User

    prop(user_changeset, :any,
      default:
        User.changeset(%User{
          agrees_to_marketing_emails: false,
          agrees_to_terms_of_service: true
        })
    )

    def handle_event("changed", %{"user" => params}, socket) do
      {:noreply, assign(socket, user_changeset: User.changeset(%User{}, params))}
    end

    def render(assigns) do
      ~F\"""
      <Form
        for={@user_changeset}
        change="changed"
        class="flex flex-wap gap-2 w-full items-center justify-around"
      >
        <Field field={:agrees_to_terms_of_service}>
          <Checkbox readonly label="Readonly checked" />
        </Field>
        <Field field={:agrees_to_marketing_emails}>
          <Checkbox readonly label="Readonly unchecked" />
        </Field>
      </Form>
      \"""
    end
    """
  end
end
