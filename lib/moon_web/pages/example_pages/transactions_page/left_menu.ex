defmodule MoonWeb.Pages.ExamplePages.TransactionsPage.LeftMenu do
  use MoonWeb, :stateful_component

  alias Moon.Assets.Icon

  data segments, :any

  def mount(assigns) do
    {:ok, assign(assigns, segments: get_segments())}
  end

  def render(assigns) do
    ~H"""
    <div class="pt-4">
      <div class="p-4" :for={{ segment <- @segments }}>
        <div class="pb-4 pl-2 text-trunks-100">{{ segment.title }} • {{ segment.count }}</div>
        <div class="pb-4" :for={{ item <- segment.items }}>
          <div class="p-2 inline-block"><Icon name={{ item.icon }} /></div>
          <div class="inline-block">{{ item.title }}</div>
        </div>
        <div class="pb-4">
          <div class="bg-gohan-100 p-2 inline-block"><Icon name="icon_plus" /></div>
          <div class="inline-block">{{ segment.new_item }}</div>
        </div>
      </div>
    </div>
    """
  end

  def get_segments() do
    [
      %{
        title: "Dashboards",
        count: 5,
        new_item: "New dashboard",
        items: [
          %{icon: :icon_chart_area, title: "Starter dashboard"},
          %{icon: :icon_chart_area, title: "New users"},
          %{icon: :icon_chart_area, title: "Wagers"},
          %{icon: :icon_chart_area, title: "Custom metrics"},
          %{icon: :icon_chart_area, title: "Untitled dashboard"}
        ]
      },
      %{
        title: "Segments",
        count: 5,
        new_item: "New segment",
        items: [
          %{icon: :icon_expand, title: "Yggdrasil games"},
          %{icon: :icon_expand, title: "Rage clicked recently"},
          %{icon: :icon_user, title: "New last week"},
          %{icon: :icon_user, title: "Players report"},
          %{icon: :icon_expand, title: "May bet count"}
        ]
      },
      %{
        title: "Following",
        count: 2,
        new_item: "Add followed",
        items: [
          %{icon: :icon_user, title: "King Kong"},
          %{icon: :icon_user, title: "God Zilla"}
        ]
      }
    ]
  end
end
