defmodule Moon.Components.Calendar.Week do
  use Moon.StatelessComponent

  prop date, :datetime, required: true
  prop week_starts_on, :integer, default: 1

  def render(assigns) do
    ~F"""
    <div
      class="grid gap-1"
      style="grid-template-columns: repeat(7, minmax(3rem, 1fr)); min-height: 75vh;"
    >
      <div :for={day <- week_days(@date, @week_starts_on)} class="relative rounded-lg bg-gohan-100">
        <div class={
          "absolute text-xxs md:text-base lg:text-lg leading-none top-2 right-3",
          "text-piccolo-100": Timex.to_date(day) == Timex.today()
        }>
          {day_label(day)}
        </div>
      </div>
    </div>
    """
  end

  defp week_days(date, weekstart) do
    Timex.Interval.new(
      from: Timex.beginning_of_week(date, weekstart),
      until: Timex.end_of_week(date, weekstart),
      left_open: false,
      right_open: false
    )
  end

  defp day_label(date) do
    day = Timex.format!(date, "%-d", :strftime)
    if day == "1", do: Timex.format!(date, "%b %-d", :strftime), else: day
  end
end
