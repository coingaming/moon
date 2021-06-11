defmodule MoonWeb.Pages.ExamplePages.Shared.TopMenu.Search.SearchResults do
  use MoonWeb, :stateful_component

  alias Moon.Assets.Icon
  alias Moon.Components.Popover
  alias Moon.Components.Link

  prop search_text, :string
  prop close, :event
  data search_results, :any

  def mount(assigns) do
    {:ok, assign(assigns, search_results: get_search_results(""))}
  end

  def render(assigns) do
    ~H"""
    <Popover close={{ @close }} placement="under">
      <div class="p-4" :for={{ section <- @search_results }}>
        <div class="pb-4">{{ section.title }}</div>
        <div class="pb-4" :for={{ child <- section.children }}>
          <Link to={{ child.to }}>
            <Icon name={{ child.icon }} class="mr-4" />
            {{ child.text }}
          </Link>
        </div>
      </div>
    </Popover>
    """
  end

  def get_search_results(_search_text) do
    [
      %{
        title: "Transactions",
        children: [
          %{icon: "icon_arrow_diagonals", text: "Pending withdrawal", to: "/lab-light/example-pages/transactions"},
          %{icon: "icon_arrow_diagonals", text: "Pending deposits", to: "/lab-light/example-pages/transactions"},
        ]
      },
      %{
        title: "Marketing",
        children: [
          %{icon: "icon_forward", text: "Rewards", to: "/lab-light/example-pages/marketing"},
          %{icon: "icon_forward", text: "Freebet offers", to: "/lab-light/example-pages/marketing"},
          %{icon: "icon_forward", text: "Reward instances", to: "/lab-light/example-pages/marketing"},
          %{icon: "icon_forward", text: "Bonuses", to: "/lab-light/example-pages/marketing"},
          %{icon: "icon_forward", text: "Bonus groups", to: "/lab-light/example-pages/marketing"}
        ]
      },
      %{
        title: "Sites",
        children: []
      },
      %{
        title: "Log audits",
        children: [
          %{icon: "icon_forward", text: "Records list", to: "#"}
        ]
      }
    ]
  end
end
