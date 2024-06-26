defmodule Moon.Parts.Sidebar.SlimMenuLink do
  @moduledoc false

  use Moon.StatelessComponent

  alias Moon.Design.MenuItem
  alias Moon.Icon
  alias Moon.Design.Tooltip

  prop(active, :boolean, default: false)
  prop(tooltip_text, :string, default: "")
  prop(is_collapsed, :boolean, default: false)

  @doc "Id attribute for DOM element"
  prop(id, :string)
  @doc "Data-testid attribute for DOM element"
  prop(testid, :string)
  @doc "Additional Tailwind classes"
  prop(class, :css_class)
  @doc "Additional Tailwind classes"
  prop(icon_class, :css_class)
  @doc "Additional Tailwind classes"
  prop(tooltip_class, :css_class)
  @doc "Route to redirect to"
  prop(route, :any)
  @doc "Icon name"
  prop(icon_name, :any)
  @doc "Additional attributes set for the tag a"
  prop(attrs, :map, default: %{})
  @doc "Active page"
  prop(active_page, :string, from_context: :active_page)

  @doc "Some additional classes will be added to indicate is active"
  prop(is_active, :boolean, default: false)
  @doc "Add this as is_selected value and also work for underlying checkbox/radio"
  prop(is_selected, :boolean, default: false)

  def render(assigns) do
    ~F"""
    <Tooltip {=@id} {=@testid} class="self-center">
      <Tooltip.Trigger class="rounded-full h-12 w-12">
        <MenuItem
          as="a"
          class={merge([
            [
              "bg-goku text-bulma justify-start rounded-full p-3 gap-3 h-12 w-12",
              "bg-bulma text-goku hover:bg-bulma": @is_active || @is_selected
            ],
            @class
          ])}
          attrs={Map.merge(
            %{
              "data-phx-link": "redirect",
              "data-phx-link-state": "push",
              "aria-selected": false
            },
            @attrs
          )}
          href={@route}
        >
          <Icon name={@icon_name} class={merge(["text-moon-24", @icon_class])} />
        </MenuItem>
      </Tooltip.Trigger>
      <Tooltip.Content
        position="right"
        class={merge(["bg-bulma text-goku z-[19999] mt-1 invisible lg:visible", @tooltip_class])}
      >{@tooltip_text}<Tooltip.Arrow class="ms-1" />
      </Tooltip.Content>
    </Tooltip>
    """
  end
end
