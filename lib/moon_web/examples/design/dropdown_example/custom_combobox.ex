defmodule MoonWeb.Examples.Design.DropdownExample.CustomCombobox do
  @moduledoc false

  use Moon.StatefulComponent
  use MoonWeb, :example

  alias Moon.Design.Dropdown
  alias Moon.Design.Form.Input

  prop(titles, :list,
    default: [
      "Wade Cooper",
      "Arlene Mccoy",
      "Devon Webb",
      "Tom Cook",
      "Tanya Fox",
      "Hellen Schmidt"
    ]
  )

  prop(value, :string, default: "")
  prop(is_open, :boolean)

  defp titles_filtered(%{titles: titles, value: value}) do
    Enum.filter(titles, &String.starts_with?(&1, value))
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
      <Dropdown id="dropdown-combo" {=@is_open}>
        <Dropdown.Options titles={titles_filtered(assigns)} />
        <Dropdown.Trigger :let={value: value}>
          <Input value={value} on_keyup="change_title" on_focus="focus" on_blur="blur" />
        </Dropdown.Trigger>
      </Dropdown>
      <pre>titles = {inspect(titles_filtered(assigns))}</pre>
    </div>
    """
  end

  def code() do
    """
    """
  end
end
