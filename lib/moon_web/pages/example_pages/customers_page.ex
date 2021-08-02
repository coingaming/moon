defmodule MoonWeb.Pages.ExamplePages.CustomersPage do
  use MoonWeb, :live_view

  alias Moon.Assets.Icons.IconChartSegment
  alias Moon.Components.{Chip, Divider, Button, Heading}
  alias Moon.ComponentsV2.Table
  alias Moon.Autolayouts.{ButtonsList, TopToDown}

  alias MoonWeb.Pages.ExamplePages.Customers.CustomerPreview
  alias MoonWeb.Pages.ExamplePages.Shared.Filters.{UsernameFilter, CountryFilter, SiteFilter}
  alias MoonWeb.Pages.ExamplePages.Shared.{TopMenu, LeftMenu, Breadcrumbs}
  alias MoonWeb.Pages.ExamplePages.Helpers
  alias MoonWeb.MockDB.{Users, Utils}

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
              <Button variant="danger" left_icon="chart_segment">
                <IconChartSegment font_size="1.2rem" />Save Segment
              </Button>
              <Divider orientation="vertical" />
              <Button variant="danger" size="small" on_click="clear_all_filters">Clear All</Button>
            </ButtonsList>
            <Table
              id="customers_table"
              columns={[
                %{label: "Customer", field: :username, sortable: true},
                %{label: "Profile ID", field: :id, sortable: true},
                %{label: "Email", field: :email},
                %{label: "Country", field: :country},
                %{label: "Brand", field: :site, type: :brand},
                %{label: "Signup time", field: :signup_at, type: :date}
              ]}
              items={@customers}
              active_item_id={@active_customer.id}
              sort_by={@sort_by}
              page={@page}
              page_count={20}
              total_count={10056}
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

  def mount(params, _session, socket) do
    socket =
      socket
      |> assign(theme_name: params["theme_name"] || "sportsbet-dark")
      |> assign(active_page: __MODULE__)
      |> filter_customers()

    {:ok, socket, layout: {MoonWeb.LayoutView, "clean.html"}}
  end

  def handle_info(msg, socket) do
    {refresh_list, socket} =
      case msg do
        {:filter, filter_event} ->
          case filter_event do
            {:username_filter, :apply, values} ->
              {true, socket |> assign(username_filter_values: values) |> assign(page: 1)}

            {:country_filter, :apply, values} ->
              {true, socket |> assign(country_filter_values: values) |> assign(page: 1)}

            {:site_filter, :apply, values} ->
              {true, socket |> assign(site_filter_values: values) |> assign(page: 1)}

            _ ->
              {false, socket}
          end

        {:table, table_event} ->
          case table_event do
            {:customers_table, :paginate, page} ->
              {true, socket |> assign(page: page)}

            {:customers_table, :select, customer} ->
              {false, socket |> assign(active_customer: customer)}

            {:customers_table, :sort, sort_by} ->
              {true, socket |> assign(sort_by: sort_by) |> assign(page: 1)}

            _ ->
              {false, socket}
          end

        _ ->
          {false, socket}
      end

    if refresh_list do
      {:noreply, socket |> filter_customers()}
    else
      {:noreply, socket}
    end
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

  def handle_event("close_customer_preview", _, socket) do
    {:noreply,
     socket
     |> assign(active_customer: %{id: nil})}
  end

  #
  # Helpers
  #
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
end
