defmodule MoonWeb.Examples.Form.CheckboxExample.Readonly do
  @moduledoc false

  use Moon.StatefulComponent

  use MoonWeb, :example

  alias Moon.Design.Form.Checkbox
  alias Moon.Design.Form
  alias Moon.Design.Form.Field.Label
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
      <Label class="cursor-not-allowed" size="sm">
        <Checkbox readonly field={:agrees_to_terms_of_service} />
        Readonly checked
      </Label>
      <Label class="cursor-not-allowed" size="sm">
        <Checkbox readonly field={:agrees_to_marketing_emails} />
        Readonly unchecked
      </Label>
    </Form>
    """
  end

  def code() do
    """
    alias Moon.Design.Form.Checkbox
    alias Moon.Design.Form
    alias Moon.Design.Form.Field.Label
    alias MoonWeb.Pages.Tutorials.AddDataUsingForm.User

    prop(user_changeset, :any, default: User.changeset(%User{
      agrees_to_marketing_emails: false,
      agrees_to_terms_of_service: true
    }))

    def handle_event("changed", %{"user" => params}, socket) do
      {:noreply, assign(socket, user_changeset: User.changeset(%User{}, params))}
    end

    def render(assigns) do
      ~F\"""
      <Form for={@user_changeset} change="changed" class="flex flex-wap gap-2 w-full items-center justify-around">
        <Label size="sm" class="relative">
          <Checkbox readonly field={:agrees_to_terms_of_service} />
          Readonly checked
        </Label>
        <Label size="sm" class="relative">
          <Checkbox readonly field={:agrees_to_marketing_emails} />
          Readonly unchecked
        </Label>
      </Form>
      \"""
    end
    """
  end
end
