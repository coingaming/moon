defmodule MoonWeb.Pages.ExamplePages.DashboardPage do
  use MoonWeb, :live_view

  alias Moon.Assets.Icons.IconMore
  alias Moon.Assets.Icons.IconNotification
  alias Moon.Assets.Icon
  alias Moon.Autolayouts.ButtonsList

  alias Moon.Components.Chip
  alias Moon.Components.Divider
  alias Moon.Components.Heading
  alias Moon.Components.MenuButton
  alias Moon.Components.Popover

  alias MoonWeb.Pages.ExamplePages.Shared
  alias MoonWeb.Pages.ExamplePages.Components.BarChartWidget
  alias Shared.TopMenu
  alias Shared.LeftMenu

  @colors ~w(krillin-100 frieza-100 roshi-100 raditz-100 chi_chi-100 whis-100)

  def mount(params, _session, socket) do
    socket =
      assign(socket,
        theme_name: params["theme_name"] || "lab-light",
        active_page: __MODULE__,
        title: "Starter dashboard",
        clicked_name: "",
        metrics: get_metrics(),
        widgets: get_widgets()
      )

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
                :if={@clicked_name == "timeframe"}
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
                :if={@clicked_name == "platform"}
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
                :if={@clicked_name == "brand"}
              >
                TODO
              </Popover>
            </Popover.Outer>

            <Divider orientation="vertical" color="beerus-100" />
          </ButtonsList>

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

          <div class="grid grid-cols-1 lg:grid-cols-2 mt-6 gap-x-4 gap-y-6">
            <BarChartWidget
              :for={widget <- Enum.sort_by(@widgets, & &1.index)}
              title={widget.title}
              lines={widget.data}
              bar_bg_color={"bg-#{get_random_color()}"}
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
    {:noreply, assign(socket, clicked_name: click_value)}
  end

  # TODO: Refactor
  def handle_event(
        "close_popover",
        _,
        socket
      ) do
    {:noreply, assign(socket, clicked_name: nil)}
  end

  defp get_metrics() do
    [
      %{
        name: "Total deposits, EUR",
        value: "23,787,750",
        change: 14
      },
      %{
        name: "Total withdrawals, EUR",
        value: "19,616,700",
        change: -4
      },
      %{
        name: "Casino NGR, EUR",
        value: "4,107,850.45",
        change: -1
      },
      %{
        name: "Sports NGR, EUR",
        value: "1,055,410.45",
        change: 2
      },
      %{
        name: "Total NGR, EUR",
        value: "5,163,258",
        change: 8
      }
    ]
  end

  defp get_widgets() do
    ~w(Depositors Winers Losers Wages Demographic Geo Currency Device\u00a0&\u00a0OS Products)
    |> Enum.with_index()
    |> Enum.map(fn {name, index} ->
      %{
        index: index,
        title: name,
        data: [
          %{
            name: "Charlibobby",
            value: Enum.random(2_000_000..6_500_000),
            change: Enum.random(-20..20)
          },
          %{
            name: "Hima0919",
            value: Enum.random(2_000_000..6_500_000),
            change: Enum.random(-20..20)
          },
          %{
            name: "Fox14445",
            value: Enum.random(2_000_000..6_500_000),
            change: Enum.random(-20..20)
          },
          %{
            name: "Latuim",
            value: Enum.random(2_000_000..6_500_000),
            change: Enum.random(-20..20)
          },
          %{
            name: "Killbgx",
            value: Enum.random(2_000_000..6_500_000),
            change: Enum.random(-20..20)
          }
        ]
      }
    end)
  end

  defp get_random_color() do
    Enum.random(@colors)
  end
end
