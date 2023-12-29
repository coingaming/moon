defmodule MoonWeb.Examples.Light.FormExample.Registration do
  @moduledoc false
  use Moon.Light.LiveComponent
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

  attr(:user_changeset, :any,
    default:
      User.changeset(%User{
        gender: "invalid",
        username: "userName",
        email: "my@e.mail",
        agrees_to_terms_of_service: false,
        agrees_to_marketing_emails: true
      })
  )

  attr(:gender_options, :list,
    default: [
      [key: "Female", value: "female"],
      [key: "Male", value: "male"],
      [key: "Invalid choice", value: "invalid"],
      [key: "I identify as God and this is not important", value: "god", disabled: true]
    ]
  )

  def render(assigns) do
    ~H"""
    <.form
      :let={form}
      for={@user_changeset}
      phx-change="change"
      phx-target={@myself}
      phx-submit="submit"
    >
      <Elixir.Moon.Light.Form.field
        label="Label for select"
        hint="Hint for Select"
        field={form[:gender]}
      >
        <Elixir.Moon.Light.Form.select field={form[:gender]} options={@gender_options} />
      </Elixir.Moon.Light.Form.field>
      <Elixir.Moon.Light.Form.field
        label="Label for textinput"
        hint="Hint for Textinput"
        field={form[:username]}
      >
        <Elixir.Moon.Light.Form.input field={form[:username]} />
      </Elixir.Moon.Light.Form.field>
      <Elixir.Moon.Light.Form.field
        label="Label for TextArea"
        hint="Hint for TextArea"
        field={form[:email]}
      >
        <Elixir.Moon.Light.Form.text_area field={form[:email]} />
      </Elixir.Moon.Light.Form.field>
      <Elixir.Moon.Light.Form.field field={form[:agrees_to_terms_of_service]}>
        <Elixir.Moon.Light.Form.Field.label field={form[:agrees_to_terms_of_service]} size="sm">
          <Elixir.Moon.Light.Form.switch /> I agree terms of service
        </Elixir.Moon.Light.Form.Field.label>
      </Elixir.Moon.Light.Form.field>
      <Elixir.Moon.Light.Form.field field={form[:agrees_to_marketing_emails]}>
        <Elixir.Moon.Light.Form.Field.label field={form[:agrees_to_marketing_emails]} size="sm">
          <Elixir.Moon.Light.Form.checkbox /> Marketing emails
        </Elixir.Moon.Light.Form.Field.label>
      </Elixir.Moon.Light.Form.field>
      <.button type="submit">Submit</.button>
      <.moon module={Anatomy} class="theme-moon-dark" title={false}>
        @user_changeset = <%= inspect(@user_changeset, pretty: true) %>
      </.moon>
    </.form>
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
end
