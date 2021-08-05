defmodule MoonWeb.Pages.ExamplePages.AffiliatesPage do
  use MoonWeb, :live_view

  alias Moon.Assets.Icons.{IconChartSegment, IconSettings}
  alias Moon.Components.{Chip, Divider, Button, Heading}
  alias Moon.ComponentsV2.Table
  alias Moon.Autolayouts.{ButtonsList, TopToDown}

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

            <Table
              id="affiliates_table"
              columns={[
                %{label: "Affiliate username", field: [:user, :username], sortable: true},
                %{label: "Affiliate ID", field: [:id], sortable: true},
                %{label: "Email", field: [:user, :email]},
                %{label: "Site", field: [:user, :site]},
                %{label: "Signup time", field: [:signup_at]},
                %{label: "Country", field: [:user, :country]}
              ]}
              items={@affiliates}
              active_item_id={@active_affiliate.id}
              sort_by={@sort_by}
              page={@page}
              page_count={20}
              total_count={1100}
            >
              <:active_item_popover>
                <div class="inline-flex py-2 px-3 rounded bg-hit-120">
                  <IconSettings color="goku-100" font_size="1.5rem" />
                </div>
              </:active_item_popover>
            </Table>
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
        {:filter, filter_event} ->
          case filter_event do
            {:username_filter, :apply, values} ->
              {true, socket |> assign(username_filter_values: values) |> assign(page: 1)}

            {:country_filter, :apply, values} ->
              {true, socket |> assign(country_filter_values: values) |> assign(page: 1)}

            _ ->
              {false, socket}
          end

        {:table, table_event} ->
          case table_event do
            {:affiliates_table, :paginate, page} ->
              {true, socket |> assign(page: page)}

            {:affiliates_table, :select, affiliate} ->
              {false, socket |> assign(active_affiliate: affiliate)}

            {:affiliates_table, :sort, sort_by} ->
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
     |> assign(username_filter_values: [])
     |> assign(country_filter_values: [])
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
end
