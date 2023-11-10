defmodule MoonWeb.Examples.Design.Form.InsetInputExample.States do
  @moduledoc false

  use Moon.StatelessComponent

  use MoonWeb, :example

  alias Moon.Design.Form
  alias Moon.Design.Form.Input
  alias Moon.Design.Form.InsetField
  alias Moon.Icon

  alias MoonWeb.Schema.User

  prop(user_changeset, :any, default: User.changeset(%User{}))

  def handle_event("changed", %{"user" => params}, socket) do
    {:noreply, assign(socket, user_changeset: User.changeset(%User{}, params))}
  end

  def render(assigns) do
    ~F"""
    <div class="flex flex-col lg:flex-row justify-around w-full gap-2">
      <Form for={@user_changeset} class="w-full">
        <InsetField disabled label="Label" hint="Informative message holder">
          <Input placeholder="Disabled input" />
        </InsetField>
      </Form>
      <Form for={@user_changeset} class="w-full">
        <InsetField readonly label="Label">
          <Input value="Read-only input" />
        </InsetField>
        <InsetField.Hint>
          <Icon name="generic_info" />
          Informative message holder with icon
        </InsetField.Hint>
      </Form>
      <Form for={@user_changeset} class="w-full">
        <InsetField label="Label">
          <Input error placeholder="Invalid input" />
        </InsetField>
        <InsetField.Hint class="text-chichi">Error message</InsetField.Hint>
      </Form>
    </div>
    """
  end

  def code() do
    """
    alias Moon.Design.Form
    alias Moon.Design.Form.Input
    alias Moon.Design.Form.InsetField
    alias Moon.Icon

    alias MoonWeb.Schema.User

    prop(user_changeset, :any, default: User.changeset(%User{}))

    def handle_event("changed", %{"user" => params}, socket) do
      {:noreply, assign(socket, user_changeset: User.changeset(%User{}, params))}
    end

    def render(assigns) do
      ~F\"""
      <div class="flex flex-col lg:flex-row justify-around w-full gap-2">
        <Form for={@user_changeset} class="w-full">
          <InsetField disabled label="Label" hint="Informative message holder">
            <Input placeholder="Disabled input" />
          </InsetField>
        </Form>
        <Form for={@user_changeset} class="w-full">
          <InsetField readonly label="Label">
            <Input value="Read-only input" />
          </InsetField>
          <InsetField.Hint>
            <Icon name="generic_info" />
            Informative message holder with icon
          </InsetField.Hint>
        </Form>
        <Form for={@user_changeset} class="w-full">
          <InsetField label="Label">
            <Input error placeholder="Invalid input" />
          </InsetField>
          <InsetField.Hint class="text-chichi">Error message</InsetField.Hint>
        </Form>
      </div>
      \"""
    end
    """
  end
end
