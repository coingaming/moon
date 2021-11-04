defmodule MoonWeb.Pages.ExamplePages.Shared.TopMenu.Search.SearchResults do
  @moduledoc false

  use MoonWeb, :stateful_component

  alias Moon.Autolayouts.Sections
  alias Moon.Autolayouts.TopToDown
  alias Moon.Components.Link
  alias Moon.Icon

  prop search_text, :string
  data search_results, :any

  def mount(assigns) do
    {:ok, assign(assigns, search_results: get_search_results(""))}
  end

  def render(assigns) do
    ~F"""
    <Sections class="w-full bg-gohan-100 shadow rounded-lg pt-2">
      <div :for={section <- @search_results}>
        <div class="pb-4">{section.title}</div>
        <TopToDown>
          <div :for={child <- section.children}>
            <Link to={child.to}>
              <Icon name={child.icon} class="mr-4" />
              {child.text}
            </Link>
          </div>
        </TopToDown>
      </div>
    </Sections>
    """
  end

  def get_search_results(_search_text) do
    [
      %{
        title: "Transactions",
        children: [
          %{
            icon: "icon_arrow_diagonals",
            text: "Pending withdrawal",
            to: "/lab-light/example-pages/transactions"
          },
          %{
            icon: "icon_arrow_diagonals",
            text: "Pending deposits",
            to: "/lab-light/example-pages/transactions"
          }
        ]
      },
      %{
        title: "Marketing",
        children: [
          %{icon: "icon_forward", text: "Rewards", to: "/lab-light/example-pages/marketing"},
          %{
            icon: "icon_forward",
            text: "Freebet offers",
            to: "/lab-light/example-pages/marketing"
          },
          %{
            icon: "icon_forward",
            text: "Reward instances",
            to: "/lab-light/example-pages/marketing"
          },
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
