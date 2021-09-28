defmodule MoonWeb.Pages.ExamplePages.Shared.LeftMenu do
  use MoonWeb, :stateful_component

  alias Moon.Assets.Icon
  alias Moon.Autolayouts.Sections
  alias Moon.Components.Divider
  alias MoonWeb.MockDB.{Segments, Utils}
  alias Surface.Components.LiveRedirect

  prop class, :string
  prop reduced_opacity, :boolean, default: false

  data segments, :any, default: []

  def mount(assigns) do
    {:ok, assign(assigns, segments: get_segments())}
  end

  def render(assigns) do
    ~F"""
    <Sections class={"py-6 text-sm w-60 #{@class} #{opacity_class(@reduced_opacity)}"}>
      <div :for={segment <- @segments}>
        <div class="px-4 py-2 mx-2 mb-2 text-trunks-100">
          {segment.title} • {segment.count}
        </div>

        <div class="space-y-0.5 m-2">
          {#for item <- segment.items}
            {#if segment.title == "Segments"}
              <LiveRedirect :if={item.type == :customers} to={"/example-pages/customers?segment_id=#{item.id}"}>
                <div class="flex items-center px-2 cursor-pointer">
                  <div class="flex items-center justify-center w-6 h-6 m-2">
                    <Icon name={:icon_user} class="text-trunks-100" />
                  </div>
                  <div class="">{item.name}</div>
                </div>
              </LiveRedirect>

              <LiveRedirect
                :if={item.type == :affiliates}
                to={"/example-pages/affiliates?segment_id=#{item.id}"}
              >
                <div class="flex items-center px-2 cursor-pointer">
                  <div class="flex items-center justify-center w-6 h-6 m-2">
                    <Icon name={:icon_expand} class="text-trunks-100" />
                  </div>
                  <div class="">{item.name}</div>
                </div>
              </LiveRedirect>
            {#else}
              <div class="flex items-center px-2 cursor-pointer">
                <div class="flex items-center justify-center w-6 h-6 m-2">
                  <Icon name={item.icon} class="text-trunks-100" />
                </div>
                <div class="">{item.title}</div>
              </div>
            {/if}
          {/for}
        </div>

        <div class="m-2 mb-0" :if={segment.new_item}>
          <div class="flex items-center px-2 cursor-pointer">
            <div class="flex items-center justify-center w-6 h-6 m-2 rounded-sm bg-goku-80">
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

  def get_segments do
    segments =
      Segments.list_all()
      |> Utils.take_page(0, 6)

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
        count: length(segments),
        new_item: "New segment",
        items: segments
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

  defp opacity_class(true), do: "opacity-30"
  defp opacity_class(false), do: nil
end
