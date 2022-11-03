defmodule Moon.Components.Breadcrumb.Collapsed do
  @moduledoc false

  use Moon.StatefulComponent

  alias Moon.Icons.ArrowsRight
  alias Moon.Components.Button
  alias Phoenix.LiveView.JS

  prop(breadcrumbs, :list)

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
        <li class="flex items-center gap-2 text-trunks-100">
          <span class="text-trunks-100 transition-colors duration-200 hover:text-bulma-100">
            <a href={Enum.at(@shown_breadcrumbs, 0).link}>{Enum.at(@shown_breadcrumbs, 0).name}</a>
          </span>
          <ArrowsRight class="rtl:rotate-180" />
        </li>

        <li class="relative">
          <Button
            variant="ghost"
            right_icon="other3_dots_horizontal"
            on_click={JS.dispatch("moon:show-collapsed-breadcrumbs", detail: %{breacrumb_flyout_id: "#{@id}_flyout"})}
          />
          <ol
            id={"#{@id}_flyout"}
            class="absolute hidden left-0 top-full bg-gohan-100 p-1 mt-2 flex-col gap-2 shadow-moon-xl rounded-moon-s-xs z-[10000] min-w-[12rem]"
          >
            {#for crumb <- @collapsed_breadcrumbs}
              <li class="flex flex-col items-stretch text-bulma-100 text-moon-14 brcrumb-li rounded-sm cursor-pointer hover:bg-goku-100">
                <a href={crumb.link}>{crumb.name}</a>
              </li>
            {/for}
          </ol>
        </li>

        {#for {crumb, index} <- Enum.with_index(@shown_breadcrumbs)}
          <li class="flex items-center gap-2 text-trunks-100" :if={index > 0}>
            <ArrowsRight />
            <span class={
              "text-trunks-100 transition-colors duration-200 hover:text-bulma-100",
              "text-bulma-100 font-medium": index == Enum.count(@shown_breadcrumbs) - 1
            }>
              <a href={crumb.link}>{crumb.name}</a>
            </span>
          </li>
        {/for}
      </ol>
    </nav>
    """
  end
end
