defmodule MoonWeb.Examples.Design.FormExample.Registration do
  @moduledoc false

  use Moon.StatefulComponent

  use MoonWeb, :example

  alias MoonWeb.Schema.User
  alias Moon.Design.Form
  alias Moon.Design.Form.Field.Label
  alias Moon.Design.Form.Select
  alias Moon.Design.Form.Input
  alias Moon.Design.Form.TextArea
  alias Moon.Design.Form.Field
  alias Moon.Design.Form.Switch
  alias Moon.Design.Form.Checkbox
  alias Moon.Design.Button

  alias MoonWeb.Components.Anatomy

  prop(user_changeset, :any,
    default:
      User.changeset(%User{
        gender: "invalid",
        username: "userName",
        email: "my@e.mail",
        agrees_to_terms_of_service: false,
        agrees_to_marketing_emails: true
      })
  )

  prop(gender_options, :list,
    default: [
      [key: "Female", value: "female"],
      [key: "Male", value: "male"],
      [key: "Invalid choice", value: "invalid"],
      [key: "I identify as God and this is not important", value: "god", disabled: true]
    ]
  )

  def render(assigns) do
    ~F"""
    <div>
      <Form for={@user_changeset} change="change" submit="submit">
        <Field label="Label for select" hint="Hint for Select" field={:gender}>
          <Select options={@gender_options} />
        </Field>
        <Field label="Label for textinput" hint="Hint for Textinput" field={:username}>
          <Input />
        </Field>
        <Field label="Label for TextArea" hint="Hint for TextArea" field={:email}>
          <TextArea />
        </Field>
        <Field field={:agrees_to_terms_of_service}>
          <Label size="sm">
            <Switch />
            I agree terms of service
          </Label>
        </Field>
        <Field field={:agrees_to_marketing_emails}>
          <Label size="sm">
            <Checkbox />
            Marketing emails
          </Label>
        </Field>
        <Button type="submit">Submit</Button>
        <Anatomy class="theme-moon-dark" title={false}>@user_changeset = {inspect(@user_changeset, pretty: true)}</Anatomy>
      </Form>
    </div>
    """
  end

  def handle_event("change", %{"user" => params}, socket) do
    user_changeset = User.changeset(%User{}, params)
    {:noreply, assign(socket, user_changeset: user_changeset)}
  end

  def handle_event("submit", _, socket) do
    user_changeset = Map.merge(socket.assigns.user_changeset, %{action: :insert})
    {:noreply, assign(socket, user_changeset: user_changeset)}
  end

  def code() do
    """
    """
  end
end
