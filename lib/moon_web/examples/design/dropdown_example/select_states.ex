defmodule MoonWeb.Examples.Design.DropdownExample.SelectStates do
  @moduledoc false

  use Moon.StatefulComponent

  use MoonWeb, :example

  alias MoonWeb.Schema.User
  alias Moon.Design.Form

  prop(gender_options, :list, default: User.gender_options())

  prop(changeset1, :any, default: User.changeset(%User{gender: nil}))
  prop(changeset2, :any, default: User.changeset(%User{}))
  prop(changeset3, :any, default: User.changeset(%User{gender: nil}))

  def handle_event("change" <> num, params, socket) do
    changeset = User.changeset(%User{}, Map.get(params, "user", %{}))
    {:noreply, assign(socket, "changeset#{num}": changeset)}
  end

  def render(assigns) do
    ~F"""
    <div class="w-full flex flex-col lg:flex-row gap-2 justify-between">
      <Form id="user_error" class="w-full" for={@changeset1} change="change1">
        <Form.Field field={:gender} label="Error" hint="Some hint here">
          <Form.Dropdown error options={@gender_options} prompt="Please select gender" />
        </Form.Field>
      </Form>
      <Form id="user_disabled" class="w-full" for={@changeset2} change="change2">
        <Form.Field field={:gender} label="Disabled" hint="Some hint here">
          <Form.Dropdown disabled options={@gender_options} prompt="Please select gender" />
        </Form.Field>
      </Form>
      <Form id="user_normal" class="w-full" for={@changeset3} change="change3">
        <Form.Field field={:gender} label="Normal" hint="Some hint here">
          <Form.Dropdown options={@gender_options} prompt="Please select gender" />
        </Form.Field>
      </Form>
    </div>
    """
  end

  def code() do
    """
    alias MoonWeb.Schema.User
    alias Moon.Design.Form

    prop(gender_options, :list, default: User.gender_options())

    prop(changeset1, :any, default: User.changeset(%User{gender: nil}))
    prop(changeset2, :any, default: User.changeset(%User{}))
    prop(changeset3, :any, default: User.changeset(%User{gender: nil}))

    def handle_event("change" <> num, params, socket) do
      changeset = User.changeset(%User{}, Map.get(params, "user", %{}))
      {:noreply, assign(socket, "changeset\#{num}": changeset)}
    end

    def render(assigns) do
      ~F\"""
      <div class="w-full flex flex-col lg:flex-row gap-2 justify-between">
        <Form id="user_error" class="w-full" for={@changeset1} change="change1">
          <Form.Field field={:gender} label="Error" hint="Some hint here">
            <Form.Dropdown error options={@gender_options} prompt="Please select gender" />
          </Form.Field>
        </Form>
        <Form id="user_disabled" class="w-full" for={@changeset2} change="change2">
          <Form.Field field={:gender} label="Disabled" hint="Some hint here">
            <Form.Dropdown disabled options={@gender_options} prompt="Please select gender" />
          </Form.Field>
        </Form>
        <Form id="user_normal" class="w-full" for={@changeset3} change="change3">
          <Form.Field field={:gender} label="Normal" hint="Some hint here">
            <Form.Dropdown options={@gender_options} prompt="Please select gender" />
          </Form.Field>
        </Form>
      </div>
      \"""
    end
    """
  end
end
