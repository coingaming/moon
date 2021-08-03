defmodule MoonWeb.Pages.ExamplePages.AffiliatesPage do
  use MoonWeb, :live_view

  alias Moon.Assets.Icons.IconChartSegment
  alias Moon.Components.{Chip, Divider, Button, Heading}
  alias Moon.Autolayouts.{ButtonsList, TopToDown}

  alias MoonWeb.Pages.ExamplePages.Affiliates.AffiliatesTable
  alias MoonWeb.Pages.ExamplePages.Shared.Filters.{UsernameFilter, CountryFilter}
  alias MoonWeb.Pages.ExamplePages.Shared.{TopMenu, LeftMenu, Breadcrumbs}
  alias MoonWeb.Pages.ExamplePages.Helpers
  alias MoonWeb.MockDB.Affiliates

  data affiliates, :list
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
              <Button variant="danger" left_icon="chart_segment">
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
      |> filter_affiliates()

    {:ok, socket, layout: {MoonWeb.LayoutView, "clean.html"}}
  end

  def handle_params(params, _uri, socket) do
    get = &(Map.get(params, &1) || &2)

    {:noreply, socket
      |> assign(username_filter_values: get.("usernames", []))
      |> assign(country_filter_values: get.("countries", []))
      |> assign(page: String.to_integer(get.("page", "1")))
      |> assign(sort_by: decode_sort_by(get.("sort_by_column", nil), get.("sort_by_order", nil)))
      |> filter_affiliates()}
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

    {:noreply,
     socket
     |> assign(username_filter_values: [])
     |> assign(country_filter_values: [])
     |> assign(page: 1)
     |> filter_affiliates()}
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

  defp redirect(socket = %{assigns: assigns}) do
    params = %{
      "usernames" => assigns.username_filter_values,
      "countries" => assigns.country_filter_values,
      "page" => "#{assigns.page}",
      "sort_by_column" => assigns.sort_by |> elem(0),
      "sort_by_order" => assigns.sort_by |> elem(1) |> Atom.to_string()
    }

    socket |> push_patch(to: Routes.live_path(socket, __MODULE__, params))
  end
end
