defmodule Moon.Design.Breadcrumb.Extended do
  @moduledoc false

  use Moon.StatelessComponent

  alias Moon.Icon

  prop(breadcrumbs, :list)
  prop(divider, :string)
  prop(responsive_crumbs, :boolean)

  def render(assigns) do
    ~F"""
    <nav aria-label="Breadcrumb">
      <ol class="flex flex-wrap gap-2 items-center text-moon-14">
        {#for {crumb, index} <- Enum.with_index(@breadcrumbs)}
          <li class="flex items-center gap-2 text-trunks">
            <Icon name={@divider || "arrows_right"} class="rtl:rotate-180" :if={index != 0} />
            {#if @responsive_crumbs}
              <span class={
                "transition-colors duration-200 hover:text-bulma",
                "hidden block",
                "sm:inline",
                "text-bulma font-medium": index == Enum.count(@breadcrumbs) - 1
              }>
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
              <span class={"sm:hidden", "inline block"}>
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
            {#else}
              <span class={
                "transition-colors duration-200 hover:text-bulma",
                "text-bulma font-medium": index == Enum.count(@breadcrumbs) - 1
              }>
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
            {/if}
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
end
