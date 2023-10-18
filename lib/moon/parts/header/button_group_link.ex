defmodule Moon.Parts.Header.ButtonGroupLink do
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
  @doc "Active page"
  data(active_page, :string, from_context: :active_page)

  def render(assigns) do
    ~F"""
    <Tooltip {=@id} {=@testid} class="self-center">
      <Tooltip.Trigger class="rounded-moon-s-xx rounded-full h-12 w-12">
        <MenuItem
          as="a"
          class={merge([
            [
              "bg-goku text-bulma justify-start rounded-moon-i-xx border border-beerus rounded-full p-3 gap-3 h-12 w-12",
              "bg-bulma": @active_page == @route
            ],
            @class
          ])}
          attrs={
            "data-phx-link": "redirect",
            "data-phx-link-state": "push"
          }
          is_active={@active_page == @route}
          href={@route}
        >
          <Icon name={@icon_name} class={merge(["text-moon-24", @icon_class])} />
        </MenuItem>
      </Tooltip.Trigger>
      <Tooltip.Content
        position="bottom"
        class={merge(["bg-bulma text-goku z-[19999]", @tooltip_class])}
      >{@tooltip_text}<Tooltip.Arrow class="mt-2" />
      </Tooltip.Content>
    </Tooltip>
    """
  end
end
