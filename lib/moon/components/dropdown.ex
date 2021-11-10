defmodule Moon.Components.Dropdown do
  @moduledoc false

  use Moon.StatelessComponent

  alias Moon.Assets.Icons.IconZoom
  alias Moon.Components.Form
  alias Moon.Components.TextInput

  prop(on_search_change, :event)
  prop(search_placeholder, :string)
  prop(search_name, :string)
  prop(search_value, :string)
  prop(class, :string)
  slot(default)

  def render(assigns) do
    ~F"""
    <div class="box-content bg-gohan-100 h-auto rounded-lg #{@class}">
      <div class="relative" :if={@on_search_change}>
        <IconZoom class="absolute top-4 left-4" />
        <Form for={@search_name} change={@on_search_change}>
          <TextInput
            class="outline-none bg-transparent pl-12 p-4 w-full"
            type="search"
            placeholder={@search_placeholder}
            field={:value}
            value={@search_value}
          />
        </Form>
      </div>
      <#slot />
    </div>
    """
  end
end

defmodule Moon.Components.Dropdown.Item do
  @moduledoc false
  use Moon.StatelessComponent

  prop(click, :event)
  prop(item_id, :number)
  slot(default)

  def render(assigns) do
    ~F"""
    <div
      class="p-2 pl-3 pr-3 hover:bg-hover rounded-md"
      :on-click={@click}
      phx-value-item_id={@item_id}
    >
      <#slot />
    </div>
    """
  end
end

defmodule Moon.Components.Dropdown.CheckboxItem do
  @moduledoc false

  use Moon.StatelessComponent

  alias Moon.Components.Checkbox

  prop(click, :event)
  prop(item_id, :number)
  prop(checked, :boolean)
  slot(default)

  def render(assigns) do
    ~F"""
    <div
      class="p-2 pl-3 pr-3 hover:bg-hover rounded-md relative"
      :on-click={@click}
      phx-value-item_id={@item_id}
    >
      <#slot />
      <Checkbox class="absolute right-0" checked={@checked} />
    </div>
    """
  end
end
