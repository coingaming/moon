defmodule Moon.Components.Calendar do
  use Moon.StatefulComponent
  alias Moon.Assets.Icons.IconChevronLeftRounded
  alias Moon.Assets.Icons.IconChevronRightRounded
  alias Moon.Components.Button
  alias Moon.Components.Calendar.Month

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

      <Month
        :if={{ @show_month }}
        date={{ @date }}
        week_starts_on={{ @week_starts_on }}
      />
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
