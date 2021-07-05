defmodule MoonWeb.Pages.ExamplePages.AffiliatesPage do
  use MoonWeb, :live_view

  alias MoonWeb.Pages.ExamplePages.Shared
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
  alias MoonWeb.MockDB.Countries
  alias MoonWeb.MockDB.Affiliates

  alias __MODULE__.{AffiliatesList, AffiliatesListPagination}
  alias __MODULE__.Components.MultiFilterPopover

  data affiliates, :list
  data affiliates_query, :map
  data affiliates_pagination, :map,
    default: %{
      page: 1,
      page_count: 20,
      total_count: 3452
    }
  data username_filter, :map,
    default: %{
      show_filter: false,
      search_text: "",
      all_usernames: [],
      selected_usernames: []
    }
  data country_filter, :map,
    default: %{
      show_filter: false,
      search_text: "",
      all_countries: [],
      selected_countries: []
    }

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

              <MultiFilterPopover
                show_filter={@username_filter.show_filter}
                search_text={@username_filter.search_text}
                all_items={@username_filter.all_usernames}
                selected_items={@username_filter.selected_usernames}
                on_apply="apply_username_filter"
                on_toggle="toggle_username_filter"
                on_clear="clear_username_filter"
                on_search="handle_username_filter_search"
                on_select="handle_username_filter_select"
              >
                <Chip on_click="toggle_username_filter" value="users" right_icon="icon_chevron_down_rounded">
                  {"Users #{length(@affiliates_query.filter.user.id) |> Helpers.format_filter_count()}"}
                </Chip>
              </MultiFilterPopover>

              <MultiFilterPopover
                show_filter={@country_filter.show_filter}
                search_text={@country_filter.search_text}
                all_items={@country_filter.all_countries |> Helpers.search_by_labels(@country_filter.search_text)}
                selected_items={@country_filter.selected_countries}
                on_apply="apply_country_filter"
                on_toggle="toggle_country_filter"
                on_clear="clear_country_filter"
                on_search="handle_country_filter_search"
                on_select="handle_country_filter_select"
              >
                <Chip on_click="toggle_country_filter" value="country" right_icon="icon_chevron_down_rounded">
                  {"Country #{length(@affiliates_query.filter.user.country) |> Helpers.format_filter_count()}"}
                </Chip>
              </MultiFilterPopover>

              <Chip value="more filters" right_icon="icon_chevron_down_rounded">More Filters</Chip>
              <Button variant="danger" left_icon="chart_segment">
                <IconChartSegment font_size="1.2rem" />
                Save Segment
              </Button>
              <Divider orientation="vertical" />
              <Button variant="danger" size="small" on_click="clear_all_filters">
                Clear All
              </Button>
            </ButtonsList>

            <AffiliatesListPagination
              page={@affiliates_pagination.page}
              page_count={@affiliates_pagination.page_count}
              total_count={@affiliates_pagination.total_count}
              on_prev_page="goto_prev_page"
              on_next_page="goto_next_page"
            />

            <AffiliatesList {=@affiliates}/>
          </TopToDown>
        </div>
      </div>
    </div>
    """
  end

  def mount(params, _session, socket) do
    socket = socket
      |> assign(theme_name: params["theme_name"] || "sportsbet-dark")
      |> assign(active_page: __MODULE__)
      |> load_countries()
      |> filter_affiliates()

    {:ok, socket, layout: {MoonWeb.LayoutView, "clean.html"}}
  end

  #
  # username filter events
  #
  def handle_event("apply_username_filter", _, socket) do
    %{ username_filter: username_filter } = socket.assigns

    {:noreply, socket
      |> assign(username_filter: %{ username_filter | show_filter: false })
      |> reset_pagination()
      |> filter_affiliates()
    }
  end

  def handle_event("toggle_username_filter", _, socket) do
    %{ username_filter: username_filter } = socket.assigns
    %{ show_filter: show_filter } = username_filter

    {:noreply, socket
      |> close_all_filters()
      |> assign(username_filter: %{ username_filter | show_filter: !show_filter })
    }
  end

  def handle_event("clear_username_filter", _, socket) do
    {:noreply, socket
      |> clear_username_filter()
      |> reset_pagination()
      |> filter_affiliates()
    }
  end

  def handle_event("handle_username_filter_search", %{"search" => %{"search_text" => search_text}}, socket) do
    %{ username_filter: username_filter } = socket.assigns
    all_usernames = Users.search_by_usernames(search_text)
        |> Enum.map(&(%{label: &1.username, value: to_string(&1.id)}))
        |> Enum.take(10)

    {:noreply, socket
      |> assign(username_filter: %{ username_filter | search_text: search_text, all_usernames: all_usernames })
    }
  end

  def handle_event("handle_username_filter_select", %{"toggled_item_id" => id}, socket) do
    %{ username_filter: username_filter } = socket.assigns
    %{ all_usernames: all, selected_usernames: selected } = username_filter

    {:noreply, socket
      |> assign(username_filter: %{ username_filter | selected_usernames: Helpers.toggle_selected_item(all, selected, id) })
    }
  end

  #
  # country filter events
  #
  def handle_event("apply_country_filter", _, socket) do
    %{ country_filter: country_filter } = socket.assigns

    {:noreply, socket
      |> assign(country_filter: %{ country_filter | show_filter: false })
      |> reset_pagination()
      |> filter_affiliates()
    }
  end

  def handle_event("toggle_country_filter", _, socket) do
    %{ country_filter: country_filter } = socket.assigns
    %{ show_filter: show_filter } = country_filter

    {:noreply, socket
      |> close_all_filters()
      |> assign(country_filter: %{ country_filter | show_filter: !show_filter })
    }
  end

  def handle_event("clear_country_filter", _, socket) do
    {:noreply, socket
      |> clear_country_filter()
      |> reset_pagination()
      |> filter_affiliates()
    }
  end

  def handle_event("handle_country_filter_search", %{"search" => %{"search_text" => search_text}}, socket) do
    %{ country_filter: country_filter } = socket.assigns

    {:noreply, socket
      |> assign(country_filter: %{ country_filter | search_text: search_text })
    }
  end

  def handle_event("handle_country_filter_select", %{"toggled_item_id" => id}, socket) do
    %{ country_filter: country_filter } = socket.assigns
    %{ all_countries: all, selected_countries: selected } = country_filter

    {:noreply, socket
      |> assign(country_filter: %{ country_filter | selected_countries: Helpers.toggle_selected_item(all, selected, id) })
    }
  end

  #
  # global filter events
  #
  def handle_event("clear_all_filters", _, socket) do
    {:noreply, socket
      |> clear_username_filter()
      |> clear_country_filter()
      |> reset_pagination()
      |> filter_affiliates()
    }
  end

  #
  # pagination events
  #
  def handle_event("goto_prev_page", _, socket) do
    %{ affiliates_pagination: pagination } = socket.assigns
    %{ page: page } = pagination
    prev_page = if page > 1, do: page - 1, else: page

    {:noreply, socket
      |> assign(affiliates_pagination: %{ pagination | page: prev_page })
      |> filter_affiliates()
    }
  end

  def handle_event("goto_next_page", _, socket) do
    %{ affiliates_pagination: pagination } = socket.assigns
    %{ page: page } = pagination
    next_page = page + 1

    {:noreply, socket
      |> assign(affiliates_pagination: %{ pagination | page: next_page })
      |> filter_affiliates()
    }
  end

  #
  # helpers
  #
  defp filter_affiliates(socket) do
    %{
      affiliates_pagination: %{page: page, page_count: page_count },
      username_filter: %{ selected_usernames: selected_usernames },
      country_filter: %{ selected_countries: selected_countries }
    } = socket.assigns

    query = %{
      filter: %{
        user: %{
          id: Enum.map(selected_usernames, &(&1.value |> String.to_integer())),
          country: Enum.map(selected_countries, &(&1.value))
        }
      },
      pagination: %{
        offset: (page - 1) * page_count,
        limit: page_count
      }
    }

    socket
      |> assign(affiliates: Affiliates.list(query))
      |> assign(affiliates_query: query)
  end

  defp load_countries(socket) do
    %{ country_filter: country_filter } = socket.assigns

    socket
      |> assign(country_filter: %{ country_filter |
        all_countries: Countries.list_all() |> Enum.map(&(%{label: &1.name, value: &1.name}))
      })
  end

  defp close_all_filters(socket) do
    %{
      username_filter: username_filter,
      country_filter: country_filter
    } = socket.assigns

    socket
      |> assign(username_filter: %{username_filter | show_filter: false })
      |> assign(country_filter: %{country_filter | show_filter: false})
  end

  defp clear_username_filter(socket) do
    empty_filter = %{
      show_filter: false,
      search_text: "",
      all_usernames: [],
      selected_usernames: []
    }

    assign(socket, username_filter: empty_filter)
  end

  defp clear_country_filter(socket) do
    %{ country_filter: country_filter } = socket.assigns
    empty_filter = %{
      show_filter: false,
      search_text: "",
      all_countries: country_filter.all_countries,
      selected_countries: []
    }

    assign(socket, country_filter: empty_filter)
  end

  defp reset_pagination(socket) do
    assign(socket, affiliates_pagination: %{
      page: 1,
      page_count: 20,
      total_count: 3452
    })
  end
end
