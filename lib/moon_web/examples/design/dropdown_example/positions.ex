defmodule MoonWeb.Examples.Design.DropdownExample.Positions do
  @moduledoc false

  use Moon.StatelessComponent
  use MoonWeb, :example

  alias Moon.Design.Dropdown
  alias Moon.Components.Chip

  import Moon.Helpers.Positions

  def render(assigns) do
    ~F"""
    {#for position <- position_list()}
      <Dropdown
        id={"drop-positions-#{position}"}
        {=position}
        option_titles={["Wade Cooper", "Arlene Mccoy", "Devon Webb", "Tom Cook", "Tanya Fox", "Hellen Schmidt"]}
      >
        <Dropdown.Trigger>
          <Chip>{position}</Chip>
        </Dropdown.Trigger>
      </Dropdown>
    {/for}
    """
  end

  def code() do
    """
    alias Moon.Design.Dropdown
    alias Moon.Components.Chip

    import Moon.Helpers.Positions

    prop(positions, :list, default: [
      "top-start",
      "top",
      "top-end",
      "bottom-start",
      "bottom",
      "bottom-end",
      "right-start",
      "right",
      "right-end",
      "left-start",
      "left",
      "left-end"
    ])
    ...

    {#for position <- @positions}
      <Dropdown
        id={"drop-positions-\#{position}"}
        {=position}
        option_titles={["Wade Cooper", "Arlene Mccoy", "Devon Webb", "Tom Cook", "Tanya Fox", "Hellen Schmidt"]}
      >
        <Dropdown.Trigger>
          <Chip>{position}</Chip>
        </Dropdown.Trigger>
      </Dropdown>
    {/for}
    """
  end
end
