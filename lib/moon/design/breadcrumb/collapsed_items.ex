defmodule Moon.Design.Breadcrumb.CollapsedItems do
  @moduledoc false

  use Moon.StatelessComponent, slot: "collapsed_items"

  alias Moon.Design.Dropdown
  alias Moon.Icon
  alias Moon.Design.Button.IconButton

  @doc "Id of the component"
  prop(id, :string)
  @doc "Data-testid attribute for DOM element"
  prop(testid, :string)
  @doc "Additional Tailwind classes"
  prop(class, :css_class)
  @doc "List of crumbs to display - Moon.Design.Breadcrumb.Crumb"
  prop(collapsed_breadcrumbs, :list)
  @doc "Additional Tailwind classes"
  prop(collapsed_class, :css_class)
  @doc "Additional Tailwind classes"
  prop(collapsed_item_class, :css_class)
  @doc "List of crumbs to display - Moon.Design.Breadcrumb.Crumb"
  prop(collapsed_icon, :string)
  @doc "Variant of collapsed icon button"
  prop(variant, :string, values: ["fill", "outline", "ghost"], default: "ghost")
  @doc "Size of collapsed icon button"
  prop(size, :string, values: ["xs", "sm", "md", "lg", "xl"], default: "xs")
  @doc "Href of the breadcrumb item"
  prop(href, :string)
  @doc "Icon of the breadcrumb item"
  prop(icon, :string)
  @doc "Default slot"
  slot(default)

  def render(assigns) do
    ~F"""
    <Dropdown id={"#{@id}-collapsed-items"}>
      <Dropdown.Options class={["min-w-[8.5rem] p-1", @collapsed_class]}>
        <a href={@href}>
          <Dropdown.Option class={["w-full p-2", @collapsed_item_class]}>
            <Icon name={@icon} class="text-moon-24" :if={@icon && @icon != ""} />
          </Dropdown.Option>
        </a>
      </Dropdown.Options>

      <Dropdown.Trigger>
        <IconButton
          icon={@collapsed_icon || "other3_dots_horizontal"}
          variant={@variant || "ghost"}
          size={@size || "xs"}
        />
      </Dropdown.Trigger>
    </Dropdown>
    <#slot />
    """
  end
end
