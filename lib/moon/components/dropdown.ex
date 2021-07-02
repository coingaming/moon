defmodule Moon.Components.Dropdown do
  use Moon.StatelessComponent

  alias Moon.Components.Form
  alias Moon.Components.TextInput
  alias Moon.Assets.Icons.IconZoom

  prop(on_search_change, :event)
  prop(search_placeholder, :string)
  prop(search_name, :string)
  prop(search_value, :string)
  prop(class, :string)
  prop(target, :string)
  slot(default)

  def render(assigns) do
    ~F"""
    {asset_import @socket, "js/tailwind"}

    <div class={"bg-gohan-100 shadow rounded-lg p-1 #{@class}"}>
      <div class="relative" :if={@on_search_change}>
        <IconZoom class="absolute top-4 left-4" />
        <Form for={@search_name} change={@on_search_change} {=@target}>
          <TextInput without_design={true} class="outline-none bg-transparent pl-12 p-4 w-full" type="search" placeholder={@search_placeholder} field={:value} value={@search_value} />
        </Form>
      </div>
      <#slot />
    </div>
    """
  end
end

defmodule Moon.Components.Dropdown.Item do
  use Moon.StatelessComponent

  prop(click, :event)
  prop(item_id, :number)
  slot(default)

  def render(assigns) do
    ~F"""
    <div class="p-2 pl-3 pr-3 hover:bg-hover rounded-md" :on-click={@click} phx-value-item_id={@item_id}>
      <#slot />
    </div>
    """
  end
end

defmodule Moon.Components.Dropdown.CheckboxItem do
  use Moon.StatelessComponent
  alias Moon.Components.Checkbox

  prop(click, :event)
  prop(item_id, :number)
  prop(checked, :boolean)
  slot(default)

  def render(assigns) do
    ~F"""
    <div class="p-2 pl-3 pr-3 hover:bg-hover rounded-md relative" :on-click={@click} phx-value-item_id={@item_id}>
      <#slot />
      <Checkbox class="absolute right-0" checked={@checked} />
    </div>
    """
  end
end
