defmodule MoonWeb.Examples.Parts.ChartExample.Default do
  @moduledoc false

  use Moon.StatelessComponent

  use MoonWeb, :example

  alias Moon.Parts.Chart

  def render(assigns) do
    ~F"""
    <Chart>
      <Chart.AxisX labels={~w(one two three five)} />
      <Chart.AxisY labels={1..5 |> Enum.to_list() |> Enum.map(&(&1 * 100))} />
      <Chart.Field min={100} max={500}>
        <Chart.Histo data={[411, 370, 456, 376]} color="bg-hit" class="translate-x-1" />
        <Chart.Histo data={[311, 270, 406, 176]} color="bg-krillin" class="-translate-x-1" />
      </Chart.Field>
    </Chart>
    """
  end

  def code() do
    """

    """
  end
end
