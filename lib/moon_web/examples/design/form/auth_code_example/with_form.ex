defmodule MoonWeb.Examples.Design.Form.AuthCodeExample.WithForm do
  @moduledoc false

  use Moon.StatefulComponent
  use MoonWeb, :example

  alias Moon.Design.Form
  alias Moon.Design.Form.Field
  alias Moon.Design.Form.AuthCode
  alias Moon.Design.Button

  alias MoonWeb.Schema.User
  alias MoonWeb.Components.Anatomy

  prop(user_changeset, :any, default: User.changeset(%User{authentication: ""}))

  def render(assigns) do
    ~F"""
    <div>
      <Form
        for={@user_changeset}
        submit="submit"
        class="flex flex-col gap-2 items-center"
        has_error_icon
      >
        <Field
          field={:authentication}
          hint="Hint message"
          class="flex flex-col ps-0"
          error_class="self-center"
          hint_class="self-center"
        >
          <AuthCode id="form-authcode">
            <AuthCode.Input />
          </AuthCode>
        </Field>
        <Button class="w-[19.75rem]" type="submit">Send code</Button>
        <Anatomy class="theme-moon-dark" title={false}>@user_changeset = {inspect(@user_changeset, pretty: true)}</Anatomy>
      </Form>
    </div>
    """
  end

  def handle_event("submit", _, socket) do
    user_changeset = Map.merge(socket.assigns.user_changeset, %{action: :insert})
    {:noreply, assign(socket, user_changeset: user_changeset)}
  end

  def code() do
    """
    alias Moon.Design.Form
    alias Moon.Design.Form.Field
    alias Moon.Design.Form.AuthCode
    alias Moon.Design.Button

    alias MoonWeb.Schema.User
    alias MoonWeb.Components.Anatomy

    prop(user_changeset, :any, default: User.changeset(%User{authentication: ""}))

    def render(assigns) do
      ~F\"""
      <Form
        for={@user_changeset}
        submit="submit"
        class="flex flex-col gap-2 items-center"
        has_error_icon
      >
        <Field
          field={:authentication}
          hint="Hint message"
          class="flex flex-col ps-0"
          error_class="self-center"
          hint_class="self-center"
        >
          <AuthCode>
            <AuthCode.Input />
          </AuthCode>
        </Field>
        <Button class="w-[19.75rem]" type="submit">Send code</Button>
        <Anatomy class="theme-moon-dark" title={false}>@user_changeset = {inspect(@user_changeset, pretty: true)}</Anatomy>
      </Form>
      \"""
    end

    def handle_event("submit", _, socket) do
      user_changeset = Map.merge(socket.assigns.user_changeset, %{action: :insert})
      {:noreply, assign(socket, user_changeset: user_changeset)}
    end
    """
  end
end
