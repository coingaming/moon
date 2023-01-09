defmodule Moon.Design.Breadcrumb.Extended do
  @moduledoc false

  use Moon.StatelessComponent

  alias Moon.Icons.ArrowsRight

  prop(breadcrumbs, :list)

  def render(assigns) do
    ~F"""
    <nav aria-label="Breadcrumb">
      <ol class="flex flex-wrap gap-2 items-center text-moon-14">
        {#for {crumb, index} <- Enum.with_index(@breadcrumbs)}
          <li class="flex items-center gap-2 text-trunks">
            <ArrowsRight class="rtl:rotate-180" :if={index != 0} />
            <span class={
              "transition-colors duration-200 hover:text-bulma",
              "text-bulma font-medium": index == Enum.count(@breadcrumbs) - 1
            }>
              <a href={crumb.link} aria-current={index == Enum.count(@breadcrumbs) - 1 && "page"}>{crumb.name}</a>
            </span>
          </li>
        {/for}
      </ol>
    </nav>
    """
  end
end
