defmodule MoonWeb.Pages.ExamplePages.Components.BarChartWidget do
  use MoonWeb, :stateless_component

  alias Moon.Components.Card
  alias Moon.Components.IconButton

  prop widget, :map, required: true
  prop bar_bg_color, :string, default: "bg-roshi-100"
  prop class, :string
  prop edited, :boolean, default: false
  prop on_refresh, :event
  prop on_remove, :event

  def render(assigns) do
    ~F"""
    <Card title={@widget.name} class={@class}>
      <:buttons>
        <IconButton
          icon_name="icon_refresh"
          height={8}
          width={8}
          click={@on_refresh}
          value_name="name"
          value={@widget.name}
          class={if @edited, do: "hidden"}
        />

        <IconButton
          icon_name="icon_arrow_diagonals"
          height={8}
          width={8}
          title="TODO: Expand"
          class={if @edited, do: "hidden"}
        />

        <IconButton
          icon_name="icon_pencil"
          height={8}
          width={8}
          title="TODO: Edit"
          class={unless @edited, do: "hidden"}
        />

        <IconButton
          icon_name="icon_delete"
          height={8}
          width={8}
          title="TODO: Delete"
          click={@on_remove}
          value_name="name"
          value={@widget.name}
          class={unless @edited, do: "hidden"}
        />
      </:buttons>

      <:content>
        <div class="space-y-6">
          <div :for.with_index={{line, line_index} <- sorted_lines(@widget.data)} class="flex py-2 gap-x-4">
            <div class="flex-shrink-0 text-trunks-100">
              {line_index + 1}
            </div>

            <div class="w-48">
              {line.name}
            </div>

            <div class="flex-1 flex items-center justify-end">
              <div
                class={"h-2 rounded-l #{@bar_bg_color}"}
                style={"width: #{calc_bar_width(line.amount, @widget.data)}%;"}
              ></div>
            </div>

            <div class={
              "w-10 flex-shrink-0 text-right whitespace-nowrap",
              "text-roshi-100": line.change > 0,
              "text-chi-chi-100": line.change <= 0
            }>
              <span :if={line.change > 0}>+</span>{line.change}%
            </div>

            <div class="flex-shrink-0 w-16 text-right">
              {line.amount}
            </div>
          </div>
        </div>
      </:content>
    </Card>
    """
  end

  defp sorted_lines(lines) do
    Enum.sort_by(lines, & &1.amount, :desc)
  end

  defp calc_bar_width(amount, lines) do
    max_amount = calc_max_amount(lines)
    amount / max_amount * 100
  end

  defp calc_max_amount(lines) do
    lines
    |> Enum.max_by(& &1.amount)
    |> Map.get(:amount)
  end
end
