defmodule MoonWeb.Pages.ExamplePages.CustomersPage do
  use MoonWeb, :live_view

  alias Moon.Assets.Icons.IconChartSegment
  alias Moon.Components.{Chip, Divider, Button, Heading}
  alias Moon.Autolayouts.{ButtonsList, TopToDown}

  alias MoonWeb.Pages.ExamplePages.Customers.{CustomersTable, CustomerPreview}
  alias MoonWeb.Pages.ExamplePages.Shared.Filters.{UsernameFilter, CountryFilter, SiteFilter}
  alias MoonWeb.Pages.ExamplePages.Shared.{TopMenu, LeftMenu, Breadcrumbs}
  alias MoonWeb.Pages.ExamplePages.Helpers
  alias MoonWeb.MockDB.{Users, Segments, Utils}

  data customers, :list
  data active_customer, :map, default: %{id: nil}

  # filters
  data username_filter_values, :list, default: []
  data country_filter_values, :list, default: []
  data site_filter_values, :list, default: []

  # table
  data sort_by, :tuple, default: {nil, nil}
  data page, :integer, default: 1

  def render(assigns) do
    ~F"""
    <div class={"#{@theme_name} #{@active_customer.id != nil && "h-screen overflow-hidden"}"}>
      <TopMenu id="top-menu" />
      <div class="flex">
        <LeftMenu id="left-menu" />
        <div class="w-full p-4">
          <Breadcrumbs breadcrumbs={[%{name: "Customers", to: "/lab-light/example-pages/customers"}]} />
          <Heading size={32} class="my-2">Customers</Heading>
          <TopToDown>
            <ButtonsList>
              <Chip left_icon="icon_zoom">Search</Chip>
              <Chip value="users" right_icon="icon_chevron_down_rounded">Past Month</Chip>

              <UsernameFilter active_values={@username_filter_values} />
              <CountryFilter active_values={@country_filter_values} />
              <SiteFilter active_values={@site_filter_values} />

              <Chip value="more filters" right_icon="icon_chevron_down_rounded">More Filters</Chip>
              <Button variant="danger" left_icon="chart_segment" on_click="save_segment">
                <IconChartSegment font_size="1.2rem" />Save Segment
              </Button>
              <Divider orientation="vertical" />
              <Button variant="danger" size="small" on_click="clear_all_filters">Clear All</Button>
            </ButtonsList>
            <CustomersTable
              id="customers_list"
              customers={@customers}
              page={@page}
              sort_by={@sort_by}
              active_customer_id={@active_customer.id}
            />
          </TopToDown>
        </div>
      </div>
    </div>
    {#if @active_customer.id != nil}
      <div
        :on-click="close_customer_preview"
        class="fixed inset-0 z-20"
      />
      <CustomerPreview
        id="customer-preview"
        customer={@active_customer}
        on_close="close_customer_preview"
      />
    {/if}
    """
  end

  #
  # Lifecycle methods
  #
  def mount(_params, _session, socket) do
    socket =
      socket
      |> assign(theme_name: "lab-light")
      |> assign(active_page: __MODULE__)
      |> filter_customers()

    {:ok, socket, layout: {MoonWeb.LayoutView, "clean.html"}}
  end

  def handle_params(params, _uri, socket) do
    get = &(Map.get(params, &1) || &2)

    {:noreply, socket
      |> assign(username_filter_values: get.("usernames", []))
      |> assign(country_filter_values: get.("countries", []))
      |> assign(sites_filter_values: get.("sites", []))
      |> assign(page: String.to_integer(get.("page", "1")))
      |> assign(sort_by: decode_sort_by(get.("sort_by_column", nil), get.("sort_by_order", nil)))
      |> filter_customers()}
  end

  #
  # Message Handler
  #
  def handle_info(msg, socket) do
    {refresh_list, socket} =
      case msg do
        {:filters, filter_event} ->
          case filter_event do
            {:apply_username_filter, values} ->
              {true, socket |> assign(username_filter_values: values) |> assign(page: 1)}

            {:apply_country_filter, values} ->
              {true, socket |> assign(country_filter_values: values) |> assign(page: 1)}

            {:apply_site_filter, values} ->
              {true, socket |> assign(site_filter_values: values) |> assign(page: 1)}

            _ ->
              {false, socket}
          end

        {:table, table_event} ->
          case table_event do
            {:paginate, page} ->
              {true, socket |> assign(page: page)}

            {:select, customer} ->
              {false, socket |> assign(active_customer: customer)}

            {:sort, sort_by} ->
              {true, socket |> assign(sort_by: sort_by) |> assign(page: 1)}

            _ ->
              {false, socket}
          end

        _ ->
          {false, socket}
      end

    {:noreply, (if refresh_list, do: redirect(socket), else: socket)}
  end

  #
  # Event Handlers
  #
  def handle_event("clear_all_filters", _, socket) do
    UsernameFilter.clear()
    CountryFilter.clear()
    SiteFilter.clear()

    {:noreply,
     socket
     |> assign(username_filter_values: [])
     |> assign(country_filter_values: [])
     |> assign(site_filter_values: [])
     |> assign(page: 1)
     |> filter_customers()}
  end

  def handle_event("save_segment", _, socket = %{assigns: assigns}) do
    params = %{
      "usernames" => assigns.username_filter_values,
      "countries" => assigns.country_filter_values,
      "sites" => assigns.site_filter_values,
      "page" => "#{assigns.page}",
      "sort_by_column" => assigns.sort_by |> elem(0),
      "sort_by_order" => assigns.sort_by |> elem(1) |> Atom.to_string()
    }

    Segments.save(%{
      name: "test_segment",
      params: params,
      type: :customers
    })

    {:noreply, socket}
  end

  def handle_event("close_customer_preview", _, socket) do
    {:noreply,
     socket
     |> assign(active_customer: %{id: nil})}
  end

  #
  # Helpers
  #
  defp decode_sort_by(nil, _), do: {nil, nil}

  defp decode_sort_by(_, nil), do: {nil, nil}

  defp decode_sort_by(nil, nil), do: {nil, nil}

  defp decode_sort_by(sort_by_column, sort_by_order) do
    {sort_by_column, sort_by_order |> String.to_atom()}
  end

  defp filter_customers(socket) do
    %{
      page: page,
      sort_by: sort,
      country_filter_values: country_filter_values,
      username_filter_values: username_filter_values,
      site_filter_values: site_filter_values
    } = socket.assigns

    customers =
      Users.list(%{
        filter: %{
          id: Enum.map(username_filter_values, &String.to_integer/1),
          site: site_filter_values,
          country: country_filter_values
        },
        sort: Helpers.tuple_to_map(sort)
      })
      |> Utils.take_page((page - 1) * 20, 20)

    socket
    |> assign(customers: customers)
    |> assign(active_customer: %{id: nil})
  end

  defp redirect(socket = %{assigns: assigns}) do
    params = %{
      "usernames" => assigns.username_filter_values,
      "countries" => assigns.country_filter_values,
      "sites" => assigns.site_filter_values,
      "page" => "#{assigns.page}",
      "sort_by_column" => assigns.sort_by |> elem(0),
      "sort_by_order" => assigns.sort_by |> elem(1) |> Atom.to_string()
    }

    socket |> push_patch(to: Routes.live_path(socket, __MODULE__, params))
  end
end
