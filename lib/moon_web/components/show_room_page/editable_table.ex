defmodule MoonWeb.Components.ShowRoomPage.EditableTable do
  @moduledoc false

  use MoonWeb, :stateful_component

  alias Moon.Components.Dropdown
  alias Moon.Design.Table

  alias Moon.Design.Table.Column
  alias Moon.Parts.Status

  alias Moon.Design.Dropdown
  alias Moon.Icon

  alias Moon.Parts.Button

  prop(editable_menu_items, :list, default: [])
  prop(change_name, :event)
  prop(name, :string)
  prop(add_row, :event)
  prop(value, :string, default: "Choose icon...")

  def render(assigns) do
    ~F"""
    <Table
      items={editable_menu_item <- @editable_menu_items}
      {=@id}
      class="bg-goku !border-collapse"
      header_row_class="text-left first:rounded-l-moon-s-none last:rounded-r-moon-s-none border-y-[0.5px] border-beerus"
      row_size="xl"
      selected_bg="bg-heles"
    >
      <Column
        name="id"
        label="Icon"
        class="text-moon-18 text-bulma py-4 px-4 first:rounded-l-moon-s-none last:rounded-r-moon-s-none border-y-[0.5px] border-beerus font-dm-sans"
        width="text-moon-16 text-trunks py-4 px-4 font-normal h-16"
      >
        <Dropdown
          id={"menu-icons-#{editable_menu_item.icon}"}
          side_values={num: editable_menu_item.id, field: :icon}
          on_change={@change_name}
        >
          <Dropdown.Trigger :let={value: value}>
            {value || "Choose icon..."}
          </Dropdown.Trigger>
          <Dropdown.Options class="w-[26.75rem]" position="bottom">
            <Dropdown.Header>Filters</Dropdown.Header>
            {#for editable_menu_item <- @editable_menu_items}
              <Dropdown.CustomOption>
                <Icon name={editable_menu_item.icon} class="text-moon-24" />{editable_menu_item.icon}
              </Dropdown.CustomOption>
            {/for}
          </Dropdown.Options>
        </Dropdown>
      </Column>
      <Column
        name="name"
        label="Name"
        class="text-moon-18 text-bulma py-4 px-4 first:rounded-l-moon-s-none last:rounded-r-moon-s-none border-y-[0.5px] border-beerus font-dm-sans"
        width="text-moon-16 text-trunks py-4 px-4 font-normal h-16"
      >
        <Table.Input
          value={editable_menu_item.name}
          side_values={num: editable_menu_item.id, field: :name}
          on_keyup={@change_name}
        />
      </Column>
      <Column
        name="created_at"
        label="Link"
        class="text-moon-18 text-bulma py-4 px-4 first:rounded-l-moon-s-none last:rounded-r-moon-s-none border-y-[0.5px] border-beerus font-dm-sans"
        width="text-moon-16 text-trunks py-4 px-4 font-normal h-16"
      >
        <Table.Input
          value={editable_menu_item.link}
          side_values={num: editable_menu_item.id, field: :link}
          on_keyup={@change_name}
        />
      </Column>
      <Column
        name="created_at"
        label="Status"
        class="text-moon-18 text-bulma py-4 px-4 first:rounded-l-moon-s-none last:rounded-r-moon-s-none border-y-[0.5px] border-beerus font-dm-sans"
        width="text-moon-16 text-trunks py-4 px-4 font-normal h-16"
      >
        <Status active />
      </Column>
    </Table>
    <Button.White class="w-fit ms-2 mt-2" on_click={@add_row}>+ Add menu item</Button.White>
    """
  end
end
