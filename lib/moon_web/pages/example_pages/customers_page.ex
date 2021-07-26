defmodule MoonWeb.Pages.ExamplePages.CustomersPage do
  use MoonWeb, :live_view

  alias MoonWeb.Pages.ExamplePages.Shared
  alias MoonWeb.Pages.ExamplePages.Shared.Filters.UsernameFilter
  alias MoonWeb.Pages.ExamplePages.Shared.Filters.CountryFilter
  alias MoonWeb.Pages.ExamplePages.Shared.Filters.SiteFilter
  alias MoonWeb.Pages.ExamplePages.Helpers

  alias Shared.TopMenu
  alias Shared.LeftMenu
  alias Shared.Breadcrumbs

  alias Moon.Components.Chip
  alias Moon.Components.Divider
  alias Moon.Components.Button
  alias Moon.Components.Heading
  alias Moon.Autolayouts.ButtonsList
  alias Moon.Autolayouts.TopToDown

  alias Moon.Assets.Icons.IconChartSegment

  alias MoonWeb.MockDB.Users
  alias MoonWeb.MockDB.Utils

  alias __MODULE__.{CustomersTable, CustomerPreview}

  data customers, :list
  data active_customer, :map, default: %{id: nil}
  data username_filter, :list, default: []
  data country_filter, :list, default: []
  data site_filter, :list, default: []
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

              <UsernameFilter active_items={@username_filter} />
              <CountryFilter active_items={@country_filter} />
              <SiteFilter active_items={@site_filter} />

              <Chip value="more filters" right_icon="icon_chevron_down_rounded">More Filters</Chip>
              <Button variant="danger" left_icon="chart_segment">
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
        {:filters, filter_event} ->
          case filter_event do
            {:apply_username_filter, items} ->
              {true, socket |> assign(username_filter: items) |> assign(page: 1)}

            {:apply_country_filter, items} ->
              {true, socket |> assign(country_filter: items) |> assign(page: 1)}

            {:apply_site_filter, items} ->
              {true, socket |> assign(site_filter: items) |> assign(page: 1)}
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
     |> assign(username_filter: [])
     |> assign(country_filter: [])
     |> assign(site_filter: [])
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
      country_filter: country_filter,
      username_filter: username_filter,
      site_filter: site_filter
    } = socket.assigns

    customers =
      Users.list(%{
        filter: %{
          id: Enum.map(username_filter, &(&1.value |> String.to_integer())),
          site: Enum.map(site_filter, & &1.value),
          country: Enum.map(country_filter, & &1.value)
        },
        sort: Helpers.tuple_to_map(sort)
      })
      |> Utils.take_page((page - 1) * 20, 20)

    socket
    |> assign(customers: customers)
    |> assign(active_customer: %{id: nil})
  end
end
