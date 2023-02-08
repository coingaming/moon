defmodule MoonWeb.Examples.Design.DropdownExample.Sizes do
  @moduledoc false

  use Moon.StatelessComponent
  use MoonWeb, :example

  alias Moon.Design.Dropdown
  alias Moon.Components.Chip

  def render(assigns) do
    ~F"""
    {#for size <- ~w(sm md lg)}
      <Dropdown
        id={"drop-sizes-#{size}"}
        {=size}
        class="w-auto"
        option_titles={["Wade Cooper", "Arlene Mccoy", "Devon Webb", "Tom Cook", "Tanya Fox", "Hellen Schmidt"]}
      >
        <Dropdown.Trigger>
          <Chip>{size}</Chip>
        </Dropdown.Trigger>
      </Dropdown>
    {/for}
    """
  end

  def code() do
    """
    alias Moon.Design.Dropdown
    alias Moon.Components.Chip

    ...

    {#for size <- ~w(sm md lg)}
      <Dropdown
        id={"drop-sizes-\#{size}"}
        {=size}
        class="w-auto"
        option_titles={["Wade Cooper", "Arlene Mccoy", "Devon Webb", "Tom Cook", "Tanya Fox", "Hellen Schmidt"]}
      >
        <Dropdown.Trigger>
          <Chip>{size}</Chip>
        </Dropdown.Trigger>
      </Dropdown>
    {/for}

    """
  end
end
