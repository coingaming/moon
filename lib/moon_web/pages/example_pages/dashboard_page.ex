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
  alias Moon.Components.Form
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

  @metrics_names [
    "Total deposits, EUR",
    "Total withdrawals, EUR",
    "Casino NGR, EUR",
    "Sports NGR, EUR",
    "Total NGR, EUR"
  ]

  # @widgets_names ~w(
  #   Depositors Winners Losers
  #   Wages Demographic Geo
  #   Currency Device\u00a0&\u00a0OS Products
  # )

  # dashboard content
  data page_title, :string
  data page_metrics, :list, default: []
  data page_widgets, :list, default: []
  data temp_page_widgets, :list, default: []
  data all_metrics, :list, default: []

  # tabs
  prop page_tabs, :list, default: []
  data selected_tab, :string

  # filters
  prop all_currencies, :list, default: []
  prop all_sites, :list, default: []
  data currency_filter_values, :list, default: []
  data site_filter_values, :list, default: []
  data date_filter_values, :map, default: %{}

  # page state
  data saved, :boolean, default: true
  data edited, :boolean, default: false

  def mount(params, _session, socket) do
    socket =
      assign(socket,
        theme_name: params["theme_name"] || "lab-light",
        active_page: __MODULE__,
        page_title: "Starter dashboard",
        page_tabs: ~w(Total Real Bonus),
        selected_tab: "Total",
        all_metrics: prepare_filter_options(@metrics_names),
        all_currencies: prepare_filter_options(Currencies.list_all()),
        all_sites: prepare_filter_options(Sites.list_all()),
        date_filter_values: %{
          start_date: Timex.beginning_of_month(Timex.today()),
          end_date: Timex.end_of_month(Timex.today())
        },
        page_metrics:
          fetch_metrics_data([
            %{name: "Total deposits, EUR"},
            %{name: "Casino NGR, EUR"}
          ]),
        page_widgets:
          fetch_widgets_data([
            %{name: "Depositors"},
            %{name: "Winners"},
            %{name: "Losers"}
          ])
      )

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
            <Heading size={32} class="flex-grow">{@page_title}</Heading>

            <div class={"space-x-2", hidden: !@edited}>
              <Button
                on_click="discard_page_changes"
                class="p-3 leading-none rounded border-beerus-100"
              >
                Cancel
              </Button>
              <Button
                on_click="save_page_changes"
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
                      <div :on-click="enter_edit_mode">Edit</div>
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
              items={@page_tabs}
              selected_item={@selected_tab}
              click="tab_click"
              class="h-10"
            />

            <Divider orientation="vertical" color="beerus-100" height="10" />

            <ButtonsList>
              <Form for={:date_filter_values} change="validate_filter_dates">
                <Datepicker
                  id="filter_datepicker"
                  start_date={@date_filter_values.start_date}
                  end_date={@date_filter_values.end_date}
                  start_date_field={:start_date}
                  end_date_field={:end_date}
                  with_time={false}
                  button_class="font-semibold px-3"
                  on_date_change="update_filter_dates"
                />
              </Form>

              <ContentFilter
                id="currency_filter"
                filter_name="Currency"
                active_items={@currency_filter_values}
                all_items={@all_currencies}
              />

              <ContentFilter
                id="site_filter"
                filter_name="Brands"
                active_items={@site_filter_values}
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
                  class="px-2 text-trunks-100 hover:text-bulma-100 hover:bg-goku-120"
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
            {#for widget <- Enum.sort_by(@page_widgets, & &1.index)}
              <BarChartWidget
                widget={widget}
                edited={@edited}
                bar_bg_color={"bg-#{widget.color}"}
                on_refresh="refresh_widget_data"
                on_remove="remove_widget"
              />
            {/for}
          </div>
        </div>
      </div>
    </div>
    """
  end

  def handle_event("tab_click", %{"selected-item" => selected_item}, socket) do
    socket =
      assign(socket,
        selected_tab: selected_item,
        page_metrics: fetch_metrics_data(socket.assigns.page_metrics),
        page_widgets: fetch_widgets_data(socket.assigns.page_widgets)
      )

    {:noreply, socket}
  end

  def handle_event("refresh_widget_data", %{"name" => name}, socket) do
    widgets = socket.assigns.page_widgets
    widget = Enum.find(widgets, &(&1.name == name))

    widgets =
      List.update_at(widgets, widget.index, fn item ->
        %{item | data: generate_widget_items()}
      end)

    {:noreply, assign(socket, page_widgets: widgets)}
  end

  def handle_event("remove_widget", %{"name" => name}, socket) do
    widgets = Enum.filter(socket.assigns.page_widgets, &(&1.name != name))
    {:noreply, assign(socket, page_widgets: widgets)}
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
        date_filter_values: %{start_date: nil, end_date: nil},
        currency_filter_values: [],
        site_filter_values: [],
        page_metrics: fetch_metrics_data(socket.assigns.page_metrics),
        page_widgets: fetch_widgets_data(socket.assigns.page_widgets),
        saved: true
      )

    {:noreply, socket}
  end

  def handle_event("enter_edit_mode", _, socket) do
    {:noreply,
     assign(socket,
       edited: true,
       temp_page_widgets: socket.assigns.page_widgets
     )}
  end

  # TODO: Save updated dashboard widgets info to repo
  def handle_event("save_page_changes", _, socket) do
    {:noreply, assign(socket, edited: false, temp_page_widgets: [])}
  end

  def handle_event("discard_page_changes", _, socket) do
    {:noreply,
     assign(socket,
       edited: false,
       page_widgets: socket.assigns.temp_page_widgets,
       temp_page_widgets: []
     )}
  end

  def handle_event(
        "validate_filter_dates",
        %{"date_filter_values" => %{"start_date" => start_date, "end_date" => end_date}},
        socket
      ) do
    {start_date, end_date} = Datepicker.validate(start_date, end_date)

    socket =
      assign(socket,
        date_filter_values: %{
          start_date: start_date,
          end_date: end_date
        }
      )

    {:noreply, socket}
  end

  def handle_info({"update_filter_dates", %{start_date: start_date, end_date: end_date}}, socket) do
    socket =
      assign(socket,
        date_filter_values: %{
          start_date: start_date,
          end_date: end_date
        },
        page_metrics: fetch_metrics_data(socket.assigns.page_metrics),
        page_widgets: fetch_widgets_data(socket.assigns.page_widgets),
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
          assign(socket, currency_filter_values: items)

        "Brands" ->
          assign(socket, site_filter_values: items)
      end

    socket =
      assign(socket,
        page_metrics: fetch_metrics_data(socket.assigns.page_metrics),
        page_widgets: fetch_widgets_data(socket.assigns.page_widgets),
        saved: false
      )

    {:noreply, socket}
  end

  defp generate_widget_items() do
    Enum.map(
      ~w(Charlibobby Hima0919 Fox14445 Latuim Killbgx),
      fn line ->
        %{
          name: line,
          amount: Enum.random(1_000..9_900) + Enum.random(1..99) / 100,
          change: Enum.random(-20..20)
        }
      end
    )
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

  defp fetch_widgets_data(widgets) do
    widgets
    |> Enum.with_index()
    |> Enum.map(fn {widget, index} ->
      Map.merge(widget, %{
        index: index,
        color: Enum.at(@colors, index),
        data: generate_widget_items()
      })
    end)
  end

  defp prepare_filter_options(items) do
    Enum.map(items, fn item ->
      name =
        case item do
          %{name: name} -> name
          name when is_binary(name) -> name
        end

      %{label: name, value: name}
    end)
  end
end
