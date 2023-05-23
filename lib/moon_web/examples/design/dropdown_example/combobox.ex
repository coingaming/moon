defmodule MoonWeb.Examples.Design.DropdownExample.Combobox do
  @moduledoc false

  use Moon.StatefulComponent
  use MoonWeb, :example

  alias Moon.Design.Form

  alias MoonWeb.Schema.User

  prop(titles, :list,
    default: [
      "Wade Cooper",
      "Arlene Mccoy",
      "Devon Webb",
      "Tom Cook",
      "Tanya Fox",
      "Hellen Schmidt"
    ] |> Enum.map(&(%{key: &1, value: &1}))
  )

  prop(changeset1, :any, default: User.changeset(%User{name: nil}))

  prop(value, :string, default: "")
  prop(is_open, :boolean)

  defp titles_filtered(%{titles: titles, value: value}) do
    Enum.filter(titles, &String.starts_with?(&1[:value], value))
  end

  def handle_event("change_title", params = %{"value" => value}, socket) do
    dbg(params)
    {:noreply, assign(socket, value: value)}
  end

  def handle_event("focus", _, socket) do
    {:noreply, assign(socket, is_open: true)}
  end

  def handle_event("blur", _, socket) do
    {:noreply, assign(socket, is_open: false)}
  end

  def render(assigns) do
    ~F"""
    <div class="w-full">
      <div class="w-full flex flex-col lg:flex-row gap-2 justify-between">
        <Form
          id={"user_#{size}"}
          :for={size <- ~w(md)}
          class="w-full"
          for={@changeset1}
        >
          <Form.Field field={:name} label={"Size #{size}"} hint="Some hint here">
            <Form.Combobox {=size} options={titles_filtered(assigns)} on_keyup="change_title" />
          </Form.Field>
        </Form>
      </div>
      <pre>titles = {inspect(titles_filtered(assigns))}</pre>
    </div>
    """
  end

  def code() do
    """
    """
  end
end
