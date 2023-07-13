defmodule MoonWeb.Examples.Design.DropdownExample.ResponsiveDropdown do
  @moduledoc false

  use Moon.StatelessComponent
  use MoonWeb, :example

  alias Moon.Design.ResponsiveDropdown
  alias Moon.Components.Chip

  def render(assigns) do
    ~F"""
    <ResponsiveDropdown id="dropdown-responsive" as_dropdown_on="md">
      <ResponsiveDropdown.Options titles={["Wade Cooper", "Arlene Mccoy", "Devon Webb", "Tom Cook", "Tanya Fox", "Hellen Schmidt"]} />
      <ResponsiveDropdown.Trigger :let={value: value}>
        <Chip class="w-96">{value || "Dropdown as bottom sheet on small screen"}</Chip>
      </ResponsiveDropdown.Trigger>
      <ResponsiveDropdown.Backdrop />
    </ResponsiveDropdown>
    """
  end

  def code() do
    """
    alias Moon.Design.ResponsiveDropdown
    alias Moon.Components.Chip

    ...

    <ResponsiveDropdown id="dropdown-responsive" as_dropdown_on="md">
      <ResponsiveDropdown.Options titles={["Wade Cooper", "Arlene Mccoy", "Devon Webb", "Tom Cook", "Tanya Fox", "Hellen Schmidt"]} />
      <ResponsiveDropdown.Trigger :let={value: value}>
        <Chip class="w-96">{value || "Dropdown as bottom sheet on small screen"}</Chip>
      </ResponsiveDropdown.Trigger>
      <ResponsiveDropdown.Backdrop />
    </ResponsiveDropdown>
    """
  end
end
