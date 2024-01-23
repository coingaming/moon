defmodule MoonWeb.Examples.Design.DropdownExample.LimitHeight do
  @moduledoc false

  use Moon.StatelessComponent
  use MoonWeb, :example

  alias Moon.Design.Dropdown
  alias Moon.Components.Chip

  def render(assigns) do
    ~F"""
    <Dropdown id="dropdown-limit-height">
      <Dropdown.Options
        max_visible_options={3}
        titles={["Wade Cooper", "Arlene Mccoy", "Devon Webb", "Tom Cook", "Tanya Fox", "Hellen Schmidt"]}
      />
      <Dropdown.Trigger :let={value: value}>
        <Chip class="w-64">{value || "Choose name..."}</Chip>
      </Dropdown.Trigger>
    </Dropdown>
    """
  end

  def code() do
    """
      <Dropdown id="dropdown-limit-height">
        <Dropdown.Options
          max_visible_options={3}
          titles={["Wade Cooper", "Arlene Mccoy", "Devon Webb", "Tom Cook", "Tanya Fox", "Hellen Schmidt"]}
        />
        <Dropdown.Trigger :let={value: value}>
          <Chip class="w-64">{value || "Choose name..."}</Chip>
        </Dropdown.Trigger>
      </Dropdown>
    """
  end
end
