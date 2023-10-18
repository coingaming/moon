defmodule Moon.Design.Breadcrumb.CollapsedItems do
  @moduledoc false

  use Moon.StatelessComponent, slot: "collapsed_items"

  alias Moon.Design.Dropdown
  alias Moon.Icon
  alias Moon.Design.Button.IconButton

  @doc "Id of the component"
  prop(id, :string, required: true)
  @doc "Data-testid attribute for DOM element"
  prop(class, :css_class)
  @doc "List of crumbs to display - Moon.Design.Breadcrumb.Crumb"
  prop(collapsed_breadcrumbs, :list, from_context: :collapsed_breadcrumbs)
  @doc "Additional Tailwind classes"
  prop(collapsed_class, :css_class)
  @doc "Additional Tailwind classes"
  prop(collapsed_item_class, :css_class)
  @doc "List of crumbs to display - Moon.Design.Breadcrumb.Crumb"
  prop(collapsed_icon, :string)
  @doc "Variant of collapsed icon button"
  prop(variant, :string)
  @doc "Size of collapsed icon button"
  prop(size, :string)
  @doc "Title of the crumb"
  prop(title, :string, from_context: :title)
  @doc "Link to the crumb"
  prop(href, :string, from_context: :href)
  @doc "Icon of the crumb"
  prop(icon, :string, from_context: :icon)

  @doc "Default slot"
  slot(default)

  def render(assigns) do
    ~F"""
    <Dropdown id={"#{@id}-collapsed-breadcrumbs"}>
      <Dropdown.Options class="min-w-[8.5rem] p-1">
        {#for crumb <- @collapsed_breadcrumbs || []}
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
        <IconButton icon={@collapsed_icon || "other3_dots_horizontal"} variant="ghost" size="xs" />
      </Dropdown.Trigger>
    </Dropdown>
    """
  end
end
