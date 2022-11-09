defmodule MoonWeb.Pages.Components.TablePage do
  @moduledoc false

  use MoonWeb, :live_view

  alias Moon.Components.Button
  alias Moon.Components.Drawer
  alias Moon.Components.Table
  alias Moon.Components.Table.Column
  alias Moon.Components.Renderers.Datetime
  alias MoonWeb.Components.ExampleAndCode
  alias MoonWeb.Components.Page
  alias MoonWeb.Components.ComponentPageDescription
  alias MoonWeb.Components.PropsTable

  data(breadcrumbs, :any,
    default: [
      %{
        to: "#",
        name: "Components"
      },
      %{
        to: "/components/table",
        name: "Table"
      }
    ]
  )

  data(props_info_array, :list, default: [])

  @spec render(any) :: Phoenix.LiveView.Rendered.t()
  def render(assigns) do
    ~F"""
    <Page {=@theme_name} {=@active_page} {=@breadcrumbs} {=@direction}>
      <ComponentPageDescription title="Table">
        <p>
          Tables are used to show list of structured rows.
        </p>
      </ComponentPageDescription>

      <ExampleAndCode title="Default" id="table_1">
        <:example>
          <Table
            id="example-table"
            sort_key={@sort_key}
            sort_dir={@sort_dir}
            limit={@limit}
            offset={@offset}
            paging_info={%{
              total_count: 100,
              visible_count: length(@models)
            }}
            {=@selected}
            items={model <- @models}
            row_click="handle_row_click"
            paging_click="handle_paging_click"
            sorting_click="handle_sorting_click"
          >
            <Column name="id" label="Label" sortable>
              {model.id}
            </Column>
            <Column name="name" label="Name" sortable>
              {model.name}
            </Column>
            <Column name="created_at" label="Created at" sortable>
              {model.name}
            </Column>
          </Table>
          {#if @selected}
            <Drawer>
              <Drawer.Dialog close="close_drawer">
                <:title>
                  Selected {@selected}
                </:title>
                <:footer>
                  <Button on_click="close_drawer">Close</Button>
                </:footer>
              </Drawer.Dialog>
            </Drawer>
          {/if}
        </:example>

        <:code>{table_01_code()}</:code>
      </ExampleAndCode>

      <PropsTable data={@props_info_array} />
    </Page>
    """
  end

  def handle_params(_params, uri, socket) do
    {:noreply, assign(socket, uri: uri)}
  end

  def mount(_params, _session, socket) do
    now = DateTime.utc_now()

    all_models =
      Enum.map(1..100, fn x ->
        %{id: x, name: "Name #{x}", created_at: DateTime.add(now, -3600 + x)}
      end)

    socket =
      assign(socket,
        all_models: all_models,
        sort_key: "name",
        sort_dir: "ASC",
        limit: 10,
        offset: 0,
        selected: nil
      )
      |> refresh_models()

    {:ok, socket}
  end

  def handle_event("handle_row_click", %{"selected" => selected}, socket) do
    {:noreply, assign(socket, selected: String.to_integer(selected))}
  end

  def handle_event(
        "handle_sorting_click",
        %{"sort-dir" => sort_dir, "sort-key" => sort_key},
        socket
      ) do
    socket = assign(socket, sort_dir: sort_dir, sort_key: sort_key)
    socket = refresh_models(socket)
    {:noreply, socket}
  end

  def handle_event("handle_paging_click", %{"offset" => offset}, socket) do
    offset = String.to_integer(offset)
    socket = assign(socket, offset: offset)
    socket = refresh_models(socket)
    {:noreply, socket}
  end

  def handle_event("close_drawer", _, socket) do
    {:noreply, assign(socket, selected: nil)}
  end

  def refresh_models(socket) do
    %{
      limit: limit,
      offset: offset,
      all_models: all_models,
      sort_key: sort_key,
      sort_dir: sort_dir
    } = socket.assigns

    models =
      all_models
      |> Enum.sort_by(fn x -> x[String.to_existing_atom(sort_key)] end, fn x, y ->
        case sort_dir do
          "ASC" ->
            x < y

          "DESC" ->
            x > y
        end
      end)
      |> Enum.slice(offset..(offset + limit - 1))

    assign(socket, models: models)
  end

  def table_01_code do
    """
    <Table
      id="example-table"
      sort_key={@sort_key}
      sort_dir={@sort_dir}
      limit={@limit}
      offset={@offset}
      paging_info={%{
        total_count: 100,
        visible_count: length(@models)
      }}
      {=@selected}
      items={model <- @models}
      row_click="handle_row_click"
      paging_click="handle_paging_click"
      sorting_click="handle_sorting_click"
    >
      <Column name="id" label="Label" sortable>
        {model.id}
      </Column>
      <Column name="name" label="Name" sortable>
        {model.name}
      </Column>
      <Column name="created_at" label="Created at" sortable>
        {model.name}
      </Column>
    </Table>
    {#if @selected}
      <Drawer>
        <Drawer.Dialog close="close_drawer">
          <:title>
            Selected {@selected}
          </:title>
          <:footer>
            <Button on_click="close_drawer">Close</Button>
          </:footer>
        </Drawer.Dialog>
      </Drawer>
    {/if}
    """
  end
end
