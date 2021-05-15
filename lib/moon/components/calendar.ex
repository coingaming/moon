defmodule Moon.Components.Calendar do
  use Moon.StatefulComponent
  alias Moon.Assets.Icons.IconChevronLeftRounded
  alias Moon.Assets.Icons.IconChevronRightRounded
  alias Moon.Components.Button

  prop week_starts_on, :integer, default: 1, values: Enum.to_list(1..7)
  data date, :datetime, default: Timex.today()

  def render(assigns) do
    ~H"""
    <div class="w-full">
      <div class="flex items-center mb-6">
        <Button
          class="font-semibold rounded-lg"
          variant="secondary"
          size="small"
          on_click="set_today"
        >
          Today
        </Button>

        <button
          type="button"
          class="leading-none"
          :on-click="shift_months"
          phx-value-months={{ -1 }}
        >
          <IconChevronLeftRounded class="block" font_size="1rem"/>
        </button>

        <button
          type="button"
          class="leading-none"
          :on-click="shift_months"
          phx-value-months={{ 1 }}
        >
          <IconChevronRightRounded class="block" font_size="1rem"/>
        </button>
      </div>

      <div class="flex text-xs text-center text-trunks-100">
        <div :for={{ day_name <- days_names(@week_starts_on) }} class="flex-1 py-3">
          {{ day_name }}
        </div>
      </div>

      <div
        class="grid gap-1"
        style="grid-template-columns: repeat(7, auto);"
      >
        <div
          class="relative rounded-lg bg-goten-100"
          style="padding-top: 100%;"
          :for={{ day <- previous_month_days(@date, @week_starts_on) }}
        >
          <div
            class="absolute text-lg leading-none text-trunks-100 top-3 right-3"
          >
            {{ day_label(day) }}
          </div>
        </div>

        <div
          :for={{ day <- month_days(@date) }}
          class="relative rounded-lg bg-goten-100"
          style="padding-top: 100%;"
        >
          <div
            class="absolute text-lg leading-none top-3 right-3"
          >
            {{ day_label(day) }}
          </div>
        </div>

        <div
          class="relative rounded-lg bg-goten-100"
          style="padding-top: 100%;"
          :for={{ day <- next_month_days(@date, @week_starts_on) }}
        >
          <div
            class="absolute text-lg leading-none text-trunks-100 top-3 right-3"
          >
            {{ day_label(day) }}
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

  defp day_label(date) do
    day = Timex.format!(date, "%-d", :strftime)
    if day == "1", do: Timex.format!(date, "%b %-d", :strftime), else: day
  end

  def handle_event("set_today", _, socket) do
    {:noreply, assign(socket, date: Timex.today())}
  end

  def handle_event("shift_months", %{"months" => months}, socket) do
    months = String.to_integer(months)
    {:noreply, update(socket, :date, &(Timex.shift(&1, months: months)))}
  end
end
