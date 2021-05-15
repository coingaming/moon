defmodule Moon.Components.Calendar do
  use Moon.StatelessComponent

  prop week_starts_on, :integer, default: 1

  def render(assigns) do
    ~H"""
    <div class="w-full">
      <div class="flex text-center text-trunks-100 text-xs">
        <div :for={{ day_name <- days_names(@week_starts_on) }} class="py-3 flex-1">
          {{ day_name }}
        </div>
      </div>

      <div
        class="grid gap-1"
        style="grid-template-columns: repeat(7, auto);"
      >

        <div
          :for={{ day <- month_days(Timex.today()) }}
          class="rounded-lg bg-goten-100 relative"
          style="padding-top: 100%;"
        >
          <div
            class="text-xl absolute top-3 right-3 leading-none"
          >
            {{ Timex.format!(day, "%-d", :strftime) }}
          </div>
        </div>
      </div>

    </div>
    """
  end

  defp days_names(weekstart) do
    date = Timex.today()

    Timex.Interval.new(
      from: Timex.beginning_of_week(date, weekstart),
      until: Timex.end_of_week(date, weekstart),
      left_open: false,
      right_open: false
    )
    |> Enum.map(fn day ->
      Timex.format!(day, "%a", :strftime)
    end)
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
