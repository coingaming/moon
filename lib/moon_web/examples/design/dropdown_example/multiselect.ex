defmodule MoonWeb.Examples.Design.DropdownExample.Multiselect do
  @moduledoc false

  use Moon.StatefulComponent

  use MoonWeb, :example

  alias MoonWeb.Schema.User
  alias Moon.Design.Form

  prop(permissions, :list, default: User.available_permissions())

  prop(changeset_sm, :any, default: User.changeset(%User{gender: nil}))
  prop(target_sm, :list)

  prop(changeset_md, :any, default: User.changeset(%User{gender: nil}))
  prop(target_md, :list)

  prop(changeset_lg, :any, default: User.changeset(%User{gender: nil}))
  prop(target_lg, :list)

  def handle_event("change_" <> num, params, socket) do
    changeset = User.changeset(%User{}, Map.get(params, "user", %{}))

    {:noreply,
     socket
     |> assign(
       target_sm: [],
       target_md: [],
       target_lg: []
     )
     |> assign(
       "changeset_#{num}": changeset,
       "target_#{num}": Map.get(params, "_target", [])
     )}
  end

  def render(assigns) do
    ~F"""
    <div class="w-full flex flex-col lg:flex-row gap-2 justify-between">
      <Form
        :for={size <- ~w(sm md lg)}
        id={"user_multi_#{size}"}
        class="w-full"
        for={assigns[:"changeset_#{size}"]}
        change={"change_#{size}"}
      >
        <Form.Field field={:permissions} label={"Size #{size}"} hint="Some hint here">
          <Form.Dropdown
            {=size}
            is_multiple
            options={@permissions}
            prompt="Select permissions"
            is_open={assigns[:"target_#{size}"] === ["user", "permissions"]}
          />
        </Form.Field>
      </Form>
    </div>
    """
  end

  def code() do
    """
    alias MoonWeb.Schema.User
    alias Moon.Design.Form

    prop(permissions, :list, default: User.available_permissions())

    prop(changeset_sm, :any, default: User.changeset(%User{gender: nil}))
    prop(target_sm, :list)

    prop(changeset_md, :any, default: User.changeset(%User{gender: nil}))
    prop(target_md, :list)

    prop(changeset_lg, :any, default: User.changeset(%User{gender: nil}))
    prop(target_lg, :list)

    def handle_event("change_" <> num, params, socket) do
      changeset = User.changeset(%User{}, Map.get(params, "user", %{}))

      {:noreply,
      socket
      |> assign(
        target_sm: [],
        target_md: [],
        target_lg: []
      )
      |> assign(
        "changeset_\#{num}": changeset,
        "target_\#{num}": Map.get(params, "_target", [])
      )}
    end

    def render(assigns) do
      ~F\"""
      <div class="w-full flex flex-col lg:flex-row gap-2 justify-between">
        <Form
          :for={size <- ~w(sm md lg)}
          id={"user_multi_\#{size}"}
          class="w-full"
          for={assigns[:"changeset_\#{size}"]}
          change={"change_\#{size}"}
        >
          <Form.Field field={:permissions} label={"Size \#{size}"} hint="Some hint here">
            <Form.Dropdown
              {=size}
              is_multiple
              options={_ <- @permissions}
              prompt="Select permissions"
              is_open={assigns[:"target_\#{size}"] === ["user", "permissions"]}
            />
          </Form.Field>
        </Form>
      </div>
      \"""
    end
    """
  end
end
