defmodule MoonWeb.Pages.ExamplePages.CustomersPage do
  use MoonWeb, :live_view

  alias MoonWeb.Pages.ExamplePages.Shared
  alias MoonWeb.Pages.ExamplePages.Shared.Filters.UsernameFilter
  alias MoonWeb.Pages.ExamplePages.Shared.Filters.CountryFilter
  alias MoonWeb.Pages.ExamplePages.Shared.Filters.SiteFilter
  alias MoonWeb.Pages.ExamplePages.Shared.ListPagination

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

  alias __MODULE__.{CustomersList, CustomerPreview}

  data customers, :list
  data active_customer, :map, default: %{id: nil}
  data username_filter, :list, default: []
  data country_filter, :list, default: []
  data site_filter, :list, default: []
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

              <UsernameFilter id="username_filter" active_items={@username_filter} />
              <CountryFilter id="country_filter" active_items={@country_filter} />
              <SiteFilter id="site_filter" active_items={@site_filter} />

              <Chip value="more filters" right_icon="icon_chevron_down_rounded">More Filters</Chip>
              <Button variant="danger" left_icon="chart_segment">
                <IconChartSegment font_size="1.2rem" />Save Segment
              </Button>
              <Divider orientation="vertical" />
              <Button variant="danger" size="small" on_click="clear_all_filters">Clear All</Button>
            </ButtonsList>

            <ListPagination
              {=@page}
              page_count={20}
              total_count={10056}
              on_prev_page="goto_prev_page"
              on_next_page="goto_next_page"
            />

            <CustomersList
              id="customers_list"
              customers={@customers}
              active_customer_id={@active_customer.id}
            />
          </TopToDown>
        </div>
      </div>
    </div>

    {#if @active_customer.id != nil}
      <div
        :on-click="close_customer_preview"
        class="fixed top-0 left-0 right-0 bottom-0 z-20"
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
    socket = socket
      |> assign(theme_name: params["theme_name"] || "sportsbet-dark")
      |> assign(active_page: __MODULE__)
      |> filter_customers()

    [customer | _] = socket.assigns.customers
    socket = socket
      |> assign(active_customer: customer)

    {:ok, socket, layout: {MoonWeb.LayoutView, "clean.html"}}
  end

  def handle_info({:apply_filter, filter}, socket) do
    socket = case filter do
      {:username, items} -> socket |> assign(username_filter: items)
      {:country, items}  -> socket |> assign(country_filter: items)
      {:site, items}     -> socket |> assign(site_filter: items)
      _                  -> socket
    end

    {:noreply, socket
      |> assign(page: 1)
      |> filter_customers()
    }
  end

  def handle_info({:select_customer, customer}, socket) do
    {:noreply, socket |> assign(active_customer: customer)}
  end

  #
  # Event Handlers
  #
  def handle_event("clear_all_filters", _, socket) do
    UsernameFilter.clear()
    CountryFilter.clear()
    SiteFilter.clear()

    {:noreply, socket
      |> assign(username_filter: [])
      |> assign(country_filter: [])
      |> assign(site_filter: [])
      |> assign(page: 1)
      |> filter_customers()
    }
  end

  def handle_event("close_customer_preview", _, socket) do
    {:noreply, socket
      |> assign(active_customer: %{id: nil})
    }
  end

  def handle_event("goto_prev_page", _, socket = %{assigns: %{page: page}}) do
    {:noreply, socket
      |> assign(page: (if page > 1, do: page - 1, else: page))
      |> filter_customers()
    }
  end

  def handle_event("goto_next_page", _, socket = %{assigns: %{page: page}}) do
    {:noreply, socket
      |> assign(page: page + 1)
      |> filter_customers()
    }
  end

  #
  # Helpers
  #
  defp filter_customers(socket) do
    %{
      page: page,
      country_filter: country_filter,
      username_filter: username_filter,
      site_filter: site_filter
    } = socket.assigns

    customers =
      Users.list(%{
        filter: %{
          id: Enum.map(username_filter, &(&1.value |> String.to_integer())),
          site: Enum.map(site_filter, &(&1.value)),
          country: Enum.map(country_filter, &(&1.value))
        }
      })
      |> Utils.take_page((page - 1) * 20, 20)

    socket
      |> assign(customers: customers)
      |> assign(active_customer: %{ id: nil })
  end
end
