defmodule MoonWeb.Pages.ExamplePages.Components.BarChartWidget do
  use MoonWeb, :stateless_component

  alias Moon.Components.Card
  alias Moon.Components.IconButton

  prop widget, :map, required: true
  prop bar_bg_color, :string, default: "bg-roshi-100"
  prop on_refresh, :event

  def render(assigns) do
    ~F"""
    <Card title={@widget.title}>
      <:buttons>
        <IconButton
          icon_name="icon_refresh"
          height={8}
          width={8}
          click={@on_refresh}
          value_name="index"
          value={@widget.index}
        />

        <IconButton icon_name="icon_arrow_diagonals" height={8} width={8} />
      </:buttons>

      <:content>
        <div class="space-y-6">
          <div :for.with_index={{line, line_index} <- sorted_lines(@widget.data)} class="flex py-2 gap-x-4">
            <div class="text-trunks-100">
              {line_index + 1}
            </div>

            <div class="flex-grow">
              {line.name}
            </div>

            <div class="flex-shrink-0 flex items-center justify-end w-56">
              <div
                class={"h-2 rounded-l #{@bar_bg_color}"}
                style={"width: #{calc_bar_width(line.value, @widget.data)}%;"}
              ></div>
            </div>


            <div class={
              "w-10 flex-shrink-0 text-right whitespace-nowrap",
              "text-roshi-100": line.change > 0,
              "text-chi_chi-100": line.change <= 0
            }>
              <span :if={line.change > 0}>+</span>{line.change}%
            </div>

            <div class="flex-shrink-0 w-16 text-right">
              {line.value}
            </div>
          </div>
        </div>
      </:content>
    </Card>
    """
  end

  defp sorted_lines(lines) do
    Enum.sort_by(lines, & &1.value, :desc)
  end

  defp calc_bar_width(value, lines) do
    max_value = calc_max_value(lines)
    value / max_value * 100
  end

  defp calc_max_value(lines) do
    lines
    |> Enum.max_by(& &1.value)
    |> Map.get(:value)
  end
end
