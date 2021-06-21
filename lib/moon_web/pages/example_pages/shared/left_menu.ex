defmodule MoonWeb.Pages.ExamplePages.Shared.LeftMenu do
  use MoonWeb, :stateful_component

  alias Moon.Assets.Icon
  alias Moon.Autolayouts.Sections

  data segments, :any

  def mount(assigns) do
    {:ok, assign(assigns, segments: get_segments())}
  end

  def render(assigns) do
    ~F"""
    <Sections class="p-4">
      <div :for={segment <- @segments}>
        <div class="pb-4 pl-2 text-trunks-100">{segment.title} • {segment.count}</div>
        <div class="flex" :for={item <- segment.items}>
          <div class="p-2"><Icon name={item.icon} /></div>
          <div class="p-2">{item.title}</div>
        </div>
        <div class="pb-4 flex">
          <div><div class="bg-goku-80 rounded-sm p-2 pt-1 h-8 w-8 align-middle content-center"><Icon name="icon_plus" /></div></div>
          <div class="p-2">{segment.new_item}</div>
        </div>
      </div>
    </Sections>
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
