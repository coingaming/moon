defmodule MoonWeb.Pages.ExamplePages.CustomersPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias Moon.Assets.Icons.IconChartSegment
  alias Moon.Autolayouts.{ButtonsList, TopToDown}
  alias Moon.BackofficeComponents.Table
  alias Moon.Components.{Button, Chip, Divider, Heading}
  alias Moon.Components.{Button, Form}
  alias Moon.Components.Deprecated.TextInput
  alias MoonWeb.Components.Breadcrumbs
  alias MoonWeb.MockDB.{Segments, Users, Utils}
  alias MoonWeb.Pages.ExamplePages.Customers.CustomerPreview
  alias MoonWeb.Pages.ExamplePages.Helpers
  alias MoonWeb.Pages.ExamplePages.Shared.{LeftMenu, TopMenu}
  alias MoonWeb.Pages.ExamplePages.Shared.Filters.{CountryFilter, SiteFilter, UsernameFilter}

  data(customers, :list)
  data(active_customer, :map, default: %{id: nil})

  # filters
  data(username_filter_values, :list, default: [])
  data(country_filter_values, :list, default: [])
  data(site_filter_values, :list, default: [])

  # table
  data(sort_by, :tuple, default: {nil, nil})
  data(page, :integer, default: 1)

  # segment
  data(segment_id, :string, default: nil)
  data(segment_title, :string, default: nil)

  # ephimeral state
  data(save_segment_form, :map, default: nil)

  def render(assigns) do
    ~F"""
    <div class={"#{@theme_name} #{@active_customer.id != nil && "h-screen overflow-hidden"}"}>
      <TopMenu id="top-menu" />
      <div class="flex">
        <LeftMenu id="left-menu" />
        <div class="pl-4 pt-4" style="width: calc(100vw - 260px)">
          <Breadcrumbs
            theme_name={@theme_name}
            breadcrumbs={[%{name: "Customers", to: "/lab-light/example-pages/customers"}]}
          />

          {#if @save_segment_form == nil}
            <Heading size={32} class="my-2">{@segment_title || "Customers"}</Heading>
          {#else}
            <Form
              class="w-full flex items-center mb-2"
              for={:segment}
              change="save_segment_form_update"
              submit="save_segment_form_submit"
              autocomplete="off"
            >
              <div class="flex-1">
                <TextInput
                  field={:title}
                  value={@save_segment_form.title}
                  class="w-full bg-goku-80 h-10 text-moon-32 font-semibold"
                />
              </div>
              <Button
                variant="danger"
                class="mt-2 flex-none rounded border-bulma-100 mx-2"
                on_click="save_segment_form_cancel"
              >
                Cancel
              </Button>
              <Button type="submit" variant="primary" class="mt-2 flex-none rounded">
                <span class="px-2">Save</span>
              </Button>
            </Form>
          {/if}

          <TopToDown>
            <ButtonsList>
              <Chip left_icon="icon_zoom">Search</Chip>
              <Chip value="users" right_icon="icon_chevron_down_rounded">Past Month</Chip>

              <UsernameFilter active_values={@username_filter_values} />
              <CountryFilter active_values={@country_filter_values} />
              <SiteFilter active_values={@site_filter_values} />

              <Chip value="more filters" right_icon="icon_chevron_down_rounded">More Filters</Chip>

              {#if @segment_id == nil}
                <Button variant="danger" on_click="save_segment_form_init">
                  <IconChartSegment font_size="1.2rem" />Save Segment
                </Button>
              {/if}

              <Divider orientation="vertical" />
              <Button variant="danger" on_click="clear_all_filters">Clear All</Button>
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
      <div :on-click="close_customer_preview" class="fixed inset-0 z-20" />
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

    {:ok, socket, layout: {MoonWeb.LayoutView, :clean}}
  end

  def handle_params(params = %{"segment_id" => segment_id}, _uri, socket) do
    %{name: name, params: params_saved} = Segments.get_by_id(segment_id |> String.to_integer())

    {:noreply,
     socket
     |> assign(segment_id: segment_id)
     |> assign(segment_title: name)
     |> load_params(Map.merge(params_saved, params, fn _, _, y -> y end))
     |> filter_customers()}
  end

  def handle_params(params, _uri, socket) do
    {:noreply,
     socket
     |> load_params(params)
     |> filter_customers()}
  end

  #
  # Message Handler
  #
  def handle_info(msg, socket) do
    new_route = fn socket ->
      route = Routes.live_path(socket, __MODULE__, get_params(socket))

      {:noreply,
       socket
       |> assign(segment_id: nil)
       |> assign(segment_title: nil)
       |> push_patch(to: route)}
    end

    case msg do
      {:filter, filter_event} ->
        filter_event_route(filter_event, socket, new_route)

      {:table, table_event} ->
        table_event_route(table_event, socket, new_route)

      _ ->
        {:noreply, socket}
    end
  end

  defp filter_event_route(filter_event, socket, new_route) do
    case filter_event do
      {"username_filter", :apply, values} ->
        socket = socket |> assign(username_filter_values: values, page: 1)
        new_route.(socket)

      {"country_filter", :apply, values} ->
        socket = socket |> assign(country_filter_values: values, page: 1)
        new_route.(socket)

      {"site_filter", :apply, values} ->
        socket = socket |> assign(site_filter_values: values, page: 1)
        new_route.(socket)

      _ ->
        {:noreply, socket}
    end
  end

  defp table_event_route(table_event, socket, new_route) do
    new_segment_route = fn socket ->
      route = Routes.live_path(socket, __MODULE__, get_segment_params(socket))
      {:noreply, socket |> push_patch(to: route)}
    end

    is_segment = socket.assigns.segment_id != nil

    no_redirect = fn socket ->
      {:noreply, socket}
    end

    case table_event do
      {"customers_table", :paginate, page} ->
        socket = socket |> assign(page: page)
        if is_segment, do: new_segment_route.(socket), else: new_route.(socket)

      {"customers_table", :select, customer} ->
        socket = socket |> assign(active_customer: customer)
        no_redirect.(socket)

      {"customers_table", :sort, sort_by} ->
        socket = socket |> assign(sort_by: sort_by, page: 1)
        if is_segment, do: new_segment_route.(socket), else: new_route.(socket)

      _ ->
        no_redirect.(socket)
    end
  end

  #
  # Event Handlers
  #
  def handle_event("save_segment_form_init", _, socket) do
    {:noreply, socket |> assign(:save_segment_form, %{title: "Customers"})}
  end

  def handle_event("save_segment_form_update", value, socket) do
    %{"segment" => %{"title" => title}} = value
    {:noreply, socket |> assign(:save_segment_form, %{title: title})}
  end

  def handle_event("save_segment_form_cancel", _, socket) do
    {:noreply, socket |> assign(:save_segment_form, nil)}
  end

  def handle_event("save_segment_form_submit", _, socket) do
    %{id: id} =
      Segments.save(%{
        name: socket.assigns.save_segment_form.title,
        type: :customers,
        params: get_params(socket) |> Map.delete("page")
      })

    socket =
      socket
      |> assign(save_segment_form: nil)
      |> push_patch(
        replace: true,
        to: Routes.live_path(socket, __MODULE__, %{"segment_id" => id})
      )

    {:noreply, socket}
  end

  def handle_event("clear_all_filters", _, socket) do
    socket =
      socket
      |> assign(username_filter_values: [])
      |> assign(country_filter_values: [])
      |> assign(site_filter_values: [])
      |> assign(page: 1)
      |> assign(segment_id: nil)
      |> assign(segment_title: nil)

    {:noreply, push_patch(socket, to: Routes.live_path(socket, __MODULE__, get_params(socket)))}
  end

  def handle_event("close_customer_preview", _, socket) do
    {:noreply, socket |> assign(active_customer: %{id: nil})}
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

  defp load_params(socket = %{assigns: assigns}, params) do
    get = &(Map.get(params, &1) || &2)

    socket
    |> assign(username_filter_values: get.("users", assigns.username_filter_values))
    |> assign(country_filter_values: get.("countries", assigns.country_filter_values))
    |> assign(site_filter_values: get.("sites", assigns.site_filter_values))
    |> assign(page: get.("page", "1") |> String.to_integer())
    |> assign(sort_by: get.("sort_by", nil) |> Helpers.decode_sort_by())
  end

  defp get_params(%{assigns: assigns}) do
    %{
      "users" => assigns.username_filter_values,
      "countries" => assigns.country_filter_values,
      "sites" => assigns.site_filter_values,
      "page" => "#{assigns.page}",
      "sort_by" => assigns.sort_by |> Helpers.encode_sort_by()
    }
  end

  defp get_segment_params(%{assigns: assigns}) do
    %{
      "page" => "#{assigns.page}",
      "sort_by" => assigns.sort_by |> Helpers.encode_sort_by(),
      "segment_id" => "#{assigns.segment_id}"
    }
  end
end
