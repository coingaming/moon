defmodule Moon.Components.Calendar do
  @moduledoc false

  use Moon.StatefulComponent
  alias Moon.Assets.Icons.IconChevronLeftRounded
  alias Moon.Assets.Icons.IconChevronRightRounded
  alias Moon.Components.Button
  alias Moon.Components.Calendar.Month
  alias Moon.Components.Calendar.Week

  prop(week_starts_on, :integer, default: 1, values: Enum.to_list(1..7))
  prop(events, :list, default: [])
  data(date, :datetime, default: Timex.today())
  data(show_month, :boolean, default: true)

  def render(assigns) do
    ~F"""
    <div class="min-w-min">
      <div class="flex items-center mb-6">
        <Button class="font-semibold rounded-lg" variant="tertiary" on_click="set_today">
          Today
        </Button>

        <button type="button" class="ml-6" :on-click="shift_range" phx-value-shift={-1}>
          <IconChevronLeftRounded class="block" font_size="1rem" />
        </button>

        <button type="button" class="ml-5 mr-6" :on-click="shift_range" phx-value-shift={1}>
          <IconChevronRightRounded class="block" font_size="1rem" />
        </button>

        <div>
          {calendar_title(@date, @week_starts_on, @show_month)}
        </div>

        <div class="grow text-right">
          <Button class="font-semibold rounded-lg" variant="tertiary" on_click="toggle_view">
            <span :if={@show_month}>
              Month
            </span>
            <span :if={!@show_month}>
              Week
            </span>
          </Button>
        </div>
      </div>

      <div class="flex text-moon-12 text-center text-trunks-100">
        <div :for={day_name <- days_names(@week_starts_on)} class="flex-1 py-3">
          {day_name}
        </div>
      </div>

      <Month :if={@show_month} date={@date} week_starts_on={@week_starts_on} events={@events} />

      <Week :if={!@show_month} date={@date} week_starts_on={@week_starts_on} />
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

  defp calendar_title(date, _, true), do: Timex.format!(date, "%B %Y", :strftime)

  defp calendar_title(date, weekstart, false) do
    date
    |> Timex.beginning_of_week(weekstart)
    |> calendar_title(weekstart, true)
  end

  def handle_event("set_today", _, socket) do
    {:noreply, assign(socket, date: Timex.today())}
  end

  def handle_event("shift_range", %{"shift" => shift}, socket) do
    shift = String.to_integer(shift)

    if socket.assigns.show_month do
      {:noreply, update(socket, :date, &Timex.shift(&1, months: shift))}
    else
      {:noreply, update(socket, :date, &Timex.shift(&1, weeks: shift))}
    end
  end

  def handle_event("toggle_view", _, socket) do
    date = socket.assigns.date

    date =
      if socket.assigns.show_month do
        Timex.beginning_of_week(date, socket.assigns.week_starts_on)
      else
        date
      end

    {:noreply, assign(socket, show_month: !socket.assigns.show_month, date: date)}
  end
end
