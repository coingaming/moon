defmodule Moon.Components.Calendar.Month do
  @moduledoc false

  use Moon.StatelessComponent
  alias Moon.Components.Calendar.Day

  prop date, :datetime, required: true
  prop week_starts_on, :integer, default: 1
  prop events, :list, default: []

  def render(assigns) do
    ~F"""
    <div class="grid gap-1" style="grid-template-columns: repeat(7, minmax(2rem, auto));">
      <Day
        :for={day <- previous_month_days(@date, @week_starts_on)}
        day={day}
        text_color="text-trunks-100"
        events={filtered_events(@events, day)}
      />

      <Day
        :for={day <- month_days(@date)}
        day={day}
        text_color={if Timex.to_date(day) == Timex.today(), do: "text-piccolo-100"}
        events={filtered_events(@events, day)}
      />

      <Day
        :for={day <- next_month_days(@date, @week_starts_on)}
        day={day}
        text_color="text-trunks-100"
        events={filtered_events(@events, day)}
      />
    </div>
    """
  end

  defp month_days(date) do
    Timex.Interval.new(
      from: Timex.beginning_of_month(date),
      until: Timex.end_of_month(date),
      left_open: false,
      right_open: false
    )
  end

  defp previous_month_days(date, weekstart) do
    month_starts_at = Timex.beginning_of_month(date)
    week_starts_at = Timex.beginning_of_week(month_starts_at, weekstart)

    if month_starts_at == week_starts_at do
      []
    else
      Timex.Interval.new(
        from: week_starts_at,
        until: month_starts_at,
        left_open: false,
        right_open: true
      )
    end
  end

  defp next_month_days(date, weekstart) do
    month_ends_at = Timex.end_of_month(date)
    week_ends_at = Timex.end_of_week(month_ends_at, weekstart)

    if month_ends_at == week_ends_at do
      []
    else
      Timex.Interval.new(
        from: month_ends_at,
        until: week_ends_at,
        left_open: true,
        right_open: false
      )
    end
  end

  defp filtered_events([], _), do: []

  defp filtered_events(events, day) do
    events
    |> Enum.filter(fn event ->
      Timex.to_date(event.started_at) == Timex.to_date(day)
    end)
    |> Enum.sort_by(& &1.started_at, {:asc, NaiveDateTime})
  end
end
