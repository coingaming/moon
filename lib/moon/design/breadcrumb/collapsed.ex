defmodule Moon.Design.Breadcrumb.Collapsed do
  @moduledoc false

  use Moon.StatefulComponent

  alias Moon.Icon
  alias Moon.Design.Button.IconButton
  alias Phoenix.LiveView.JS

  prop(breadcrumbs, :list)

  prop(divider, :string)
  prop(collapsed_icon, :string)
  prop(responsive_crumbs, :boolean)

  data(shown_breadcrumbs, :list, default: [])
  data(collapsed_breadcrumbs, :list, default: [])

  def update(assigns, socket) do
    count = Enum.count(assigns.breadcrumbs)
    first_crumb = Enum.at(assigns.breadcrumbs, 0)
    tail_breadcrumbs = Enum.take(assigns.breadcrumbs, -2)

    shown_breadcrumbs = Enum.concat([first_crumb], tail_breadcrumbs)
    collapsed_breadcrumbs = Enum.slice(assigns.breadcrumbs, 1..(count - 2))

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
      <ol class="flex flex-wrap gap-2 items-center text-moon-14">
        <li class="flex items-center gap-2 text-trunks">
          {#if @responsive_crumbs}
            <span class={
              "transition-colors duration-200 hover:text-bulma",
              "hidden block",
              "sm:inline"
            }>
              <a href={Enum.at(@shown_breadcrumbs, 0).link}>
                <Icon
                  name={Enum.at(@shown_breadcrumbs, 0).icon}
                  class="text-moon-24"
                  :if={Map.has_key?(Enum.at(@shown_breadcrumbs, 0), :icon) && Enum.at(@shown_breadcrumbs, 0).icon != ""}
                />
                {#if Enum.at(@shown_breadcrumbs, 0).name}
                  {Enum.at(@shown_breadcrumbs, 0).name}
                {/if}
              </a>
            </span>
            <span class={"sm:hidden", "inline block"}>
              <a href={Enum.at(@shown_breadcrumbs, 0).link}>
                <Icon
                  name={Enum.at(@shown_breadcrumbs, 0).icon}
                  class="text-moon-24"
                  :if={Map.has_key?(Enum.at(@shown_breadcrumbs, 0), :icon) && Enum.at(@shown_breadcrumbs, 0).icon != ""}
                />
                {#if Enum.at(@shown_breadcrumbs, 0).name}
                  {first_crumb_with_ellips(@shown_breadcrumbs)}
                {/if}
              </a>
            </span>
          {#else}
            <span class="text-trunks transition-colors duration-200 hover:text-bulma">
              <a href={Enum.at(@shown_breadcrumbs, 0).link}>
                <Icon
                  name={Enum.at(@shown_breadcrumbs, 0).icon}
                  class="text-moon-24"
                  :if={Map.has_key?(Enum.at(@shown_breadcrumbs, 0), :icon) && Enum.at(@shown_breadcrumbs, 0).icon != ""}
                />
                {#if Enum.at(@shown_breadcrumbs, 0).name}
                  {Enum.at(@shown_breadcrumbs, 0).name}
                {/if}</a>
            </span>
          {/if}
          <Icon name={@divider || "arrows_right"} class="rtl:rotate-180" />
        </li>

        <li
          class="relative"
          phx-click-away={JS.dispatch("moon:close-breadcrumb-flyout", detail: %{breacrumb_flyout_id: "#{@id}_flyout"})}
        >
          <IconButton
            variant="ghost"
            icon_only={@collapsed_icon || "other3_dots_horizontal"}
            size="xs"
            on_click={JS.dispatch("moon:toggle-collapsed-breadcrumbs", detail: %{breacrumb_flyout_id: "#{@id}_flyout"})}
          />
          <ol
            id={"#{@id}_flyout"}
            class="absolute hidden ltr:left-0 rtl:right-0 top-full bg-gohan p-1 mt-3 flex flex-col gap-2 shadow-moon-lg rounded-moon-s-md z-10000 min-w-[8.5rem]"
          >
            {#for crumb <- @collapsed_breadcrumbs}
              <li class="flex flex-col items-stretch text-bulma text-moon-14 brcrumb-li rounded-sm cursor-pointer hover:bg-heles">
                <a href={crumb.link}>
                  <Icon
                    name={crumb.icon}
                    class="text-moon-24"
                    :if={Map.has_key?(crumb, :icon) && crumb.icon != ""}
                  />
                  {#if crumb.name}
                    {crumb.name}
                  {/if}
                </a>
              </li>
            {/for}
          </ol>
        </li>

        {#for {crumb, index} <- Enum.with_index(@shown_breadcrumbs)}
          <li class="flex items-center gap-2 text-trunks" :if={index > 0}>
            <Icon name={@divider || "arrows_right"} class="rtl:rotate-180" />
            {#if @responsive_crumbs}
              <span class={
                "transition-colors duration-200 hover:text-bulma",
                "hidden block",
                "sm:inline",
                "text-bulma font-medium": index == Enum.count(@shown_breadcrumbs) - 1
              }>
                <a href={crumb.link} aria-current={index == Enum.count(@shown_breadcrumbs) - 1 && "page"}>
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
                <a href={crumb.link} aria-current={index == Enum.count(@shown_breadcrumbs) - 1 && "page"}>
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
                "text-bulma font-medium": index == Enum.count(@shown_breadcrumbs) - 1
              }>
                <a href={crumb.link} aria-current={index == Enum.count(@shown_breadcrumbs) - 1 && "page"}>
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

  def first_crumb_with_ellips(shown_breadcrumbs) do
    breadcrumb = Enum.at(shown_breadcrumbs, 0).name

    [first_word | _] = String.split(breadcrumb)

    if String.split(breadcrumb) |> tl() != [] do
      first_word <> "..."
    else
      first_word
    end
  end
end
