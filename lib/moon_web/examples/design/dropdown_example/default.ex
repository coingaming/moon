defmodule MoonWeb.Examples.Design.DropdownExample.Default do
  @moduledoc false

  use Moon.StatelessComponent
  use MoonWeb, :example

  alias Moon.Design.Dropdown
  alias Moon.Components.Chip

  def render(assigns) do
    ~F"""
    <Dropdown id="dropdown-02">
      <Dropdown.Options titles={["Wade Cooper", "Arlene Mccoy", "Devon Webb", "Tom Cook", "Tanya Fox", "Hellen Schmidt"]} />
      <Dropdown.Trigger :let={value: value}>
        <Chip class="w-96">{value || "Choose name..."}</Chip>
      </Dropdown.Trigger>
    </Dropdown>
    """
  end

  def code() do
    """
    <Dropdown id="dropdown-02">
      <Dropdown.Options titles={["Wade Cooper", "Arlene Mccoy", "Devon Webb", "Tom Cook", "Tanya Fox", "Hellen Schmidt"]}/>
      <Dropdown.Trigger :let={value: value}>
        <Chip class="w-96">{value || "Choose name..."}</Chip>
      </Dropdown.Trigger>
    </Dropdown>
    """
  end
end
