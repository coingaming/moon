defmodule Moon.Components.CheckboxMultiselect.Item do
  use Moon.StatelessComponent
  alias Moon.Components.Checkbox

  prop(on_click, :event)
  prop(item_id, :string)
  prop(checked, :boolean)
  slot(default)

  def render(assigns) do
    ~F"""
    <div class="flex justify-between py-2 pl-4 pr-2 mx-1 hover:bg-hover rounded-sm" :on-click={@on_click} phx-value-toggled_item_id={@item_id}>
      <#slot />
      <Checkbox class="absolute right-0 pointer-events-none" checked={@checked} />
    </div>
    """
  end
end

defmodule Moon.Components.CheckboxMultiselect do
  use Moon.StatelessComponent
  alias Moon.Components.CheckboxMultiselect.Item

  prop(on_change, :event)

  # this is list of Maps of label and value keys, for example: [%{ label: 'Game 1', value: 1 }, %{ label: 'Game 2', value: 2 }]
  prop(options, :list)
  # this is list of numeric ids, for example: [1, 2]
  prop(value, :list)
  prop(class, :string)
  prop(style, :string)
  slot(default)

  def render(assigns) do
    ~F"""
    {asset_import @socket, "js/tailwind"}

    <div class={"bg-gohan-100 shadow rounded-lg p-1 overflow-y-scroll #{@class}"} style={@style || ""}>
      <#slot />
      {#if length(@options) > 0}
      <div :for={option <- @options}>
        <Item item_id={option.value} checked={Enum.member?(@value, option.value)} on_click={@on_change}>
          {option.label}
        </Item>
      </div>
      {#else}
      <div class="h-full flex items-center justify-around">
        <div>No results found</div>
      </div>
      {/if}
    </div>
    """
  end
end
