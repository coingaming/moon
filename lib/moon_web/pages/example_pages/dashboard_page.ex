defmodule MoonWeb.Pages.ExamplePages.DashboardPage do
  use MoonWeb, :live_view

  alias Moon.Assets.Icons.IconMore
  alias Moon.Assets.Icons.IconNotification
  alias Moon.Assets.Icon
  alias Moon.Autolayouts.ButtonsList

  alias Moon.Components.Card
  alias Moon.Components.Chip
  alias Moon.Components.Heading
  alias Moon.Components.MenuButton
  alias Moon.Components.Popover

  alias MoonWeb.Pages.ExamplePages.Shared
  alias Shared.TopMenu
  alias Shared.LeftMenu

  def mount(params, _session, socket) do
    socket =
      assign(socket,
        theme_name: params["theme_name"] || "lab-light",
        active_page: __MODULE__,
        title: "Starter dashboard",
        clicked_name: "",
        metrics: get_metrics()
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
          </ButtonsList>

          <!-- TODO: Replace with divider -->
          <hr class="my-6 border-beerus-100" />

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
                  "text-cell-100": metric.change > 0,
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

          <div class="grid grid-cols-2 mt-6 gap-x-4 gap-y-6">
            <Card title="Depositors">
              <:content>Bar Chart</:content>
            </Card>

            <Card title="Winers">
              <:content>Bar Chart</:content>
            </Card>
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
end
