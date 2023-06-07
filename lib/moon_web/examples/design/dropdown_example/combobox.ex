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

  prop(changeset, :any, default: User.changeset(%User{name: nil}))

  prop(value, :string, default: "")
  prop(target, :list)

  defp titles_filtered(%{titles: titles, value: value}) do
    Enum.filter(titles, &String.starts_with?(&1[:value], value))
  end

  def handle_event("change_title", _params = %{"value" => value}, socket) do
    {:noreply, assign(socket, value: value)}
  end

  def handle_event("changed", params, socket) do
    dbg(params)
    user = Map.get(params, "user", %{})
    {:noreply, assign(socket,
      changeset: User.changeset(%User{}, user),
      value: Map.get(user, "name", ""),
      target: params["_target"]
    )}
  end

  def render(assigns) do
    ~F"""
    <div class="w-full">
      <div class="w-full flex flex-col lg:flex-row gap-2 justify-between">
        <Form
          id={"user_combo_#{size}"}
          :for={size <- ~w(md)}
          class="w-full"
          for={@changeset}
          change="changed"
        >
          <Form.Field field={:name} label={"Size #{size}"} hint="Some hint here">
            <Form.Combobox {=size} options={titles_filtered(assigns)} is_open={@target == ["user", "name"]} />
          </Form.Field>
        </Form>
      </div>
      <pre>titles = {inspect(titles_filtered(assigns))}</pre>
      <pre>changeset = {inspect(@changeset, pretty: true)}</pre>
    </div>
    """
  end

  def code() do
    """
    """
  end
end
