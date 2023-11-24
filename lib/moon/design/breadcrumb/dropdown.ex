defmodule Moon.Design.Breadcrumb.Dropdown do
  @moduledoc false

  use Moon.StatelessComponent, slot: "dropdown"

  alias Moon.Design.Dropdown
  alias Moon.Icon

  @doc "Id of the component"
  prop(id, :string, required: true)
  @doc "Data-testid attribute for DOM element"
  prop(testid, :string)
  @doc "Data-testid attribute for DOM element"
  prop(class, :css_class)
  @doc "List of crumbs to display - Moon.Design.Breadcrumb.Crumb"
  prop(items, :list, from_context: :items)
  @doc "Name of custom icon used as a collapsed icon"
  prop(icon, :string)

  @doc "Default slot"
  slot(default)

  def render(assigns) do
    ~F"""
    <#slot>
      <Dropdown id={"#{@id}-collapsed-breadcrumbs"} {=@testid}>
        <Dropdown.Options class="min-w-[8.5rem] p-1">
          {#for crumb <- @items || []}
            <a href={crumb.link}>
              <Dropdown.Option class="w-full p-2">
                <Icon
                  name={crumb.icon}
                  class="text-moon-24"
                  :if={Map.has_key?(crumb, :icon) && crumb.icon != ""}
                />
                {#if crumb.name}
                  {crumb.name}
                {/if}
              </Dropdown.Option>
            </a>
          {/for}
        </Dropdown.Options>

        <Dropdown.Trigger>
          <div class="w-6 text-center text-trunks text-moon-14 cursor-pointer">...</div>
        </Dropdown.Trigger>
      </Dropdown>
    </#slot>
    """
  end
end
