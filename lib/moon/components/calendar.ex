defmodule Moon.Components.Calendar do
  use Moon.StatefulComponent
  alias Moon.Assets.Icons.IconChevronLeftRounded
  alias Moon.Assets.Icons.IconChevronRightRounded
  alias Moon.Components.Button
  alias Moon.Components.Calendar.Day

  prop week_starts_on, :integer, default: 1, values: Enum.to_list(1..7)
  data date, :datetime, default: Timex.today()
  data show_month, :boolean, default: true

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
          class="leading-none ml-6"
          :on-click="shift_months"
          phx-value-months={{ -1 }}
        >
          <IconChevronLeftRounded class="block" font_size="1rem"/>
        </button>

        <button
          type="button"
          class="leading-none ml-5 mr-6"
          :on-click="shift_months"
          phx-value-months={{ 1 }}
        >
          <IconChevronRightRounded class="block" font_size="1rem"/>
        </button>

        <div>
          {{ Timex.format!(@date, "%B %Y", :strftime) }}
        </div>

        <div class="flex-grow text-right">
          <Button
            class="font-semibold rounded-lg"
            variant="secondary"
            size="small"
            on_click="toggle_view"
          >
            <span :if={{ @show_month }}>
              Month
            </span>
            <span :if={{ !@show_month }}>
              Week
            </span>
          </Button>
        </div>
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
        <Day
          :for={{ day <- previous_month_days(@date, @week_starts_on) }}
          day={{ day }}
          text_color="text-trunks-100"
        />

        <Day
          :for={{ day <- month_days(@date) }}
          day={{ day }}
          text_color={{ if Timex.to_date(day) == Timex.today(), do: "text-piccolo-100" }}
        />

        <Day
          :for={{ day <- next_month_days(@date, @week_starts_on) }}
          day={{ day }}
          text_color="text-trunks-100"
        />
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

  def handle_event("set_today", _, socket) do
    {:noreply, assign(socket, date: Timex.today())}
  end

  def handle_event("shift_months", %{"months" => months}, socket) do
    months = String.to_integer(months)
    {:noreply, update(socket, :date, &(Timex.shift(&1, months: months)))}
  end

  def handle_event("toggle_view", _, socket) do
    {:noreply, assign(socket, show_month: !socket.assigns.show_month)}
  end
end
