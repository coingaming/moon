defmodule MoonWeb.Pages.ExamplePages.Shared.TopMenu.Search.SearchResults do
  use MoonWeb, :stateful_component

  alias Moon.Assets.Icon
  alias Moon.Autolayouts.Sections
  alias Moon.Autolayouts.TopToDown
  alias Moon.Components.Link
  alias Moon.Components.Popover

  prop search_text, :string
  prop close, :event
  data search_results, :any

  def mount(assigns) do
    {:ok, assign(assigns, search_results: get_search_results(""))}
  end

  def render(assigns) do
    ~F"""
    <Popover close={@close} placement="under">
      <Sections class="gap-8 p-4">
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
    </Popover>
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
