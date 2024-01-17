defmodule MoonWeb.Components.ShowRoomPage.EditableTable do
  @moduledoc false

  use MoonWeb, :stateful_component

  alias Moon.Parts.Table
  alias Moon.Design.Dropdown
  alias Moon.Parts.Status
  alias Moon.Parts.Button

  alias MoonIcons.Helpers.Icons

  prop(editable_menu_items, :list, default: [])
  prop(change_name, :event)
  prop(name, :string)
  prop(add_row, :event)
  prop(value, :any)
  prop(active, :boolean, default: false)

  def render(assigns) do
    ~F"""
    <div class="m-2 bg-goku rounded-moon-s-lg">
      <Table items={editable_menu_item <- @editable_menu_items} {=@id}>
        <Table.Column name="id" label="Icon">
          <Dropdown
            id={"menu-icons-#{editable_menu_item.id}"}
            side_values={num: editable_menu_item.id, field: :icon}
            on_change={@change_name}
            value={editable_menu_item.icon}
          >
            <Dropdown.Trigger>
              {editable_menu_item.icon}
            </Dropdown.Trigger>
            <Dropdown.Options
              class="w-fit h-96 overflow-auto"
              position="bottom-start"
              option_module={Moon.Design.Dropdown.IconOption}
              titles={generate_dropdown_options()}
            />
          </Dropdown>
        </Table.Column>
        <Table.Column name="name" label="Name">
          <Table.Input
            value={editable_menu_item.name}
            side_values={num: editable_menu_item.id, field: :name}
            on_keyup={@change_name}
          />
        </Table.Column>
        <Table.Column name="created_at" label="Link">
          <Table.Input
            value={editable_menu_item.link}
            side_values={num: editable_menu_item.id, field: :link}
            on_keyup={@change_name}
          />
        </Table.Column>
        <Table.Column name="created_at" label="Status">
          <Status
            side_values={num: editable_menu_item.id, field: :status}
            active={editable_menu_item.active}
          />
        </Table.Column>
      </Table>
      <Button.White class="w-fit ms-4 my-4" on_click={@add_row}>+ Add menu item</Button.White>
    </div>
    """
  end

  def generate_dropdown_options() do
    icon_names = Icons.list_other()

    Enum.map(icon_names, fn icon_name ->
      %{icon: icon_name, name: icon_name}
    end)
  end
end
