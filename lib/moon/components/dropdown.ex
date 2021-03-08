defmodule Moon.Components.Dropdown do
  use Moon.StatelessComponent

  prop(class, :string)
  slot(default)

  def render(assigns) do
    ~H"""
    {{ asset_import @socket, "js/tailwind" }}

    <div class="bg-goten-100 shadow rounded-lg p-1 {{ @class }}">
      <slot />
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
    ~H"""
    <div class="p-2 pl-3 pr-3 hover:bg-hover rounded-md" :on-click={{ @click }} phx-value-item_id={{ @item_id }}>
      <slot />
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
    ~H"""
    <div class="p-2 pl-3 pr-3 hover:bg-hover rounded-md relative" :on-click={{ @click }} phx-value-item_id={{ @item_id }}>
      <slot />
      <Checkbox class="absolute right-0" checked={{ @checked }} />
    </div>
    """
  end
end
