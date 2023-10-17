defmodule Moon.Design.Breadcrumb.Item do
  @moduledoc false

  use Moon.StatelessComponent, slot: "item"

  alias Moon.Icon

  @doc "Additional Tailwind classes"
  prop(class, :css_class)
  @doc "Additional Tailwind classes"
  prop(divider_class, :css_class, from_context: :divider_class)
  @doc "Title of the crumb"
  prop(title, :string, from_context: :title)
  @doc "Link to the crumb"
  prop(href, :string, from_context: :href)
  @doc "Icon of the crumb"
  prop(icon, :string, from_context: :icon)
  @doc "Index of the item in the list of breadcrumbs"
  prop(value, :integer, from_context: :value)
  @doc "Name of custom icon used as a divider between breadcrumb items"
  prop(divider, :string, from_context: :divider)

  @doc "Screen size, where breadcrumb items with multiple words are partially replaced with ellipsis (...)"
  prop(responsive_crumbs_on, :string, from_context: :responsive_crumbs_on)

  @doc "Default slot"
  slot(default)
  @doc "Divider slot"
  slot(divider_slot)

  def render(assigns) do
    ~F"""
    <li class={merge([
      "flex items-center text-trunks text-moon-14 last:text-bulma last:font-medium",
      @class
    ])}>
      <#slot
        {@divider_slot}
        context_put={
          value: @value != 0,
          divider: @divider || "arrows_right"
        }
      >
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
