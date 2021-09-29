defmodule Moon.Components.Datepicker.Month do
  @moduledoc false

  use Moon.StatelessComponent

  prop date, :date, required: true
  prop start_date, :date
  prop end_date, :date
  prop week_starts_on, :integer
  prop on_click, :event

  def render(assigns) do
    ~F"""
    <div>
      <div class="mb-4 leading-4 text-center">
        {Timex.format!(@date, "%B %Y", :strftime)}
      </div>

      <div class="flex mb-1 text-xs font-semibold text-center text-trunks-100">
        <div :for={ch <- days_letters(@week_starts_on)} class="flex items-center justify-center w-8 h-8">
          {ch}
        </div>
      </div>

      <div class="grid text-xs gap-y-1" style="grid-template-columns: repeat(7, minmax(2rem, 2rem));">
        <div :for={_cell <- empty_cells(@date, @week_starts_on)} />

        <div
          :for={day <- month_days(@date)}
          class={"cursor-pointer #{day_container_class(day, @start_date, @end_date, @week_starts_on)}"}
        >
          <div
            class={"border border-transparent hover:border-trunks-100 rounded h-8 w-8 flex items-center justify-center #{
              day_class(day, @start_date, @end_date)
            }"}
            :on-click={@on_click}
            phx-value-date={Timex.format!(day, "%Y-%0m-%0dT%R", :strftime)}
          >
            {Timex.format!(day, "%-d", :strftime)}
          </div>
        </div>
      </div>
    </div>
    """
  end

  def days_letters(weekstart) do
    date = Timex.today()

    Timex.Interval.new(
      from: Timex.beginning_of_week(date, weekstart),
      until: Timex.end_of_week(date, weekstart),
      left_open: false,
      right_open: false
    )
    |> Enum.map(fn day ->
      Timex.format!(day, "%a", :strftime) |> String.at(0)
    end)
  end

  defp empty_cells(date, weekstart) do
    days_count =
      date
      |> Timex.beginning_of_month()
      |> Timex.days_to_beginning_of_week(weekstart)

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

  defp day_container_class(_day, nil, _, _), do: nil

  defp day_container_class(day, start_date, nil, _) do
    if Timex.to_date(day) == Timex.to_date(start_date) do
      "bg-goku-100 rounded"
    end
  end

  defp day_container_class(day, start_date, end_date, week_starts_on) do
    date_day = Timex.to_date(day)
    start_day = Timex.to_date(start_date)
    end_day = Timex.to_date(end_date)

    cond do
      date_day == start_day && date_day == end_day ->
        nil

      date_day == start_day ->
        "bg-goku-100 rounded"

      date_day == end_day ->
        "bg-goku-100 rounded"

      Timex.between?(day, start_date, end_date) ->
        week_start_class(day, week_starts_on)

      true ->
        nil
    end
  end

  defp week_start_class(day, week_starts_on) do
    cond do
      Timex.weekday(day) == week_starts_on -> "bg-goku-100 rounded-l"
      Timex.weekday(day) == week_starts_on + 6 -> "bg-goku-100 rounded-r"
      true -> "bg-goku-100"
    end
  end

  defp day_class(_day, nil, _), do: nil

  defp day_class(day, start_date, end_date) do
    if Timex.to_date(day) in [Timex.to_date(start_date), Timex.to_date(end_date)],
      do: "bg-piccolo-100 text-goten-100",
      else: nil
  end
end
