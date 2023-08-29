defmodule Moon.Design.Breadcrumb.Extended do
  @moduledoc false

  use Moon.StatelessComponent

  alias Moon.Icon

  prop(breadcrumbs, :list)
  prop(divider, :string)
  prop(responsive_crumbs_on, :string, values: ~w(sm md lg xl 2xl))

  def render(assigns) do
    ~F"""
    <nav aria-label="Breadcrumb">
      <ol class="flex flex-wrap gap-2 items-center text-moon-14">
        {#for {crumb, index} <- Enum.with_index(@breadcrumbs)}
          <li class="flex items-center gap-2 text-trunks">
            <Icon name={@divider || "arrows_right"} class="rtl:rotate-180" :if={index != 0} />
            <span class={merge([
              "transition-colors duration-200 hover:text-bulma",
              "text-bulma font-medium": index == Enum.count(@breadcrumbs) - 1,
              hidden: @responsive_crumbs_on,
              "#{breadcrumb_classes(@responsive_crumbs_on)}": @responsive_crumbs_on
            ])}>
              <a href={crumb.link} aria-current={index == Enum.count(@breadcrumbs) - 1 && "page"}>
                <Icon
                  name={crumb.icon}
                  class="text-moon-24"
                  :if={Map.has_key?(crumb, :icon) && crumb.icon != ""}
                />
                {#if crumb.name}
                  {crumb.name}
                {/if}
              </a>
            </span>
            <span
              :if={@responsive_crumbs_on}
              class={merge([
                "inline",
                ellipsed_breadcrumb_classes(@responsive_crumbs_on)
              ])}
            >
              <a href={crumb.link} aria-current={index == Enum.count(@breadcrumbs) - 1 && "page"}>
                <Icon
                  name={crumb.icon}
                  class="text-moon-24"
                  :if={Map.has_key?(crumb, :icon) && crumb.icon != ""}
                />
                {#if crumb.name}
                  {name_with_ellips(crumb)}
                {/if}
              </a>
            </span>
          </li>
        {/for}
      </ol>
    </nav>
    """
  end

  def name_with_ellips(crumb) do
    [first_word | _] = String.split(crumb.name)

    if String.split(crumb.name) |> tl() != [] do
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
