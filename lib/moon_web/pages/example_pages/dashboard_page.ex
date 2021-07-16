defmodule MoonWeb.Pages.ExamplePages.DashboardPage do
  use MoonWeb, :live_view

  alias Moon.Assets.Icons.IconMore
  alias Moon.Assets.Icons.IconNotification
  alias Moon.Assets.Icon
  alias Moon.Autolayouts.ButtonsList

  alias Moon.Components.Button
  alias Moon.Components.Chip
  alias Moon.Components.Divider
  alias Moon.Components.Heading
  alias Moon.Components.MenuButton
  alias Moon.Components.Popover

  alias MoonWeb.Pages.ExamplePages.Shared
  alias MoonWeb.Pages.ExamplePages.Components.BarChartWidget
  alias MoonWeb.Pages.ExamplePages.Components.Switcher
  alias Shared.TopMenu
  alias Shared.LeftMenu

  @colors ~w(
    krillin-100 frieza-100 roshi-100
    raditz-100 chi_chi-100 whis-100
    cell-100 dodoria-100 nappa-100
  )

  @metrics [
    "Total deposits, EUR",
    "Total withdrawals, EUR",
    "Casino NGR, EUR",
    "Sports NGR, EUR",
    "Total NGR, EUR"
  ]

  @widget_names ~w(
    Depositors Winers Losers
    Wages Demographic Geo
    Currency Device\u00a0&\u00a0OS Products
  )

  data colors, :list, default: @colors
  data widget_names, :list, default: @widget_names

  def mount(params, _session, socket) do
    socket =
      assign(socket,
        theme_name: params["theme_name"] || "lab-light",
        active_page: __MODULE__,
        title: "Starter dashboard",
        clicked_filter_name: "",
        tabs: get_tabs(),
        selected_tab: "total",
        metrics: [],
        widgets: []
      )

    socket =
      if connected?(socket) do
        assign(socket,
          metrics: get_metrics(),
          widgets: get_widgets()
        )
      else
        socket
      end

    {:ok, socket, layout: {MoonWeb.LayoutView, "clean.html"}}
  end

  def render(assigns) do
    ~F"""
    <div class={"#{@theme_name}"}>
      <TopMenu id="top-menu" />

      <div class="flex">
        <LeftMenu id="left-menu" />

        <div class="flex-grow py-6 overflow-x-hidden px-14">
          <div class="flex items-center mb-6 gap-x-4">
            <Heading size={32} class="flex-grow">{@title}</Heading>

            <MenuButton>
              <IconNotification />
            </MenuButton>

            <MenuButton>
              <IconMore />
            </MenuButton>
          </div>

          <div class="flex flex-wrap gap-x-6">
            <!-- TODO: Replace with Tabs component -->
            <Switcher items={@tabs} selected_item={@selected_tab} click="tab_click" />

            <ButtonsList>
              <Popover.Outer>
                <Chip
                  on_click="open_popover"
                  value="timeframe"
                  right_icon="icon_chevron_down_rounded"
                  class="px-3 text-trunks-100"
                >
                  This month
                </Chip>
                <Popover
                  close="close_popover"
                  placement="under"
                  :if={@clicked_filter_name == "timeframe"}
                >
                  TODO
                </Popover>
              </Popover.Outer>

              <Popover.Outer>
                <Chip
                  on_click="open_popover"
                  value="platform"
                  right_icon="icon_chevron_down_rounded"
                  class="px-3 text-trunks-100"
                >
                  Platform · All
                </Chip>
                <Popover
                  close="close_popover"
                  placement="under"
                  :if={@clicked_filter_name == "platform"}
                >
                  TODO
                </Popover>
              </Popover.Outer>

              <Popover.Outer>
                <Chip
                  on_click="open_popover"
                  value="brand"
                  right_icon="icon_chevron_down_rounded"
                  class="px-3 text-trunks-100"
                >
                  Brand · 2
                </Chip>
                <Popover
                  close="close_popover"
                  placement="under"
                  :if={@clicked_filter_name == "brand"}
                >
                  TODO
                </Popover>
              </Popover.Outer>

              <Divider orientation="vertical" color="beerus-100" />

              <Button class="px-2 text-trunks-100">
                Clear all
              </Button>
            </ButtonsList>
          </div>

          <Divider color="beerus-100" class="my-6" />

          <!-- TODO: Create a shared component -->
          <div class="flex p-6 overflow-x-scroll rounded bg-gohan-100 gap-x-4 no-scrollbar">
            <div :for={metric <- @metrics} class="flex-shrink-0 p-3 border-r pl-7 border-beerus-100 w-50">
              <p class="text-xs text-trunks-100">{metric.name}</p>
              <div class="flex gap-x-0.5 items-start">
                <div class="text-xl text-bulma-100">
                  {metric.value}
                </div>
                <div class={
                  "text-sm",
                  "text-roshi-100": metric.change > 0,
                  "text-chi_chi-100": metric.change <= 0
                }>
                  <span :if={metric.change > 0}>+</span>{metric.change}%
                </div>
              </div>
            </div>

            <div class="flex items-center justify-center flex-shrink-0 cursor-pointer gap-x-2 w-50">
              <div class="flex items-center justify-center w-6 h-6 rounded-sm bg-goku-80">
                <Icon name="icon_plus" />
              </div>
              <div class="text-sm whitespace-nowrap">Add metric</div>
            </div>
          </div>

          <div class="grid grid-cols-1 mt-6 lg:grid-cols-2 gap-x-4 gap-y-6">
            <BarChartWidget
              :for.with_index={{widget, index} <- Enum.sort_by(@widgets, & &1.index)}
              title={widget.title}
              lines={widget.data}
              bar_bg_color={"bg-#{Enum.at(@colors, index)}"}
            />
          </div>
        </div>
      </div>
    </div>
    """
  end

  # TODO: Refactor
  def handle_event(
        "open_popover",
        %{"click_value" => click_value},
        socket
      ) do
    {:noreply, assign(socket, clicked_filter_name: click_value)}
  end

  # TODO: Refactor
  def handle_event(
        "close_popover",
        _,
        socket
      ) do
    {:noreply, assign(socket, clicked_filter_name: nil)}
  end

  def handle_event("tab_click", %{"selected-item" => selected_item}, socket) do
    socket =
      assign(socket,
        selected_tab: selected_item,
        metrics: get_metrics(),
        widgets: get_widgets()
      )

    {:noreply, socket}
  end

  defp get_metrics() do
    @metrics
    |> Enum.map(fn name ->
      %{
        name: name,
        value: Enum.random(1_000_000..21_000_000) + Enum.random(1..99) / 100,
        change: Enum.random(-20..20)
      }
    end)
  end

  defp get_widgets() do
    @widget_names
    |> Enum.with_index()
    |> Enum.map(fn {name, index} ->
      %{
        index: index,
        title: name,
        data:
          Enum.map(
            ~w(Charlibobby Hima0919 Fox14445 Latuim Killbgx),
            fn line ->
              %{
                name: line,
                value: Enum.random(1_000..9_900) + Enum.random(1..99) / 100,
                change: Enum.random(-20..20)
              }
            end
          )
      }
    end)
  end

  defp get_tabs() do
    [
      %{
        name: "Total",
        value: "total"
      },
      %{
        name: "Real",
        value: "real"
      },
      %{
        name: "Bonus",
        value: "bonus"
      }
    ]
  end
end
