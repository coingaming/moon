defmodule MoonWeb.Pages.ExamplePages.Shared.LeftMenu do
  use MoonWeb, :stateful_component

  alias Moon.Assets.Icon
  alias Moon.Autolayouts.Sections
  alias Moon.Components.Divider

  prop class, :string
  data segments, :any, default: []

  def mount(assigns) do
    {:ok, assign(assigns, segments: get_segments())}
  end

  def render(assigns) do
    ~F"""
    <Sections class={"py-6 text-sm w-60 #{@class}"}>
      <div :for={segment <- @segments}>
        <div class="px-4 py-2 mx-2 mb-2 text-trunks-100">
          {segment.title} • {segment.count}
        </div>

        <div class="space-y-0.5 m-2">
          <div class="flex items-center mx-2 rounded cursor-pointer hover:bg-goku-120" :for={item <- segment.items}>
            <div class="flex items-center justify-center w-6 h-6 m-2">
              <Icon name={item.icon} class="text-trunks-100" />
            </div>
            <div class="">{item.title}</div>
          </div>
        </div>

        <div class="m-2 mb-0" :if={segment.new_item}>
          <div class="flex items-center mx-2 cursor-pointer rounded hover:bg-goku-120">
            <div class="flex items-center justify-center w-6 h-6 m-2 rounded-sm border border-beerus-100">
              <Icon name="icon_plus" />
            </div>
            <div class="">{segment.new_item}</div>
          </div>

          <Divider color="beerus-100" class="m-4 mb-0" />
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
        new_item: nil,
        items: [
          %{icon: :icon_user, title: "King Kong"},
          %{icon: :icon_user, title: "God Zilla"}
        ]
      }
    ]
  end
end
