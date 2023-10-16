defmodule Moon.Design.Breadcrumb.Collapsed do
  @moduledoc false

  use Moon.StatefulComponent

  alias Moon.Icon
  alias Moon.Design.Button.IconButton

  alias Moon.Design.Breadcrumb.Item

  alias Moon.Design.Dropdown

  @doc "List of crumbs to display - Moon.Design.Breadcrumb.Crumb"
  prop(breadcrumbs, :list)
  @doc "Name of custom icon used as a divider between breadcrumb items"
  prop(divider, :string)
  @doc "Name of custom icon used as a collapsed icon"
  prop(collapsed_icon, :string)

  @doc "Screen size, where breadcrumb items with multiple words are partially replaced with ellipsis (...)"
  prop(responsive_crumbs_on, :string, values: ~w(sm md lg xl 2xl))
  @doc "Additional Tailwind classes"
  prop(divider_class, :css_class)
  @doc "Additional Tailwind classes"
  prop(class, :css_class)
  @doc "Additional Tailwind classes"
  prop(collapsed_class, :css_class)
  @doc "Additional Tailwind classes"
  prop(collapsed_item_class, :css_class)
  @doc "Visual/Logical variant of collapsed icon button"
  prop(variant, :string,
    values: ["fill", "outline", "ghost"],
    default: "ghost"
  )

  @doc "Size of collapsed icon button"
  prop(size, :string, values: ["xs", "sm", "md", "lg", "xl"], default: "xs")
  @doc "List of shown crumbs - Moon.Design.Breadcrumb.Crumb"
  data(shown_breadcrumbs, :list, default: [])
  @doc "List of collapsed crumbs - Moon.Design.Breadcrumb.Crumb"
  data(collapsed_breadcrumbs, :list, default: [])

  @doc "Shown items slot"
  slot(shown_items)
  @doc "Collapsed items slot"
  slot(collapsed_items)
  @doc "First item slot"
  slot(first_item)

  def update(assigns, socket) do
    count = Enum.count(assigns.breadcrumbs)
    first_crumb = Enum.at(assigns.breadcrumbs, 0)
    tail_breadcrumbs = Enum.take(assigns.breadcrumbs, -2)

    shown_breadcrumbs = Enum.concat([first_crumb], tail_breadcrumbs)
    collapsed_breadcrumbs = Enum.slice(assigns.breadcrumbs, 1..(count - 3))

    socket =
      socket
      |> assign(assigns)
      |> assign(
        :shown_breadcrumbs,
        shown_breadcrumbs
      )
      |> assign(
        :collapsed_breadcrumbs,
        collapsed_breadcrumbs
      )

    {:ok, socket}
  end

  def render(assigns) do
    ~F"""
    <nav aria-label="Breadcrumb">
      <ol class="flex flex-wrap items-center">
        <#slot
          {@first_item}
          context_put={
            value: 0,
            responsive_crumbs_on: @responsive_crumbs_on,
            href: Enum.at(@shown_breadcrumbs, 0).link,
            title: Enum.at(@shown_breadcrumbs, 0).name,
            icon: Enum.at(@shown_breadcrumbs, 0).icon
          }
        >
          <Item
            {=@divider}
            {=@responsive_crumbs_on}
            {=@divider_class}
            {=@class}
            first_shown_breadcrumb={Enum.at(@shown_breadcrumbs, 0)}
            href={Enum.at(@shown_breadcrumbs, 0).link}
            title={Enum.at(@shown_breadcrumbs, 0).name}
            icon={Enum.at(@shown_breadcrumbs, 0).icon}
          />

          <Icon
            name={@divider || "arrows_right"}
            class={merge(["rtl:rotate-180 mx-2 text-moon-14 text-trunks", @divider_class])}
          />
        </#slot>

        <#slot
          {@collapsed_items}
          context_put={
            responsive_crumbs_on: @responsive_crumbs_on
          }
        >
          <Dropdown id={"#{@id}-collapsed-breadcrumbs"}>
            <Dropdown.Options class={["min-w-[8.5rem] p-1", @collapsed_class]}>
              {#for crumb <- @collapsed_breadcrumbs}
                <a href={crumb.link}>
                  <Dropdown.Option class={["w-full p-2", @collapsed_item_class]}>
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
              <IconButton
                icon={@collapsed_icon || "other3_dots_horizontal"}
                variant={@variant || "ghost"}
                size={@size || "xs"}
              />
            </Dropdown.Trigger>
          </Dropdown>
        </#slot>

        {#for {crumb, index} <- Enum.with_index(@shown_breadcrumbs)}
          <#slot
            {@shown_items, crumb: crumb}
            context_put={
              value: index,
              responsive_crumbs_on: @responsive_crumbs_on,
              title: crumb.name,
              href: crumb.link,
              icon: crumb.icon
            }
          >
            <Item
              :if={index > 0}
              {=@divider}
              {=@responsive_crumbs_on}
              {=@divider_class}
              {=@class}
              value={index}
              href={crumb.link}
              title={crumb.name}
              icon={Map.get(crumb, :icon)}
            />
          </#slot>
        {/for}
      </ol>
    </nav>
    """
  end
end
