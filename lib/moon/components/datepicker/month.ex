defmodule Moon.Components.Datepicker.Month do
  use Moon.StatelessComponent

  prop date, :datetime, required: true

  def render(assigns) do
    ~H"""
    <div class="">
      <div class="text-center leading-4 mb-3">
        {{ Timex.format!(@date, "%B %Y", :strftime) }}
      </div>

      <div
        class="grid text-xs text-center"
        style="grid-template-columns: repeat(7, 1fr);"
      >
        <div :for={{ _cell <- empty_cells(@date) }}></div>

        <div :for={{ day <- month_days(@date) }} class="hover:bg-hover rounded-full h-8 w-8 flex items-center justify-center cursor-pointer">
          {{ Timex.format!(day, "%-d", :strftime) }}
        </div>
      </div>
    </div>
    """
  end

  defp empty_cells(date) do
    days_count =
      date
      |> Timex.beginning_of_month()
      |> Timex.days_to_beginning_of_week()

    if days_count == 0, do: [], else: 1..days_count
  end

  defp month_days(date) do
    Timex.Interval.new(
      from: Timex.beginning_of_month(date),
      until: Timex.end_of_month(date),
      left_open: false,
      right_open: false
    )
  end
end
