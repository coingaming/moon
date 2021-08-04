defmodule MoonWeb.Pages.ExamplePages.AffiliatesPage do
  use MoonWeb, :live_view

  alias Moon.Assets.Icons.IconChartSegment
  alias Moon.Components.{Chip, Divider, Button, Heading}
  alias Moon.Autolayouts.{ButtonsList, TopToDown}

  alias MoonWeb.Pages.ExamplePages.Affiliates.AffiliatesTable
  alias MoonWeb.Pages.ExamplePages.Shared.Filters.{UsernameFilter, CountryFilter}
  alias MoonWeb.Pages.ExamplePages.Shared.{TopMenu, LeftMenu, Breadcrumbs}
  alias MoonWeb.Pages.ExamplePages.Helpers
  alias MoonWeb.MockDB.{Affiliates, Segments}

  data affiliates, :list, default: []
  data active_affiliate, :map, default: %{id: nil}

  # filters
  data username_filter_values, :list, default: []
  data country_filter_values, :list, default: []

  # table
  data sort_by, :tuple, default: {nil, nil}
  data page, :integer, default: 1

  def render(assigns) do
    ~F"""
    <div class={"#{@theme_name}"}>
      <TopMenu id="top-menu" />
      <div class="flex">
        <LeftMenu id="left-menu" />
        <div class="w-full p-4">
          <Breadcrumbs breadcrumbs={[%{name: "Affiliates", to: "/lab-light/example-pages/affiliates"}]} />
          <Heading size={32} class="my-2">Affiliates</Heading>
          <TopToDown>
            <ButtonsList>
              <Chip left_icon="icon_zoom">Search</Chip>
              <Chip value="users" right_icon="icon_chevron_down_rounded">Past Month</Chip>

              <UsernameFilter active_values={@username_filter_values} />
              <CountryFilter active_values={@country_filter_values} />

              <Chip value="more filters" right_icon="icon_chevron_down_rounded">More Filters</Chip>
              <Button variant="danger" left_icon="chart_segment" on_click="save_segment">
                <IconChartSegment font_size="1.2rem" />Save Segment
              </Button>
              <Divider orientation="vertical" />
              <Button variant="danger" size="small" on_click="clear_all_filters">Clear All</Button>
            </ButtonsList>
            <AffiliatesTable
              id="affiliates_list"
              affiliates={@affiliates}
              page={@page}
              sort_by={@sort_by}
              active_affiliate_id={@active_affiliate.id}
            />
          </TopToDown>
        </div>
      </div>
    </div>
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

    {:ok, socket, layout: {MoonWeb.LayoutView, "clean.html"}}
  end

  def handle_params(params, _uri, socket) do
    {:noreply, socket
      |> load_params(params)
      |> filter_affiliates()}
  end

  #
  # Message Handler
  #
  def handle_info(msg, socket) do
    {patch_list, socket} =
      case msg do
        {:filters, filter_event} ->
          case filter_event do
            {:apply_username_filter, values} ->
              {true, socket |> assign(username_filter_values: values, page: 1)}

            {:apply_country_filter, values} ->
              {true, socket |> assign(country_filter_values: values, page: 1)}

            _ ->
              {false, socket}
          end

        {:table, table_event} ->
          case table_event do
            {:paginate, page} ->
              {true, socket |> assign(page: page)}

            {:select, affiliate} ->
              {false, socket |> assign(active_affiliate: affiliate)}

            {:sort, sort_by} ->
              {true, socket |> assign(sort_by: sort_by, page: 1)}

            _ ->
              {false, socket}
          end

        _ ->
          {false, socket}
      end

    if patch_list do
      new_route = Routes.live_path(socket, __MODULE__, get_params(socket))
      {:noreply, push_patch(socket, to: new_route)}
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

    {:noreply,
     socket
     |> assign(username_filter_values: [])
     |> assign(country_filter_values: [])
     |> assign(page: 1)
     |> filter_affiliates()}
  end


  def handle_event("save_segment", _, socket) do
    Segments.save(%{
      name: "test_segment",
      params: get_params(socket),
      type: :customers
    })

    {:noreply, socket}
  end

  #
  # Helpers
  #
  defp filter_affiliates(socket) do
    %{
      page: page,
      sort_by: sort,
      country_filter_values: country_filter_values,
      username_filter_values: username_filter_values
    } = socket.assigns

    socket
    |> assign(
      affiliates:
        Affiliates.list(%{
          filter: %{
            user: %{
              id: Enum.map(username_filter_values, &String.to_integer/1),
              country: country_filter_values
            }
          },
          sort: Helpers.tuple_to_map(sort),
          pagination: %{
            offset: (page - 1) * 20,
            limit: 20
          }
        })
    )
  end

  defp load_params(socket, params) do
    get = &(Map.get(params, &1) || &2)

    socket
    |> assign(username_filter_values: get.("users", []))
    |> assign(country_filter_values: get.("countries", []))
    |> assign(page: (get.("page", "1") |> String.to_integer()))
    |> assign(sort_by: (get.("sort_by", nil) |> Helpers.decode_sort_by()))
  end

  defp get_params(%{assigns: assigns}) do
    %{
      "users" => assigns.username_filter_values,
      "countries" => assigns.country_filter_values,
      "page" => (if assigns.page > 1, do: "#{assigns.page}", else: []),
      "sort_by" => assigns.sort_by |> Helpers.encode_sort_by()
    }
  end
end
