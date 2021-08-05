defmodule MoonWeb.Pages.ExamplePages.Shared.LeftMenu do
  use MoonWeb, :stateless_component

  alias Surface.Components.LiveRedirect

  alias Moon.Assets.Icon
  alias Moon.Autolayouts.Sections
  alias Moon.Components.Divider

  alias MoonWeb.MockDB.{Users, Segments, Utils}

  def render(assigns) do
    segments = get_segments()

    ~F"""
    <Sections class="py-6 text-sm w-60">
      <div :for={segment <- segments}>
        {#if segment.title == "Segments"}
          <div class="px-4 py-2 mx-2 mb-2 text-trunks-100">
            {segment.title} • {segment.count}
          </div>

          <div class="space-y-0.5 m-2">
            {#for item <- segment.items}
              <LiveRedirect :if={item.type == :customers} to={"/example-pages/customers?segment_id=#{item.id}"}>
                <div class="flex items-center px-2 cursor-pointer">
                  <div class="flex items-center justify-center w-6 h-6 m-2">
                    <Icon name={:icon_user} class="text-trunks-100" />
                  </div>
                  <div class="">{item.name}</div>
                </div>
              </LiveRedirect>

              <LiveRedirect :if={item.type == :affiliates} to={"/example-pages/affiliates?segment_id=#{item.id}"}>
                <div class="flex items-center px-2 cursor-pointer">
                  <div class="flex items-center justify-center w-6 h-6 m-2">
                    <Icon name={:icon_expand} class="text-trunks-100" />
                  </div>
                  <div class="">{item.name}</div>
                </div>
              </LiveRedirect>
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

        {#else}
          <div class="px-4 py-2 mx-2 mb-2 text-trunks-100">
            {segment.title} • {segment.count}
          </div>

          <div class="space-y-0.5 m-2">
            <div class="flex items-center px-2 cursor-pointer" :for={item <- segment.items}>
              <div class="flex items-center justify-center w-6 h-6 m-2">
                <Icon name={item.icon} class="text-trunks-100" />
              </div>
              <div class="">{item.title}</div>
            </div>
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
        {/if}
      </div>
    </Sections>
    """
  end

  def get_segments() do
    segments = Segments.list_all()
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
end
