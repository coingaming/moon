defmodule Moon.Design.Breadcrumb.Item do
  @moduledoc false

  use Moon.StatelessComponent, slot: "item"

  alias Moon.Icon

  @doc "Additional Tailwind classes"
  prop(class, :css_class)

  @doc "Additional Tailwind classes"
  prop(divider_class, :css_class)

  @doc "Will be got from Accordion in most cases"

  prop(title, :string, from_context: :title)

  prop(href, :string)

  prop(icon, :string)

  prop(value, :integer, from_context: :value)

  prop(breadcrumbs, :list)
  prop(divider, :string)
  prop(responsive_crumbs_on, :string, from_context: :responsive_crumbs_on)

  prop(name, :string, from_context: :name)

  prop(has_icon, :boolean)

  slot(default)

  slot(divider_slot)

  def render(assigns) do
    ~F"""
    <li class={merge([
      "flex items-center text-trunks text-moon-14 last:text-bulma last:font-medium",
      @class
    ])}>
      <#slot {@divider_slot}>
        <Icon
          name={@divider || "arrows_right"}
          class={merge(["rtl:rotate-180 mx-2 text-moon-14 text-trunks", @divider_class])}
          :if={@value != 0}
        />
      </#slot>
      <span class={merge([
        "transition-colors duration-200 ",
        hidden: @responsive_crumbs_on,
        "#{breadcrumb_classes(@responsive_crumbs_on)}": @responsive_crumbs_on
      ])}>
        <a href={@href}>
          <Icon name={@icon} class="text-moon-24" :if={@icon && @icon != ""} />
          <#slot>{@title}</#slot>
        </a>
      </span>
      <span
        :if={@responsive_crumbs_on}
        class={merge([
          "inline",
          ellipsed_breadcrumb_classes(@responsive_crumbs_on)
        ])}
      >
        <a href={@href}>
          <Icon name={@icon} class="text-moon-24" :if={@icon && @icon != ""} />
          {name_with_ellips(@title)}
        </a>
      </span>
    </li>
    """
  end

  defp name_with_ellips(name) do
    [first_word | _] = String.split(name)

    if String.split(name) |> tl() != [] do
      first_word <> "..."
    else
      first_word
    end
  end

  defp breadcrumb_classes(nil), do: []

  defp breadcrumb_classes(size) do
    ~w(inline) |> Enum.map(&"#{size}:#{&1}")
  end

  defp ellipsed_breadcrumb_classes(nil), do: []

  defp ellipsed_breadcrumb_classes(size) do
    ~w(hidden) |> Enum.map(&"#{size}:#{&1}")
  end
end

# <li class="flex items-center gap-2 text-trunks">
# <Icon name={@divider || "arrows_right"} class="rtl:rotate-180" :if={index != 0} />
# <span class={merge([
#   "transition-colors duration-200 hover:text-bulma",
#   "text-bulma font-medium": index == Enum.count(@breadcrumbs) - 1,
#   hidden: @responsive_crumbs_on,
#   "#{breadcrumb_classes(@responsive_crumbs_on)}": @responsive_crumbs_on
# ])}>
#   <a href={crumb.link} aria-current={index == Enum.count(@breadcrumbs) - 1 && "page"}>
#     <Icon
#       name={crumb.icon}
#       class="text-moon-24"
#       :if={Map.has_key?(crumb, :icon) && crumb.icon != ""}
#     />
#     {#if crumb.name}
#       {crumb.name}
#     {/if}
#   </a>
# </span>
# <span
#   :if={@responsive_crumbs_on}
#   class={merge([
#     "inline",
#     ellipsed_breadcrumb_classes(@responsive_crumbs_on)
#   ])}
# >
#   <a href={crumb.link} aria-current={index == Enum.count(@breadcrumbs) - 1 && "page"}>
#     <Icon
#       name={crumb.icon}
#       class="text-moon-24"
#       :if={Map.has_key?(crumb, :icon) && crumb.icon != ""}
#     />
#     {#if crumb.name}
#       {name_with_ellips(crumb)}
#     {/if}
#   </a>
# </span>
# </li>
