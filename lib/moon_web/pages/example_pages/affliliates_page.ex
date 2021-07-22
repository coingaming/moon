defmodule MoonWeb.Pages.ExamplePages.AffiliatesPage do
  use MoonWeb, :live_view

  alias MoonWeb.Pages.ExamplePages.Shared
  alias MoonWeb.Pages.ExamplePages.Shared.Filters.UsernameFilter
  alias MoonWeb.Pages.ExamplePages.Shared.Filters.CountryFilter
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

  alias MoonWeb.MockDB.Affiliates

  alias __MODULE__.{AffiliatesList}

  data affiliates, :list
  data active_affiliate, :map, default: %{id: nil}
  data username_filter, :list, default: []
  data country_filter, :list, default: []
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

              <UsernameFilter id="username_filter" active_items={@username_filter} />
              <CountryFilter id="country_filter" active_items={@country_filter} />

              <Chip value="more filters" right_icon="icon_chevron_down_rounded">More Filters</Chip>
              <Button variant="danger" left_icon="chart_segment">
                <IconChartSegment font_size="1.2rem" />Save Segment
              </Button>
              <Divider orientation="vertical" />
              <Button variant="danger" size="small" on_click="clear_all_filters">Clear All</Button>
            </ButtonsList>

            <AffiliatesList
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

  def mount(params, _session, socket) do
    socket =
      socket
      |> assign(theme_name: params["theme_name"] || "sportsbet-dark")
      |> assign(active_page: __MODULE__)
      |> filter_affiliates()

    {:ok, socket, layout: {MoonWeb.LayoutView, "clean.html"}}
  end

  def handle_info(msg, socket) do
    {refresh_list, socket} =
      case msg do
        {:apply_filter, filter_event} ->
          case filter_event do
            {:username, items} ->
              {true, socket |> assign(username_filter: items) |> assign(page: 1)}

            {:country, items} ->
              {true, socket |> assign(country_filter: items) |> assign(page: 1)}

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

    if refresh_list do
      {:noreply, socket |> filter_affiliates()}
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
     |> assign(username_filter: [])
     |> assign(country_filter: [])
     |> assign(page: 1)
     |> filter_affiliates()}
  end

  #
  # Helpers
  #
  defp filter_affiliates(socket) do
    %{
      page: page,
      sort_by: sort,
      country_filter: country_filter,
      username_filter: username_filter
    } = socket.assigns

    socket
    |> assign(
      affiliates:
        Affiliates.list(%{
          filter: %{
            user: %{
              id: Enum.map(username_filter, &(&1.value |> String.to_integer())),
              country: Enum.map(country_filter, & &1.value)
            },
          },
          sort: Helpers.tuple_to_map(sort),
          pagination: %{
            offset: (page - 1) * 20,
            limit: 20
          }
        })
    )
  end
end
