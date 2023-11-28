defmodule MoonWeb.Examples.Design.MenuItemExample.Sizes do
  @moduledoc false

  use Moon.StatelessComponent
  use MoonWeb, :example

  alias Moon.Design.MenuItem
  alias Moon.Icon
  alias Moon.Lego
  alias Moon.Design.Tag

  def render(assigns) do
    ~F"""
    <div class="flex flex-col gap-2 w-56">
      <MenuItem>Default menu item</MenuItem>
      <MenuItem size="lg">LG menu item</MenuItem>
      <MenuItem size="xl">XL menu item</MenuItem>
    </div>

    <div class="flex flex-col gap-2 w-56">
      <MenuItem>
        <Icon name="other_frame" class="text-[1.5rem]" />
        <Lego.Title>Default menu item</Lego.Title>
      </MenuItem>
      <MenuItem size="lg">
        <Icon name="other_frame" class="text-[1.5rem]" />
        <Lego.Title>
          LG menu item</Lego.Title>
      </MenuItem>
      <MenuItem size="xl">
        <Icon name="other_frame" class="text-[1.5rem]" />
        <Lego.Title>XL menu item</Lego.Title>
      </MenuItem>
    </div>

    <div class="flex flex-col gap-2 w-56">
      <MenuItem>
        <Icon name="other_frame" class="text-[1.5rem]" />
        <Lego.Title>Default menu item</Lego.Title>
        <Tag class="bg-goku text-bulma">99</Tag>
      </MenuItem>
      <MenuItem size="lg">
        <Icon name="other_frame" class="text-[1.5rem]" />
        <Lego.Title>
          LG menu item</Lego.Title>
        <Tag class="bg-goku text-bulma">99</Tag>
      </MenuItem>
      <MenuItem size="xl">
        <Icon name="other_frame" class="text-[1.5rem]" />
        <Lego.Title>XL menu item</Lego.Title>
        <Tag class="bg-goku text-bulma">99</Tag>
      </MenuItem>
    </div>
    """
  end

  def code() do
    """
    alias Moon.Design.MenuItem
    alias Moon.Icon
    alias Moon.Lego
    alias Moon.Design.Tag

    ...

    <div class="flex flex-col gap-2 w-56">
      <MenuItem>Default menu item</MenuItem>
      <MenuItem size="lg">LG menu item</MenuItem>
      <MenuItem size="xl">XL menu item</MenuItem>
    </div>

    <div class="flex flex-col gap-2 w-56">
      <MenuItem>
        <Icon name="other_frame" class="text-[1.5rem]" />
        <Lego.Title>Default menu item</Lego.Title>
      </MenuItem>
      <MenuItem size="lg">
        <Icon name="other_frame" class="text-[1.5rem]" />
        <Lego.Title>
          LG menu item</Lego.Title>
      </MenuItem>
      <MenuItem size="xl">
        <Icon name="other_frame" class="text-[1.5rem]" />
        <Lego.Title>XL menu item</Lego.Title>
      </MenuItem>
    </div>

    <div class="flex flex-col gap-2 w-56">
      <MenuItem>
        <Icon name="other_frame" class="text-[1.5rem]" />
        <Lego.Title>Default menu item</Lego.Title>
        <Tag class="bg-goku text-bulma">99</Tag>
      </MenuItem>
      <MenuItem size="lg">
        <Icon name="other_frame" class="text-[1.5rem]" />
        <Lego.Title>
          LG menu item</Lego.Title>
        <Tag class="bg-goku text-bulma">99</Tag>
      </MenuItem>
      <MenuItem size="xl">
        <Icon name="other_frame" class="text-[1.5rem]" />
        <Lego.Title>XL menu item</Lego.Title>
        <Tag class="bg-goku text-bulma">99</Tag>
      </MenuItem>
    </div>
    """
  end
end
