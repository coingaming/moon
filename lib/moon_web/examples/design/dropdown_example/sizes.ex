defmodule MoonWeb.Examples.Design.DropdownExample.Sizes do
  @moduledoc false

  use Moon.StatelessComponent
  use MoonWeb, :example

  alias Moon.Design.Dropdown
  alias Moon.Components.Chip

  def render(assigns) do
    ~F"""
    {#for size <- ~w(sm md lg)}
      <Dropdown id={"drop-sizes-#{size}"}>
        <Dropdown.Options
          {=size}
          class="w-auto"
          titles={["Wade Cooper", "Arlene Mccoy", "Devon Webb", "Tom Cook", "Tanya Fox", "Hellen Schmidt"]}
        />
        <Dropdown.Trigger>
          <Chip>{size}</Chip>
        </Dropdown.Trigger>
      </Dropdown>
    {/for}
    """
  end

  def code() do
    """
    {#for size <- ~w(sm md lg)}
      <Dropdown id={"drop-sizes-\#{size}"}>
        <Dropdown.Options
          {=size}
          class="w-auto"
          titles={["Wade Cooper", "Arlene Mccoy", "Devon Webb", "Tom Cook", "Tanya Fox", "Hellen Schmidt"]}
        />
        <Dropdown.Trigger>
          <Chip>{size}</Chip>
        </Dropdown.Trigger>
      </Dropdown>
    {/for}
    """
  end
end
