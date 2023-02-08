defmodule MoonWeb.Pages.Design.TablePage do
  @moduledoc false

  use MoonWeb, :live_view

  alias Moon.Components.Button
  alias Moon.Components.Drawer
  alias Moon.Design.Table
  alias Moon.Components.Table.Column
  alias Moon.Components.Renderers.Datetime
  alias MoonWeb.Components.ExampleAndCode
  alias MoonWeb.Components.Page
  alias MoonWeb.Components.ComponentPageDescription
  alias MoonWeb.Components.PropsTable
  alias Moon.Components.Lego

  data(breadcrumbs, :any,
    default: [
      %{
        to: "#",
        name: "Components v2"
      },
      %{
        to: "/components/table",
        name: "Table"
      }
    ]
  )

  data(props_info_array, :list,
    default: [
      %{
        :name => 'cols',
        :type => 'slot',
        :required => 'Yes',
        :default => '-',
        :description => 'List of columns for the table'
      },
      %{
        :name => 'items',
        :type => 'generator',
        :required => 'Yes',
        :default => '-',
        :description => 'Rows / data for the table. Each row should have unique `id` key'
      },
      %{
        :name => 'selected',
        :type => 'list[string]',
        :required => 'No',
        :default => '[]',
        :description => 'list of ids of selected rows.'
      },
      %{
        :name => 'is_cell_border',
        :type => 'boolean',
        :required => 'No',
        :default => 'false',
        :description => 'Has borders between cells in row'
      },
      %{
        :name => 'is_headless',
        :type => 'boolean',
        :required => 'No',
        :default => 'false',
        :description => 'Does not have table/column headers'
      },
      %{
        :name => 'row_gap',
        :type => 'css_class',
        :required => 'No',
        :default => 'border-spacing-y-1',
        :description => 'Gap between rows, TW class'
      },
      %{
        :name => 'row_size',
        :type => '2xs | xs | sm | md | lg | xl | 2xl',
        :required => 'No',
        :default => 'md',
        :description => 'Text and padding sizes for rows'
      },
      %{
        :name => 'row_click',
        :type => 'event',
        :required => 'No',
        :default => '-',
        :description => 'When row is clicked'
      },
      %{
        :name => 'row_bg',
        :type => 'css_class',
        :required => 'No',
        :default => 'bg-gohan',
        :description => 'Regular row background, TW class'
      },
      %{
        :name => 'selected_bg',
        :type => 'css_class',
        :required => 'No',
        :default => 'bg-beerus',
        :description => 'Selected row background, TW class'
      },
      %{
        :name => 'hover_bg',
        :type => 'css_class',
        :required => 'No',
        :default => '-',
        :description => 'Hover row background, e.g. hover:bg-beerus'
      }
    ]
  )

  data(checked, :list, default: [])

  @spec render(any) :: Phoenix.LiveView.Rendered.t()
  def render(assigns) do
    ~F"""
    <Page {=@theme_name} {=@active_page} {=@breadcrumbs} {=@direction}>
      <ComponentPageDescription title="Table">
        <p>
          Tables are great for presenting information with a clear, repeating structure.
          Our users are busy and may not want to read long sections of text. Breaking structured
          data into tables can help them scan it and find what they need to make informed decisions.
        </p>
        <p>
          While tables present a clear structure, they are not good for designing layouts.
          Use them only when data you are presenting calls for a tabular structure,
          for example prices for various travel dates or multiple options for baggage.
        </p>
      </ComponentPageDescription>

      <ExampleAndCode title="Default" id="table_simple">
        <:example>
          <Table items={model <- @models_5} selected={nil}>
            <Column name="id" label="ID">
              {model.id}
            </Column>
            <Column name="name" label="Name">
              {model.name}
            </Column>
            <Column name="created_at" label="Created at">
              <Datetime value={model.created_at} />
            </Column>
          </Table>
        </:example>
        <:code>{table_simple_code()}</:code>
      </ExampleAndCode>

      <ExampleAndCode title="Headless" id="table_headless">
        <:example>
          <Table items={model <- @models_5} is_headless>
            <Column name="id">
              {model.id}
            </Column>
            <Column name="name">
              {model.name}
            </Column>
            <Column name="created_at">
              <Datetime value={model.created_at} />
            </Column>
          </Table>
        </:example>
        <:code>{table_headless_code()}</:code>
      </ExampleAndCode>

      <ExampleAndCode title="With cell borders" id="table_borders">
        <:example>
          <Table items={model <- @models_5} is_cell_border>
            <Column name="id" label="ID">
              {model.id}
            </Column>
            <Column name="name" label="Name">
              {model.name}
            </Column>
            <Column name="created_at" label="Created at">
              <Datetime value={model.created_at} />
            </Column>
          </Table>
        </:example>
        <:code>{table_borders_code()}</:code>
      </ExampleAndCode>

      <ExampleAndCode title="Different row gaps" id="table_gaps">
        <:example>
          {#for gap <-
              ~w(border-spacing-y-0 border-spacing-y-1 border-spacing-y-2 border-spacing-y-4 border-spacing-y-8)}
            <Table items={model <- @models_5 |> Enum.slice(0, 2)} row_gap={gap}>
              <Column name="id" label="ID">
                {model.id}
              </Column>
              <Column name="name" label="Name">
                {model.name}
              </Column>
              <Column name="created_at" label="Created at">
                <Datetime value={model.created_at} />
              </Column>
            </Table>
          {/for}
        </:example>
        <:code>{table_gaps_code()}</:code>
      </ExampleAndCode>

      <ExampleAndCode title="Different row sizes" id="table_sizes">
        <:example>
          {#for size <- ~w(2xs xs sm md lg xl 2xl)}
            <Table items={model <- @models_5 |> Enum.slice(0, 2)} row_size={size}>
              <Column name="id" label="ID">
                {model.id}
              </Column>
              <Column name="name" label="Name">
                {model.name}
              </Column>
              <Column name="created_at" label="Created at">
                <Datetime value={model.created_at} />
              </Column>
            </Table>
          {/for}
        </:example>
        <:code>{table_sizes_code()}</:code>
      </ExampleAndCode>

      <ExampleAndCode title="Clickable rows" id="table_clickable">
        <:example>
          <Table items={model <- @models_5} row_click="single_row_click" {=@selected}>
            <Column name="id" label="ID">
              {model.id}
            </Column>
            <Column name="name" label="Name">
              {model.name}
            </Column>
            <Column name="created_at" label="Created at">
              <Datetime value={model.created_at} />
            </Column>
          </Table>
        </:example>
        <:code>{table_clickable_code()}</:code>
      </ExampleAndCode>

      <ExampleAndCode title="Checkboxes" id="table_checkboxes">
        <:example>
          <Table items={model <- @models_5} selected={@checked}>
            <Column name="id" label="ID">
              <span :on-click="checkbox_click" :values={id: model.id} class="flex cursor-pointer">
                <Lego.Checkbox is_selected={"#{model.id}" in @checked} />
                <Lego.Title title={model.id} />
              </span>
            </Column>
            <Column name="name" label="Name">
              {model.name}
            </Column>
            <Column name="created_at" label="Created at">
              <Datetime value={model.created_at} />
            </Column>
          </Table>
        </:example>
        <:code>{table_checkbox_code()}</:code>
      </ExampleAndCode>

      <ExampleAndCode title="Sorting and paging" id="table_1">
        <:example>
          <Table
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
            row_click="single_row_click"
            paging_click="handle_paging_click"
            sorting_click="handle_sorting_click"
            is_cell_border
          >
            <Column name="id" label="Label" sortable>
              {model.id}
            </Column>
            <Column name="name" label="Name" sortable>
              {model.name}
            </Column>
            <Column name="created_at" label="Created at" sortable>
              <Datetime value={model.created_at} />
            </Column>
          </Table>
          {#if Enum.count(@selected) > 0}
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

      <PropsTable title="Table props" data={@props_info_array} />
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
        models_5: all_models |> Enum.slice(0, 5),
        sort_key: "name",
        sort_dir: "ASC",
        limit: 10,
        offset: 0,
        selected: []
      )
      |> refresh_models()

    {:ok, socket}
  end

  def handle_event("single_row_click", %{"selected" => selected}, socket) do
    {:noreply, assign(socket, selected: [selected])}
  end

  def handle_event("checkbox_click", %{"id" => id}, socket) do
    checked =
      if id in socket.assigns[:checked] do
        Enum.filter(socket.assigns[:checked], &(&1 != id))
      else
        [id | socket.assigns[:checked]]
      end

    {:noreply, assign(socket, checked: checked)}
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

  def table_simple_code do
    """
    <Table items={model <- @models_5}>
      <Column name="id" label="ID">
        {model.id}
      </Column>
      <Column name="name" label="Name">
        {model.name}
      </Column>
      <Column name="created_at" label="Created at">
        <Datetime value={model.created_at} />
      </Column>
    </Table>
    """
  end

  def table_headless_code do
    """
    <Table items={model <- @models_5} is_headless>
      <Column name="id">
        {model.id}
      </Column>
      <Column name="name">
        {model.name}
      </Column>
      <Column name="created_at">
        <Datetime value={model.created_at} />
      </Column>
    </Table>
    """
  end

  def table_borders_code do
    """
    <Table items={model <- @models_5} is_cell_border>
      <Column name="id" label="ID">
        {model.id}
      </Column>
      <Column name="name" label="Name">
        {model.name}
      </Column>
      <Column name="created_at" label="Created at">
        <Datetime value={model.created_at} />
      </Column>
    </Table>
    """
  end

  def table_gaps_code do
    """
    {#for gap <- ~w(border-spacing-y-0 border-spacing-y-1 border-spacing-y-2 border-spacing-y-4 border-spacing-y-8)}
      <Table items={model <- @models_5 |> Enum.slice(0, 2)} row_gap={gap}>
        <Column name="id" label="ID">
          {model.id}
        </Column>
        <Column name="name" label="Name">
          {model.name}
        </Column>
        <Column name="created_at" label="Created at">
          <Datetime value={model.created_at} />
        </Column>
      </Table>
    {/for}
    """
  end

  def table_sizes_code do
    """
    {#for size <- ~w(2xs xs sm md lg xl 2xl)}
      <Table items={model <- @models_5 |> Enum.slice(0, 2)} row_size={size}>
        <Column name="id" label="ID">
          {model.id}
        </Column>
        <Column name="name" label="Name">
          {model.name}
        </Column>
        <Column name="created_at" label="Created at">
          <Datetime value={model.created_at} />
        </Column>
      </Table>
    {/for}
    """
  end

  def table_clickable_code do
    """
    data selected, :list, default: []

    def render(assigns) do
      ~F\"""
      <Table items={model <- @models_5} row_click="single_row_click" {=@selected}>
        <Column name="id" label="ID">
          {model.id}
        </Column>
        <Column name="name" label="Name">
          {model.name}
        </Column>
        <Column name="created_at" label="Created at">
          <Datetime value={model.created_at} />
        </Column>
      </Table>
      \"""
    end

    def handle_event("single_row_click", %{"selected" => selected}, socket) do
      {:noreply, assign(socket, selected: [selected])}
    end
    """
  end

  def table_checkbox_code do
    """
    alias Moon.Components.Lego

    data checked, :list, default: []

    def render(assigns) do
      ~F\"""
      <Table items={model <- @models_5} selected={@checked}>
        <Column name="id" label="ID">
          <span :on-click="checkbox_click" :values={id: model.id} class="flex cursor-pointer">
            <Lego.Checkbox is_selected={"\#{model.id}" in @checked}/>
            <Lego.Title title={model.id}/>
          </span>
        </Column>
        <Column name="name" label="Name">
          {model.name}
        </Column>
        <Column name="created_at" label="Created at">
          <Datetime value={model.created_at} />
        </Column>
      </Table>
      \"""
    end


    def handle_event("checkbox_click", %{"id" => id}, socket) do
      checked = if id in socket.assigns[:checked] do
        Enum.filter(socket.assigns[:checked], &(&1 != id))
      else
        [id | socket.assigns[:checked]]
      end

      {:noreply, assign(socket, checked: checked)}
    end
    """
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
        <DateTime value={model.created_at} />
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
