defmodule Moon.Design.Dropdown.Footer do
  @moduledoc "Optional dropdown header"

  use Moon.StatelessComponent, slot: "footer"

  alias Moon.Design.Button.IconButton
  alias Moon.Design.Button
  alias Moon.Icon

  @doc "Data-testid attribute for HTML tag"
  prop(testid, :string)
  @doc "Id attribute for HTML tag"
  prop(id, :string)
  @doc "Additional Taiilwind classes"
  prop(class, :css_class)

  @doc "Inner content of the component"
  slot(default)

  def render(assigns) do
    ~F"""
    <div data-testid={@testid} {=@id} class={merge(["h-14 p-3 bg-heles", @class])}>
      <#slot>
        <div class="flex flex-row justify-between items-center">
          <div class="flex flex-row gap-1 items-center">
            <IconButton
              size="sm"
              class="bg-heles active:transform-none cursor-default"
              hover_bg_class="group-hover:bg-transparent"
            ><Icon name="arrows_up" class="text-bulma moon-text-16" /></IconButton>
            <IconButton
              size="sm"
              class="bg-heles active:transform-none cursor-default"
              hover_bg_class="group-hover:bg-transparent"
            ><Icon name="arrows_down" class="text-bulma moon-text-16" /></IconButton>
            <span class="text-trunks text-moon-12 ps-1">to navigate</span>
          </div>
          <div class="flex flex-row gap-1 items-center">
            <IconButton
              size="sm"
              class="bg-heles active:transform-none cursor-default"
              hover_bg_class="group-hover:bg-transparent"
            ><Icon name="arrows_reply" class="scale-y-[-1] text-bulma moon-text-16" /></IconButton>
            <span class="text-trunks text-moon-12 ps-1">to select</span>
          </div>
          <div class="flex flex-row gap-1 items-center">
            <Button
              size="sm"
              class="w-8 p-1 font-normal text-moon-12 bg-heles text-bulma active:transform-none cursor-default"
              hover_bg_class="group-hover:bg-transparent"
            >esc</Button>
            <span class="text-trunks text-moon-12 ps-1">to close</span>
          </div>
        </div>
      </#slot>
    </div>
    """
  end
end
