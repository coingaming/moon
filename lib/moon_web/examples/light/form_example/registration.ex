defmodule MoonWeb.Examples.Light.FormExample.Registration do
  @moduledoc false
  use Moon.Light.LiveComponent
  use MoonWeb, :example
  alias MoonWeb.Schema.User
  alias MoonWeb.Components.Anatomy

  alias Elixir.Moon.Light.Form
  import Form
  import Elixir.Moon.Light.Form.Field, only: [label: 1]

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
    <div>
      <.form
        :let={form}
        for={@user_changeset}
        phx-change="change"
        phx-target={@myself}
        phx-submit="submit"
      >
        <.field label="Label for select" hint="Hint for Select" field={form[:gender]}>
          <.select field={form[:gender]} options={@gender_options} />
        </.field>
        <.field label="Label for textinput" hint="Hint for Textinput" field={form[:username]}>
          <.input field={form[:username]} />
        </.field>
        <.field label="Label for TextArea" hint="Hint for TextArea" field={form[:email]}>
          <.text_area field={form[:email]} />
        </.field>
        <.field field={form[:agrees_to_terms_of_service]}>
          <.label field={form[:agrees_to_terms_of_service]} size="sm">
            <Form.switch field={form[:agrees_to_terms_of_service]} /> I agree terms of service
          </.label>
        </.field>
        <.field field={form[:agrees_to_marketing_emails]}>
          <.label field={form[:agrees_to_marketing_emails]} size="sm">
            <Form.checkbox field={form[:agrees_to_marketing_emails]} /> Marketing emails
          </.label>
        </.field>
        <.button type="submit">Submit</.button>
        <.moon module={Anatomy} class="theme-moon-dark" title={false}>
          @user_changeset = <%= inspect(@user_changeset, pretty: true) %>
        </.moon>
      </.form>
    </div>
    """
  end

  def handle_event("change", p=%{"user" => params}, socket) do
    dbg(p)
    user_changeset = User.changeset(%User{}, params)
    {:noreply, assign(socket, user_changeset: user_changeset)}
  end

  def handle_event("submit", _, socket) do
    user_changeset = Map.merge(socket.assigns.user_changeset, %{action: :insert})
    {:noreply, assign(socket, user_changeset: user_changeset)}
  end
end
