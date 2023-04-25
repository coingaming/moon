defmodule MoonWeb.Pages.Design.TablePage do
  @moduledoc false

  use MoonWeb, :live_view

  alias Moon.Design.Table
  alias Moon.Design.Table.Column
  alias Moon.Components.Renderers.Datetime
  alias MoonWeb.Components.ExampleAndCode
  alias MoonWeb.Components.Page
  alias MoonWeb.Components.ComponentPageDescription
  alias MoonWeb.Components.PropsTable
  alias Moon.Components.Lego

  alias MoonWeb.Components.ExamplesList
  alias MoonWeb.Examples.Design.TableExample

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

  data(checked, :list, default: [])

  @spec render(any) :: Phoenix.LiveView.Rendered.t()
  def render(assigns) do
    ~F"""
    <Page {=@theme_name} {=@active_page} {=@breadcrumbs} {=@direction}>
      <ComponentPageDescription title="Table" is_in_progress image="facing/components/table.png">
        <p>
          A component for displaying large amounts of data in rows and columns.
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

      <ExamplesList examples={[
        TableExample.Sorting,
        TableExample.Responsive
      ]} />

      <PropsTable title="Table props" module={Table} />
      <PropsTable title="Table.Column props" module={Table.Column} />
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

  def handle_event("handle_paging_click", %{"offset" => offset}, socket) do
    offset = String.to_integer(offset)
    socket = assign(socket, offset: offset)
    socket = refresh_models(socket)
    {:noreply, socket}
  end

  def handle_event("set_close", _, socket) do
    {:noreply, assign(socket, selected: nil)}
  end

  def refresh_models(socket) do
    %{
      limit: limit,
      offset: offset,
      all_models: all_models
    } = socket.assigns

    models =
      all_models
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
end
