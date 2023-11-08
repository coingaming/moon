defmodule Moon.Parts.Header.Breadcrumbs do
  @moduledoc false

  use Moon.StatelessComponent, slot: "breadcrumbs"

  alias Moon.Design.Breadcrumb
  alias Moon.Icon

  @doc "Id attribute for DOM element"
  prop(id, :string)
  @doc "Data-testid attribute for DOM element"
  prop(testid, :string)
  @doc "Additional Tailwind classes"
  prop(class, :css_class)
  @doc "Additional Tailwind classes"
  prop(item_class, :css_class)
  @doc "Additional Tailwind classes"
  prop(icon_class, :css_class)
  @doc "Breadcrumbs list"
  prop(breadcrumbs, :list, default: [])

  def render(assigns) do
    ~F"""
    <Breadcrumb
      {=@id}
      {=@testid}
      {=@breadcrumbs}
      divider="controls_chevron_right"
      class={merge(["hidden lg:inline", @class])}
    >
      <Breadcrumb.Item
        class={merge(["hover:text-bulma last:text-bulma last:font-normal", @item_class])}
        :let={crumb: crumb}
      >
        <Breadcrumb.Item.Divider divider="controls_chevron_right_small" class="text-moon-20" />
        <Icon
          name={crumb.icon}
          class={merge(["text-moon-20 mb-0.5", @icon_class])}
          :if={Map.has_key?(crumb, :icon) && crumb.icon != ""}
        />
        {#if crumb.name}
          {crumb.name}
        {/if}
      </Breadcrumb.Item>
    </Breadcrumb>
    """
  end
end
