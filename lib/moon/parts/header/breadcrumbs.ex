defmodule Moon.Parts.Header.Breadcrumbs do
  @moduledoc false

  use Moon.StatelessComponent

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
  @doc "Conditional displaying due to an issue with named slots in Surface"
  prop(is_hidden, :boolean, default: false)

  def render(assigns) do
    ~F"""
    <Breadcrumb
      {=@id}
      {=@testid}
      {=@breadcrumbs}
      divider="controls_chevron_right"
      class={merge(["hidden lg:inline px-8 pt-8 not-last:pb-6", ["lg:hidden": @is_hidden], @class])}
    >
      <Breadcrumb.Item
        class={merge(["hover:text-bulma last:text-bulma last:font-normal", @item_class])}
        :let={crumb: crumb}
      >
        <Breadcrumb.Item.Divider>
          <Icon name="controls_chevron_right_small" class="rtl:rotate-180 mx-2 text-moon-20 text-trunks" />
        </Breadcrumb.Item.Divider>
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
