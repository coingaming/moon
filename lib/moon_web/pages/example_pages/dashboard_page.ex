defmodule MoonWeb.Pages.ExamplePages.DashboardPage do
  use MoonWeb, :live_view

  alias Moon.Assets.Icons.IconMore
  alias Moon.Autolayouts.ButtonsList

  alias Moon.Components.Button
  alias Moon.Components.Datepicker
  alias Moon.Components.Divider
  alias Moon.Components.DropdownMenuButton
  alias Moon.Components.DropdownMenuItem
  alias Moon.Components.DropdownMenuItems
  alias Moon.Components.Heading
  alias Moon.Components.IconButton
  alias Moon.Components.Switcher

  alias MoonWeb.MockDB.Currencies
  alias MoonWeb.MockDB.Sites
  alias MoonWeb.Pages.ExamplePages.Components.BarChartWidget
  alias MoonWeb.Pages.ExamplePages.Shared
  alias Shared.Filters.ContentFilter
  alias Shared.TopMenu
  alias Shared.LeftMenu

  @colors ~w(
    krillin-100 frieza-100 roshi-100
    raditz-100 chi-chi-100 whis-100
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
        saved: true,
        edited: false,
        page_metrics: [],
        widgets: [],
        start_date: Timex.beginning_of_month(Timex.today()),
        end_date: Timex.end_of_month(Timex.today()),
        currency_filter: [],
        site_filter: [],
        all_currencies: [],
        all_sites: [],
        all_metrics: []
      )

    socket =
      if connected?(socket) do
        all_metrics = Enum.map(@metrics, &%{name: &1})

        assign(socket,
          all_metrics: prepare_filter_options(all_metrics),
          all_currencies: prepare_filter_options(Currencies.list_all()),
          all_sites: prepare_filter_options(Sites.list_all()),
          page_metrics:
            fetch_metrics_data([
              %{name: "Total deposits, EUR"},
              %{name: "Casino NGR, EUR"}
            ]),
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
      <TopMenu id="top-menu" class={if @edited, do: "opacity-30"} />

      <div class="flex">
        <LeftMenu id="left-menu" class={if @edited, do: "opacity-30"} />

        <div class="flex-grow py-6 overflow-x-hidden px-14">
          <div class="flex items-center mb-6">
            <Heading size={32} class="flex-grow">{@title}</Heading>

            <div class={"space-x-2", hidden: !@edited}>
              <Button
                on_click="toggle_edit_mode"
                class="p-3 leading-none rounded border-beerus-100"
              >
                Cancel
              </Button>
              <Button
                on_click="toggle_edit_mode"
                variant="primary"
                class="p-3 leading-none"
              >
                Save
              </Button>
            </div>

            <div class={"flex gap-x-4", hidden: @edited}>
              <IconButton icon_name="icon_notification" title="TODO: Notifications" />

              <DropdownMenuButton id="dashboard-menu-button">
                <IconMore />

                <:menu>
                  <DropdownMenuItems>
                    <DropdownMenuItem>
                      <div :on-click="toggle_edit_mode">Edit</div>
                    </DropdownMenuItem>
                    <DropdownMenuItem>Rearrange widget</DropdownMenuItem>
                    <DropdownMenuItem>Duplicate</DropdownMenuItem>
                    <DropdownMenuItem>Share</DropdownMenuItem>
                    <DropdownMenuItem>Delete</DropdownMenuItem>
                  </DropdownMenuItems>
                </:menu>
              </DropdownMenuButton>
            </div>
          </div>

          <div class={"flex flex-wrap items-center gap-y-4 gap-x-6", "opacity-30": @edited}>
            <Switcher
              items={@tabs}
              selected_item={@selected_tab}
              click="tab_click"
              class="h-10"
            />

            <Divider orientation="vertical" color="beerus-100" height="10" />

            <ButtonsList>
              <!-- TODO: Tweak styles -->
              <Datepicker
                id="filter_datepicker"
                start_date={@start_date}
                end_date={@end_date}
                start_date_field={:start_date}
                end_date_field={:end_date}
                button_class="font-semibold px-3 text-trunks-100 bg-gohan-100"
                on_date_change="update_filter_dates"
              />

              <ContentFilter
                id="currency_filter"
                filter_name="Currency"
                active_items={@currency_filter}
                all_items={@all_currencies}
              />

              <ContentFilter
                id="site_filter"
                filter_name="Brands"
                active_items={@site_filter}
                all_items={@all_sites}
              />

              {#unless @saved}
                <Button class="px-3 ml-1" variant="primary" on_click="save_dashboard">
                  Save
                </Button>

                <Button class="px-3" variant="primary" on_click="save_dashboard">
                  Save as new
                </Button>

                <Divider
                  class="mx-1"
                  orientation="vertical"
                  color="beerus-100"
                  height="10"
                />

                <Button
                  class="px-2 text-trunks-100 hover:text-bulma-100 hover:bg-goku-80"
                  on_click="clear_all_filters"
                >
                  Clear all
                </Button>
              {/unless}
            </ButtonsList>
          </div>

          <Divider color="beerus-100" class="my-6" />

          <!-- TODO: Create a shared component -->
          <div class="flex p-6 rounded bg-gohan-100">
            <div class="flex overflow-x-scroll no-scrollbar">
              {#for metric <- @page_metrics}
                <div class="flex-shrink-0 p-3 mr-4 border-r pl-7 border-beerus-100 w-50">
                  <p class="text-xs text-trunks-100">{metric.name}</p>
                  <div class="flex gap-x-0.5 items-start">
                    <div class="text-xl text-bulma-100">
                      {metric.amount}
                    </div>
                    <div class={
                      "text-sm",
                      "text-roshi-100": metric.change > 0,
                      "text-chi-chi-100": metric.change <= 0
                    }>
                      <span :if={metric.change > 0}>+</span>{metric.change}%
                    </div>
                  </div>
                </div>
              {/for}
            </div>

            <!-- div class="flex items-center justify-center flex-shrink-0 cursor-pointer gap-x-2 w-50">
              <div class="flex items-center justify-center w-6 h-6 rounded-sm bg-goku-80">
                <Icon name="icon_plus" />
              </div>
              <div class="text-sm whitespace-nowrap">Add metric</div>
            </div -->

            <div class="flex items-center justify-center w-50">
              <ContentFilter
                id="metric_filter"
                filter_name="Metric"
                left_icon="icon_plus"
                chip_class="font-normal"
                right_icon={nil}
                active_items={prepare_filter_options(@page_metrics)}
                all_items={@all_metrics}
              >
                <:label>Add metric</:label>
              </ContentFilter>
            </div>
          </div>

          <div class="grid grid-cols-1 mt-6 lg:grid-cols-2 gap-x-4 gap-y-6">
            {#for widget <- Enum.sort_by(@widgets, & &1.index)}
              <BarChartWidget
                widget={widget}
                edited={@edited}
                bar_bg_color={"bg-#{Enum.at(@colors, widget.index)}"}
                on_refresh="refresh_widget_data"
              />
            {/for}
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
        page_metrics: fetch_metrics_data(socket.assigns.page_metrics),
        widgets: get_widgets()
      )

    {:noreply, socket}
  end

  def handle_event("refresh_widget_data", %{"index" => index}, socket) do
    widgets = socket.assigns.widgets
    widget = Enum.find(widgets, &(&1.index == String.to_integer(index)))

    widgets =
      List.update_at(widgets, widget.index, fn item ->
        %{item | data: generate_widget_data()}
      end)

    {:noreply, assign(socket, widgets: widgets)}
  end

  def handle_event("save_dashboard", _, socket) do
    socket = assign(socket, saved: true)
    {:noreply, socket}
  end

  def handle_event("clear_all_filters", _, socket) do
    ContentFilter.clear("currency_filter")
    ContentFilter.clear("site_filter")

    socket =
      assign(socket,
        start_date: nil,
        end_date: nil,
        currency_filter: [],
        site_filter: [],
        page_metrics: fetch_metrics_data(socket.assigns.page_metrics),
        widgets: get_widgets(),
        saved: true
      )

    {:noreply, socket}
  end

  def handle_event("toggle_edit_mode", _, socket) do
    socket = assign(socket, edited: !socket.assigns.edited)
    {:noreply, socket}
  end

  def handle_info({"update_filter_dates", %{start_date: start_date, end_date: end_date}}, socket) do
    socket =
      assign(socket,
        start_date: start_date,
        end_date: end_date,
        page_metrics: fetch_metrics_data(socket.assigns.page_metrics),
        widgets: get_widgets(),
        saved: false
      )

    {:noreply, socket}
  end

  def handle_info({:apply_filter, {"Metric", items}}, socket) do
    page_metrics =
      items
      |> Enum.map(&%{name: &1.label})
      |> fetch_metrics_data()

    {:noreply, assign(socket, page_metrics: page_metrics)}
  end

  def handle_info({:apply_filter, {filter_name, items}}, socket) do
    socket =
      case filter_name do
        "Currency" ->
          assign(socket, currency_filter: items)

        "Brands" ->
          assign(socket, site_filter: items)
      end

    socket =
      assign(socket,
        page_metrics: fetch_metrics_data(socket.assigns.page_metrics),
        widgets: get_widgets(),
        saved: false
      )

    {:noreply, socket}
  end

  defp get_widgets() do
    @widget_names
    |> Enum.with_index()
    |> Enum.map(fn {name, index} ->
      %{
        index: index,
        title: name,
        data: generate_widget_data()
      }
    end)
  end

  defp generate_widget_data() do
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

  defp fetch_metrics_data(metrics) do
    Enum.map(metrics, fn metric ->
      Map.merge(metric, generate_metric_data())
    end)
  end

  defp generate_metric_data() do
    %{
      amount: Enum.random(1_000_000..21_000_000) + Enum.random(1..99) / 100,
      change: Enum.random(-20..20)
    }
  end

  defp prepare_filter_options(items) do
    Enum.map(items, &%{label: &1.name, value: &1.name})
  end
end
