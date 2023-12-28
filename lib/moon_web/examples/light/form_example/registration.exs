defmodule MoonWeb.Examples.Light.FormExample.Registration do
  @moduledoc false
  use Moon.Light.LiveComponent
  use MoonWeb, :example
  alias MoonWeb.Schema.User
  alias Moon.Design.Form

  alias MoonWeb.Components.Anatomy

  import Moon.Light.Form
  import Moon.Light.Form.Field, only: [label: 1]

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
    <.moon
      module={Form}
      for={@user_changeset}
      change={%Event{name: "change", target: @myself}}
      submit={%Event{name: "submit", target: @myself}}
    >
      <.field label="Label for select" hint="Hint for Select" field={:gender}>
        <.select options={@gender_options} />
      </.field>
      <.field label="Label for textinput" hint="Hint for Textinput" field={:username}>
        <.input />
      </.field>
      <.field label="Label for TextArea" hint="Hint for TextArea" field={:email}>
        <.text_area />
      </.field>
      <.field field={:agrees_to_terms_of_service}>
        <.label size="sm">
          <Moon.Light.Form.switch /> I agree terms of service
        </.label>
      </.field>
      <.field field={:agrees_to_marketing_emails}>
        <.label size="sm">
          <.checkbox /> Marketing emails
        </.label>
      </.field>
      <.button type="submit">Submit</.button>
      <.moon module={Anatomy} class="theme-moon-dark" title={false}>
        @user_changeset = <%= inspect(@user_changeset, pretty: true) %>
      </.moon>
    </.moon>
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
    ""
  end
end
