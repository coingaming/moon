defmodule MoonWeb.Pages.ExamplePages.Components.BarChartWidget do
  use MoonWeb, :stateless_component

  alias Moon.Assets.Icon
  alias Moon.Components.Card
  alias Moon.Components.MenuButton

  prop title, :string, required: true
  prop lines, :list, default: []
  prop bar_bg_color, :string, default: "bg-roshi-100"

  def render(assigns) do
    ~F"""
    <Card title={@title}>
      <:buttons>
        <MenuButton height={8} width={8}>
          <Icon name="icon_refresh" />
        </MenuButton>

        <MenuButton height={8} width={8}>
          <Icon name="icon_arrow_diagonals" />
        </MenuButton>
      </:buttons>

      <:content>
        <div class="space-y-6">
          <div :for.with_index={{line, index} <- sorted_lines(@lines)} class="flex py-2 gap-x-4">
            <div class="text-trunks-100">
              {index + 1}
            </div>

            <div class="flex-grow">
              {line.name}
            </div>

            <div class="flex-shrink-0 flex items-center justify-end w-56">
              <div
                class={"h-2 rounded-l #{@bar_bg_color}"}
                style={"width: #{calc_bar_width(line.value, @lines)}%;"}
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
