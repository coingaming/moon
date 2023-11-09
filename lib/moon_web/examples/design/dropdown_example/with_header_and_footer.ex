defmodule MoonWeb.Examples.Design.DropdownExample.WithHeaderAndFooter do
  @moduledoc false

  use Moon.StatelessComponent
  use MoonWeb, :example

  alias Moon.Design.Dropdown
  alias Moon.Design.Chip
  alias Moon.Icon

  def render(assigns) do
    ~F"""
    <Dropdown id="dropdown-custom">
      <Dropdown.Trigger>
        <Chip>Sort by</Chip>
      </Dropdown.Trigger>
      <Dropdown.Options class="w-[26.75rem]" position="bottom">
        <Dropdown.Header>Filters</Dropdown.Header>
        <Dropdown.CustomOption>
          <Icon name="mail_box" class="text-moon-24" />Option 1
        </Dropdown.CustomOption>
        <Dropdown.CustomOption>
          <Icon name="mail_box" class="text-moon-24" />Option 2
        </Dropdown.CustomOption>
        <Dropdown.CustomOption>
          <Icon name="mail_box" class="text-moon-24" />Option 3
        </Dropdown.CustomOption>
        <Dropdown.CustomOption has_bottom_divider>
          <Icon name="mail_box" class="text-moon-24" />Option 4
        </Dropdown.CustomOption>
        <Dropdown.CustomOption>
          <Icon name="mail_box" class="text-moon-24" />Option 5
        </Dropdown.CustomOption>
        <Dropdown.CustomOption>
          <Icon name="mail_box" class="text-moon-24" />Option 6
        </Dropdown.CustomOption>
        <Dropdown.Footer />
      </Dropdown.Options>
    </Dropdown>
    """
  end

  def code() do
    """
    alias Moon.Design.Dropdown
    alias Moon.Design.Chip
    alias Moon.Icon

    ...

    <Dropdown id="dropdown-custom">
      <Dropdown.Trigger>
        <Chip>Sort by</Chip>
      </Dropdown.Trigger>
      <Dropdown.Options class="w-[26.75rem]" position="bottom">
        <Dropdown.Header>Filters</Dropdown.Header>
        <Dropdown.CustomOption>
          <Icon name="mail_box" class="text-moon-24" />Option 1
        </Dropdown.CustomOption>
        <Dropdown.CustomOption>
          <Icon name="mail_box" class="text-moon-24" />Option 2
        </Dropdown.CustomOption>
        <Dropdown.CustomOption>
          <Icon name="mail_box" class="text-moon-24" />Option 3
        </Dropdown.CustomOption>
        <Dropdown.CustomOption has_bottom_divider>
          <Icon name="mail_box" class="text-moon-24" />Option 4
        </Dropdown.CustomOption>
        <Dropdown.CustomOption>
          <Icon name="mail_box" class="text-moon-24" />Option 5
        </Dropdown.CustomOption>
        <Dropdown.CustomOption>
          <Icon name="mail_box" class="text-moon-24" />Option 6
        </Dropdown.CustomOption>
        <Dropdown.Footer />
      </Dropdown.Options>
    </Dropdown>
    """
  end
end
