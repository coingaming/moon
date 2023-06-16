defmodule MoonWeb.Examples.Design.Form.InsetInputExample.Types do
  @moduledoc false

  use Moon.StatelessComponent

  use MoonWeb, :example

  alias Moon.Design.Form
  alias Moon.Design.Form.Input
  alias Moon.Design.Form.InsetField
  alias MoonWeb.Schema.User

  prop(types, :string,
    default: [
      ["date", "datetime-local", "email"],
      ["number", "password", "search"],
      ["tel", "time", "url"]
    ]
  )

  prop(user_changeset, :any, default: User.changeset(%User{}))

  def handle_event("changed", %{"user" => params}, socket) do
    {:noreply, assign(socket, user_changeset: User.changeset(%User{}, params))}
  end

  def render(assigns) do
    ~F"""
    <div class="flex flex-col w-full gap-2">
      {#for type_line <- @types}
        <div class="flex flex-col lg:flex-row justify-around w-full gap-2">
          {#for type <- type_line}
            <Form for={@user_changeset} class="w-full">
              <InsetField label={"Label for #{type}"}>
                <Input {=type} placeholder={"Placeholder for #{type}"} />
              </InsetField>
            </Form>
          {/for}
        </div>
      {/for}
    </div>
    """
  end

  def code() do
    """
    alias Moon.Design.Form
    alias Moon.Design.Form.Input
    alias Moon.Design.Form.InsetField
    alias MoonWeb.Schema.User

    prop(types, :string,
      default: [
        ["date", "datetime-local", "email"],
        ["number", "password", "search"],
        ["tel", "time", "url"]
      ]
    )

    prop(user_changeset, :any, default: User.changeset(%User{}))

    def handle_event("changed", %{"user" => params}, socket) do
      {:noreply, assign(socket, user_changeset: User.changeset(%User{}, params))}
    end

    def render(assigns) do
      ~F/\"""
      <div class="flex flex-col w-full gap-2">
        {#for type_line <- @types}
          <div class="flex flex-col lg:flex-row justify-around w-full gap-2">
            {#for type <- type_line}
              <Form for={@user_changeset} class="w-full">
                <InsetField label={"Label for #\{type}"}>
                  <Input {=type} placeholder={"Placeholder for #\{type}"} />
                </InsetField>
              </Form>
            {/for}
          </div>
        {/for}
      </div>
      /\"""
    end
    """
  end
end
