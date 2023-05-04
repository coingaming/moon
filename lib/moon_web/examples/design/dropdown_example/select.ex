defmodule MoonWeb.Examples.Design.DropdownExample.Select do
  @moduledoc false

  use Moon.StatefulComponent

  use MoonWeb, :example

  alias MoonWeb.Pages.Tutorials.AddDataUsingForm.User
  alias Moon.Design.Form

  prop(gender_options, :list,
    default: [
      [key: "Female", value: "female"],
      [key: "Male", value: "male"],
      [key: "Invalid choice", value: "invalid"],
      [key: "I identify as God and this is not important", value: "god", disabled: true]
    ]
  )

  prop(changeset1, :any, default: User.changeset(%User{gender: nil}))

  def handle_event("change" <> num, params, socket) do
    changeset = User.changeset(%User{}, Map.get(params, "user", %{}))
    {:noreply, assign(socket, "changeset#{num}": changeset)}
  end

  def render(assigns) do
    ~F"""
    <div class="w-full flex flex-col lg:flex-row gap-2 justify-between">
      <Form
        id={"user_#{size}"}
        :for={size <- ~w(sm md lg)}
        class="w-full"
        for={@changeset1}
        change="change1"
      >
        <Form.Field field={:gender} label={"Size #{size}"} hint="Some hint here">
          <Form.Dropdown {=size} options={_ <- @gender_options} prompt="Please select gender" />
        </Form.Field>
      </Form>
    </div>
    """
  end

  def code() do
    """
    alias MoonWeb.Pages.Tutorials.AddDataUsingForm.User
    alias Moon.Design.Form

    prop(gender_options, :list,
      default: [
        [key: "Female", value: "female"],
        [key: "Male", value: "male"],
        [key: "Invalid choice", value: "invalid"],
        [key: "I identify as God and this is not important", value: "god", disabled: true]
      ]
    )

    prop(changeset1, :any, default: User.changeset(%User{gender: nil}))

    def handle_event("change" <> num, params, socket) do
      changeset = User.changeset(%User{}, Map.get(params, "user", %{}))
      {:noreply, assign(socket, "changeset\#{num}": changeset)}
    end

    def render(assigns) do
      ~F\"""
      <div class="w-full flex flex-col lg:flex-row gap-2 justify-between">
        <Form
          id={"user_\#{size}"}
          :for={size <- ~w(sm md lg)}
          class="w-full"
          for={@changeset1}
          change="change1"
        >
          <Form.Field field={:gender} label={"Size \#{size}"} hint="Some hint here">
            <Form.Dropdown {=size} options={_ <- @gender_options} prompt="Please select gender" />
          </Form.Field>
        </Form>
      </div>
      \"""
    end
    """
  end
end
