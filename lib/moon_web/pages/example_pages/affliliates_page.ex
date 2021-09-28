defmodule MoonWeb.Pages.ExamplePages.AffiliatesPage do
  use MoonWeb, :live_view

  alias Moon.Assets.Icons.{IconChartSegment, IconSettings}
  alias Moon.Autolayouts.{ButtonsList, TopToDown}
  alias Moon.Components.{Button, Chip, Divider, Heading}
  alias Moon.Components.{Button, Form, TextInput}
  alias Moon.ComponentsV2.Table
  alias MoonWeb.Components.Breadcrumbs
  alias MoonWeb.MockDB.{Affiliates, Segments}
  alias MoonWeb.Pages.ExamplePages.Helpers
  alias MoonWeb.Pages.ExamplePages.Shared.{LeftMenu, TopMenu}
  alias MoonWeb.Pages.ExamplePages.Shared.Filters.{CountryFilter, UsernameFilter}

  data affiliates, :list, default: []
  data active_affiliate, :map, default: %{id: nil}

  # filters
  data username_filter_values, :list, default: []
  data country_filter_values, :list, default: []

  # table
  data sort_by, :tuple, default: {nil, nil}
  data page, :integer, default: 1

  # segment
  data segment_id, :string, default: nil
  data segment_title, :string, default: nil

  # ephimeral state
  data save_segment_form, :map, default: nil

  def render(assigns) do
    ~F"""
    <div class={"#{@theme_name}"}>
      <TopMenu id="top-menu" />
      <div class="flex">
        <LeftMenu id="left-menu" />
        <div class="pl-4 pt-4" style="width: calc(100vw - 260px)">
          <Breadcrumbs
            theme_name={@theme_name}
            breadcrumbs={[%{name: "Affiliates", to: "/lab-light/example-pages/affiliates"}]}
          />
          {#if @save_segment_form == nil}
            <Heading size={32} class="my-2">{@segment_title || "Affiliates"}</Heading>
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
                  class="mt-2 w-full bg-goku-80 h-10 text-3xl font-bold"
                />
              </div>
              <Button
                variant="danger"
                size="small"
                class="flex-none rounded border-bulma-100 mt-2"
                on_click="save_segment_form_cancel"
              >
                Cancel
              </Button>
              <Button type="submit" variant="primary" size="small" class="flex-none mt-2 rounded">
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

              <Chip value="more filters" right_icon="icon_chevron_down_rounded">More Filters</Chip>

              {#if @segment_id == nil}
                <Button variant="danger" left_icon="chart_segment" on_click="save_segment_form_init">
                  <IconChartSegment font_size="1.2rem" />Save Segment
                </Button>
              {/if}

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

  def handle_params(params = %{"segment_id" => segment_id}, _uri, socket) do
    %{name: name, params: params_saved} = Segments.get_by_id(segment_id |> String.to_integer())

    {:noreply,
     socket
     |> assign(segment_id: segment_id)
     |> assign(segment_title: name)
     |> load_params(Map.merge(params_saved, params, fn _, _, y -> y end))
     |> filter_affiliates()}
  end

  def handle_params(params, _uri, socket) do
    {:noreply,
     socket
     |> load_params(params)
     |> filter_affiliates()}
  end

  #
  # Message Handler
  #
  def handle_info(msg, socket) do
    is_segment = socket.assigns.segment_id != nil

    new_route = fn socket ->
      route = Routes.live_path(socket, __MODULE__, get_params(socket))

      {:noreply,
       socket
       |> assign(segment_id: nil)
       |> assign(segment_title: nil)
       |> push_patch(to: route)}
    end

    new_segment_route = fn socket ->
      route = Routes.live_path(socket, __MODULE__, get_segment_params(socket))
      {:noreply, socket |> push_patch(to: route)}
    end

    no_redirect = fn socket ->
      {:noreply, socket}
    end

    case msg do
      {:filter, filter_event} ->
        case filter_event do
          {"username_filter", :apply, values} ->
            socket = socket |> assign(username_filter_values: values, page: 1)
            new_route.(socket)

          {"country_filter", :apply, values} ->
            socket = socket |> assign(country_filter_values: values, page: 1)
            new_route.(socket)

          _ ->
            no_redirect.(socket)
        end

      {:table, table_event} ->
        case table_event do
          {"affiliates_table", :paginate, page} ->
            socket = socket |> assign(page: page)
            if is_segment, do: new_segment_route.(socket), else: new_route.(socket)

          {"affiliates_table", :select, affiliate} ->
            socket = socket |> assign(active_affiliate: affiliate)
            no_redirect.(socket)

          {"affiliates_table", :sort, sort_by} ->
            socket = socket |> assign(sort_by: sort_by, page: 1)
            if is_segment, do: new_segment_route.(socket), else: new_route.(socket)

          _ ->
            no_redirect.(socket)
        end

      _ ->
        no_redirect.(socket)
    end
  end

  #
  # Event Handlers
  #
  def handle_event("save_segment_form_init", _, socket) do
    {:noreply, socket |> assign(:save_segment_form, %{title: "Affiliates"})}
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
        type: :affiliates,
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
      |> assign(page: 1)
      |> assign(segment_id: nil)
      |> assign(segment_title: nil)

    {:noreply, push_patch(socket, to: Routes.live_path(socket, __MODULE__, get_params(socket)))}
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
    |> assign(page: get.("page", "1") |> String.to_integer())
    |> assign(sort_by: get.("sort_by", nil) |> Helpers.decode_sort_by())
  end

  defp get_params(%{assigns: assigns}) do
    %{
      "users" => assigns.username_filter_values,
      "countries" => assigns.country_filter_values,
      "page" => if(assigns.page > 1, do: "#{assigns.page}", else: []),
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
