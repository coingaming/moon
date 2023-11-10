defmodule MoonWeb.Examples.Design.Form.InputExample.WithHint do
  @moduledoc false

  use Moon.StatelessComponent

  use MoonWeb, :example

  alias Moon.Design.Form
  alias Moon.Design.Form.Input
  alias Moon.Design.Form.Field
  alias MoonWeb.Schema.User
  alias Moon.Icon

  prop(user_changeset, :any, default: User.changeset(%User{}))

  def handle_event("changed", %{"user" => params}, socket) do
    {:noreply, assign(socket, user_changeset: User.changeset(%User{}, params))}
  end

  def render(assigns) do
    ~F"""
    <div class="flex flex-col lg:flex-row justify-around w-full gap-2">
      {#for size <- ~w(sm md lg)}
        <Form for={@user_changeset}>
          <Field hint={"Hint for #{size}"} field={:email}>
            <Input {=size} placeholder={"Placeholder for #{size}"} />
          </Field>
        </Form>
      {/for}
      <Form for={@user_changeset}>
        <Field field={:email}>
          <Input size="lg" placeholder="Placeholder" />
          <Field.Hint>
            <Icon name="generic_info" />
            Hint with icon
          </Field.Hint>
        </Field>
      </Form>
    </div>
    """
  end

  def code() do
    """
    alias Moon.Design.Form
    alias Moon.Design.Form.Input
    alias Moon.Design.Form.Field
    alias MoonWeb.Schema.User
    alias Moon.Icon

    prop(user_changeset, :any, default: User.changeset(%User{}))

    def handle_event("changed", %{"user" => params}, socket) do
      {:noreply, assign(socket, user_changeset: User.changeset(%User{}, params))}
    end

    def render(assigns) do
      ~F\"""
      <div class="flex flex-col lg:flex-row justify-around items-end w-full gap-2">
        {#for size <- ~w(sm md lg)}
          <Form for={@user_changeset}>
            <Field hint={"Hint for \#{size}"} field={:email}>
              <Input {=size} placeholder={"Placeholder for \#{size}"} />
            </Field>
          </Form>
        {/for}
        <Form for={@user_changeset}>
          <Field field={:email}>
            <Input size="lg" placeholder="Placeholder" />
            <Field.Hint>
              <Icon name="generic_info" />
              Hint with icon
            </Field.Hint>
          </Field>
        </Form>
      </div>
      \"""
    end
    """
  end
end
