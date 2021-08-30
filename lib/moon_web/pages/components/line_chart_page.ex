defmodule MoonWeb.Pages.Components.LineChartPage do
  use MoonWeb, :live_view
  alias Moon.Autolayouts.TopToDown
  alias MoonWeb.Components.ExampleAndCode
  alias Moon.Components.CodePreview
  alias Moon.Components.Heading
  alias Moon.Components.LineChartCard
  alias Moon.Components.Link
  alias MoonWeb.Components.Breadcrumbs

  data breadcrumbs, :any,
    default: [
      %{
        to: "#",
        name: "Charts"
      },
      %{
        to: "/components/line-chart",
        name: "Line Chart"
      }
    ]

  def mount(params, _session, socket) do
    filters = [
      %{
        label: "Active players",
        data_key: "actives",
        value: "3,174",
        color: "frieza.100",
        is_active: true
      },
      %{
        label: "Turnover",
        data_key: "turnover",
        value: "12,174.23",
        color: "krillin.100",
        is_active: true
      },
      %{
        label: "GGR",
        data_key: "ggr",
        value: "12,174.23",
        color: "roshi.100",
        is_active: false
      },
      %{
        label: "Bets",
        data_key: "bets",
        value: "3,174",
        color: "whis.100",
        is_active: true
      },
      %{
        label: "Margin",
        data_key: "margin",
        value: "5.38%",
        color: "chiChi.100",
        is_active: false
      }
    ]

    socket =
      assign(socket,
        theme_name: params["theme_name"] || "sportsbet-dark",
        active_page: __MODULE__,
        filters: filters,
        select_options: [
          [key: "by mobile", value: "mobile"],
          [key: "by desktop", value: "desktop"]
        ],
        values: generate_data(filters)
      )

    {:ok, socket}
  end

  def render(assigns) do
    ~F"""
    <TopToDown>
      <Breadcrumbs breadcrumbs={@breadcrumbs} class="mb-2" />
      <Heading size={32}>LineChart</Heading>

      <p>
        <Link to="https://github.com/coingaming/moon/blob/master/lib/moon_web/pages/components/line_chart_page.ex">Sourcecode of this page</Link>
        <Link to="https://moon.io/charts/lineChart">React implementation</Link>
      </p>

      <p>
        Based on <a href="https://vega.github.io/vega-lite/" class="moon-link" target="_blank">Vega-Lite</a>
      </p>

      <ExampleAndCode show_state layout="column" id="line_chart_1">
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

        <:code>
          <#CodePreview>
        alias Moon.Components.ChartCard

        <LineChartCard
          id="line-chart-card"
          title="KPI Overview"
          time_format="%d/%m"
          {=@filters}
          {=@select_options}
          {=@values}
        />
      </#CodePreview>
        </:code>

        <:state>@filters = {inspect(@filters, pretty: true)}<br><br>@values = {inspect(@values, pretty: true)}</:state>
      </ExampleAndCode>
    </TopToDown>
    """
  end

  defp generate_data(filters) do
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
end
