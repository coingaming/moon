defmodule MoonWeb.Pages.ExamplePages.DashboardPage do
  use MoonWeb, :live_view

  alias Moon.Assets.Icons.IconMore
  alias Moon.Autolayouts.ButtonsList
  alias Moon.Autolayouts.LeftToRight
  alias Moon.Autolayouts.TopToDown

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
  alias MoonWeb.Pages.ExamplePages.Components.LeaderboardWidget
  alias MoonWeb.Pages.ExamplePages.Shared
  alias Shared.Filters.ContentFilter
  alias Shared.TopMenu
  alias Shared.LeftMenu
  alias Shared.NewWidgetPanel

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

  @widget_categories_names ~w(
    Depositors Winners Losers
    Wages Demographic Geo
    Currency Device\u00a0&\u00a0OS Products
  )

  # dashboard content
  data page_title, :string
  data page_metrics, :list, default: []
  data page_widgets, :list, default: []
  data temp_page_widgets, :list, default: []
  data all_metrics, :list, default: []
  data widget_categories, :list, default: []

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
  data show_page_options, :boolean, default: false
  data show_new_widget_panel, :boolean, default: false

  def mount(params, _session, socket) do
    socket =
      assign(socket,
        theme_name: params["theme_name"] || "lab-light",
        active_page: __MODULE__,
        page_title: "Starter dashboard",
        page_tabs: ~w(Total Real Bonus),
        selected_tab: "Total",
        all_metrics: prepare_filter_options(@metrics_names),
        widget_categories: fetch_widget_categories(),
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
            %{name: "Depositors", kind: :leaderboard},
            %{name: "Winners", kind: :leaderboard},
            %{name: "Losers", kind: :leaderboard}
          ])
      )

    {:ok, socket, layout: {MoonWeb.LayoutView, "clean.html"}}
  end

  def render(assigns) do
    ~F"""
    <div class={"#{@theme_name}"}>
      <TopMenu id="top-menu" reduced_opacity={@edited} />

      <LeftToRight gap={0}>
        <LeftMenu id="left-menu" reduced_opacity={@edited} />
        <TopToDown class="flex-grow py-6 px-14" gap={6}>
          <LeftToRight gap={2}>
            <Heading size={32} class="flex-grow">{@page_title}</Heading>

            <Button
              on_click="discard_page_changes"
              class={"p-3 leading-none rounded border-beerus-100 #{hidden_class_if(!@edited)}"}
            >
              Cancel
            </Button>

            <Button
              on_click="save_page_changes"
              variant="primary"
              class={"p-3 leading-none #{hidden_class_if(!@edited)}"}
            >
              Save
            </Button>

            <IconButton
              icon_name="icon_notification"
              title="TODO: Notifications"
              class={hidden_class_if(@edited)}
            />

            <DropdownMenuButton
              class={"ml-2 #{hidden_class_if(@edited)}"}
              show={@show_page_options}
              on_toggle="toggle_page_options"
            >
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
          </LeftToRight>

          <LeftToRight gap={6} class={if @edited, do: "opacity-30", else: nil}>
            <Switcher
              items={@page_tabs}
              selected_item={@selected_tab}
              click="tab_click"
              class="h-10"
            />

            <Divider orientation="vertical" height="10" />

            <ButtonsList>
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
          </LeftToRight>

          <Divider />

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

          <div class="grid grid-cols-1 lg:grid-cols-2 gap-x-4 gap-y-6">
            {#for widget <- Enum.sort_by(@page_widgets, & &1.ordinal_number)}
              <LeaderboardWidget
                widget={widget}
                edited={@edited}
                bar_bg_color={"bg-#{widget.color}"}
                on_refresh="refresh_widget_data"
                on_remove="remove_widget"
              />
            {/for}

            <IconButton
              icon_name="icon_plus"
              title="Add a widget"
              height={8}
              width={8}
              class="bg-goku-120"
              text_color="text-piccolo-100"
              hover_bg_color="bg-trunks-100"
              click="open_new_widget_panel"
            />

            <NewWidgetPanel
              :if={@show_new_widget_panel}
              id="new-widget-panel"
              categories={@widget_categories}
            />
          </div>
        </TopToDown>
      </LeftToRight>
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

  def handle_event("refresh_widget_data", %{"ordinal_number" => ordinal_number}, socket) do
    widgets =
      List.update_at(
        socket.assigns.page_widgets,
        String.to_integer(ordinal_number) - 1,
        fn item ->
          %{item | data: generate_widget_items()}
        end
      )

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

  def handle_event("toggle_page_options", _, socket) do
    {:noreply, assign(socket, show_page_options: !socket.assigns.show_page_options)}
  end

  def handle_event("enter_edit_mode", _, socket) do
    {:noreply,
     assign(socket,
       edited: true,
       temp_page_widgets: socket.assigns.page_widgets,
       show_page_options: false
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

  def handle_event("open_new_widget_panel", _, socket) do
    {:noreply, assign(socket, show_new_widget_panel: true)}
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

  def handle_info({:new_widget_panel, :close}, socket) do
    {:noreply, assign(socket, show_new_widget_panel: false)}
  end

  def handle_info({:new_widget_panel, :add, {category_name, widget_kind}}, socket) do
    page_widgets = socket.assigns.page_widgets
    ordinal_number = length(page_widgets) + 1

    widget = %{
      name: category_name,
      kind: widget_kind,
      ordinal_number: ordinal_number,
      color: Enum.at(@colors, ordinal_number - 1),
      data: generate_widget_items()
    }

    {:noreply, assign(socket, page_widgets: page_widgets ++ [widget])}
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
    |> Enum.with_index(1)
    |> Enum.map(fn {widget, index} ->
      Map.merge(widget, %{
        ordinal_number: index,
        color: Enum.at(@colors, index - 1),
        data: generate_widget_items()
      })
    end)
  end

  defp fetch_widget_categories() do
    @widget_categories_names
    |> Enum.map(fn category_name ->
      %{
        name: category_name,
        widget_kinds: Enum.random([["Top"], ["Calendar", "Top"]])
      }
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

  defp hidden_class_if(true), do: "hidden"
  defp hidden_class_if(false), do: nil
end
