defmodule MoonWeb.Pages.ExamplePages.TransactionsPage.SearchResults do
  use MoonWeb, :stateful_component

  alias Moon.Assets.Icon

  prop search_text, :string
  data search_results, :any

  def mount(assigns) do
    {:ok, assign(assigns, search_results: get_search_results(""))}
  end

  def render(assigns) do
    ~H"""
    <div class="p-4 bg-gohan-100 shadow rounded absolute w-full mt-4">
      <div class="p-4" :for={{ section <- @search_results }}>
        <div class="pb-4">{{ section.title }}</div>
        <div class="pb-4" :for={{ child <- section.children }}>
          <Icon name={{ child.icon }} class="mr-4" />
          {{ child.text }}
        </div>
      </div>
    </div>
    """
  end

  def get_search_results(search_text) do
    [
      %{
        title: "Transactions",
        children: [
          %{icon: "icon_arrow_diagonals", text: "Pending withdrawal"},
          %{icon: "icon_arrow_diagonals", text: "Pending deposits"}
        ]
      },
      %{
        title: "Marketing",
        children: [
          %{icon: "icon_forward", text: "Rewards"},
          %{icon: "icon_forward", text: "Freebet offers"},
          %{icon: "icon_forward", text: "Reward instances"},
          %{icon: "icon_forward", text: "Bonuses"},
          %{icon: "icon_forward", text: "Bonus groups"}
        ]
      },
      %{
        title: "Sites",
        children: []
      },
      %{
        title: "Log audits",
        children: [
          %{icon: "icon_forward", text: "Records list"}
        ]
      }
    ]
  end
end
