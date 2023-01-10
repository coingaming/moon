defmodule MoonWeb.Pages.Components.Charts.LineChartPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias Moon.Components.LineChartCard
  alias Moon.Components.Link
  alias MoonWeb.Components.ExampleAndCode
  alias MoonWeb.Components.Page
  alias MoonWeb.Components.ComponentPageDescription

  data(breadcrumbs, :any,
    default: [
      %{
        to: "#",
        name: "Charts"
      },
      %{
        to: "/components/charts/line-chart",
        name: "Line Chart"
      }
    ]
  )

  def mount(_params, _session, socket) do
    filters = [
      %{
        label: "Active players",
        data_key: "actives",
        value: "3,174",
        color: "frieza",
        is_active: true
      },
      %{
        label: "Turnover",
        data_key: "turnover",
        value: "12,174.23",
        color: "krillin",
        is_active: true
      },
      %{
        label: "GGR",
        data_key: "ggr",
        value: "12,174.23",
        color: "roshi",
        is_active: false
      },
      %{
        label: "Bets",
        data_key: "bets",
        value: "3,174",
        color: "whis",
        is_active: true
      },
      %{
        label: "Margin",
        data_key: "margin",
        value: "5.38%",
        color: "chichi",
        is_active: false
      }
    ]

    socket =
      assign(socket,
        filters: filters,
        select_options: [
          [key: "by mobile", value: "mobile"],
          [key: "by desktop", value: "desktop"]
        ],
        values: generate_data(filters)
      )

    {:ok, socket}
  end

  def handle_params(_params, uri, socket) do
    {:noreply, assign(socket, uri: uri)}
  end

  def render(assigns) do
    ~F"""
    <Page {=@theme_name} {=@active_page} {=@breadcrumbs} {=@direction}>
      <ComponentPageDescription title="Line Chart">
        <p>
          Based on <Link to="https://vega.github.io/vega-lite/" target="_blank">Vega-Lite</Link>
        </p>
      </ComponentPageDescription>

      <ExampleAndCode layout="column" title="Default" id="line_chart_1">
        <:example>
          <LineChartCard
            id="line-chart-card"
            title="KPI Overview"
            time_format="%d/%m"
            {=@filters}
            {=@select_options}
            {=@values}
          />
        </:example>

        <:code>{line_chard_1_code()}</:code>

        <:state>@filters = {inspect(@filters, pretty: true)}<br><br>@values = {inspect(@values, pretty: true)}</:state>
      </ExampleAndCode>
    </Page>
    """
  end

  def generate_data(filters) do
    1..25
    |> Enum.to_list()
    |> Enum.flat_map(fn day ->
      filters
      |> Enum.map(fn filter ->
        %{
          x: "#{day}/06",
          y: Enum.random(30..100),
          category: filter.data_key
        }
      end)
    end)
  end

  def line_chard_1_code do
    """
      <LineChartCard
        id="line-chart-card"
        title="KPI Overview"
        time_format="%d/%m"
        {=@filters}
        {=@select_options}
        {=@values}
      />
    """
  end
end
