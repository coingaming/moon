defmodule MoonWeb.Examples.Design.DropdownExample.ResponsiveDropdown do
  @moduledoc false

  use Moon.StatefulComponent
  use MoonWeb, :example

  alias Moon.Design.Dropdown
  alias Moon.Components.Chip

  def render(assigns) do
    ~F"""
    <div>
      <Dropdown id="responsive-dropdown" as_dropdown_on="md" on_close="set_close">
        <Dropdown.BottomOptions titles={["Wade Cooper", "Arlene Mccoy", "Devon Webb", "Tom Cook", "Tanya Fox", "Hellen Schmidt"]} />
        <Dropdown.Trigger :let={value: value}>
          <Chip class="w-64">{value || "BottomSheet on small screen"}
          </Chip>
        </Dropdown.Trigger>
        <Dropdown.Backdrop />
      </Dropdown>
    </div>
    """
  end

  def handle_event("set_close", _, socket) do
    Dropdown.close("responsive-dropdown")
    {:noreply, socket}
  end

  def code() do
    """
    alias Moon.Design.Dropdown
    alias Moon.Components.Chip

    def render(assigns) do
      ~F\"""
      <div>
        <Dropdown id="responsive-dropdown" as_dropdown_on="md" on_close="set_close">
          <Dropdown.BottomOptions titles={["Wade Cooper", "Arlene Mccoy", "Devon Webb", "Tom Cook", "Tanya Fox", "Hellen Schmidt"]} />
          <Dropdown.Trigger :let={value: value}>
            <Chip class="w-64">{value || "BottomSheet on small screen"}
            </Chip>
          </Dropdown.Trigger>
          <Dropdown.Backdrop />
        </Dropdown>
      </div>
      \"""
    end

    def handle_event("set_close", _, socket) do
      Dropdown.close("responsive-dropdown")
      {:noreply, socket}
    end
    """
  end
end
