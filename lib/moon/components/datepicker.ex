defmodule Moon.Components.Datepicker do
  use Moon.StatefulComponent
  alias Moon.Assets.Icons.IconChevronLeft
  alias Moon.Assets.Icons.IconChevronRight
  alias Moon.Components.Button
  alias Moon.Components.Datepicker.Month

  @default_label "Select Dates"

  @ranges %{
    lastMonth: 'Last month',
    lastWeek: 'Last week',
    last24hours: 'Last 24 hours',
    yesterday: 'Yesterday',
    today: 'Today',
    tomorrow: 'Tomorrow',
    thisWeek: 'This week',
    nextWeek: 'Next week',
    thisMonth: 'This month',
    nextMonth: 'Next month'
  }

  prop start_date, :datetime, default: Timex.today()
  prop end_date, :datetime
  prop with_time, :boolean, default: false
  prop week_starts_on, :integer, default: 1
  prop on_date_change, :event

  prop ranges, :list,
    default: ~w(lastMonth lastWeek yesterday thisWeek thisMonth last24hours today)

  data show, :boolean, default: false
  data selected_range, :string, default: "thisWeek"
  data left_panel_date, :datetime, default: Timex.today()

  def render(assigns) do
    ~H"""
    <div class="relative block">
      <Button
        variant="tertiary"
        on_click="toggle_picker"
      >
        {{ label(@start_date, @end_date) }}
      </Button>

      <div
        class={{
          "origin-top-left absolute left-0 bg-goku-100 flex items-start shadow-lg rounded-xl text-sm",
          hidden: !@show
        }}
      >
        <!-- Ranges -->
        <div :if={{ length(@ranges) >0 }} class="py-2 px-1 space-y-1 w-60">
          <div
            :for={{ range <- @ranges }}
            class={{
              "py-2 px-3 hover:bg-hover rounded-md cursor-pointer",
              "bg-hover": range == @selected_range
            }}
            :on-click="select_range"
            phx-value-range={{ range }}
          >
            {{ range_label(range) }}
          </div>
        </div>

        <!-- Content -->
        <div class="p-4">
          <!-- Months -->
          <div class="flex">
            <!-- First Month -->
            <div class="relative px-4">
              <button
                class="absolute left-6 leading-none"
                :on-click="shift_months"
                phx-value-months={{ -2 }}
              >
                <IconChevronLeft class="block" font_size="1rem"/>
              </button>

              <Month
                date={{ @left_panel_date }}
                start_date={{ @start_date }}
                end_date={{ @end_date }}
              />
            </div>

            <!-- Second Month -->
            <div class="relative px-4">
              <button
                class="absolute right-6 leading-none"
                :on-click="shift_months"
                phx-value-months={{ 2 }}
              >
                <IconChevronRight class="block" font_size="1rem"/>
              </button>

              <Month
                date={{ Timex.shift(@left_panel_date, months: 1) }}
                start_date={{ @start_date }}
                end_date={{ @end_date }}
              />
            </div>
          </div>
        </div>
      </div>
    </div>
    """
  end

  defp label(nil, _), do: @default_label
  defp label(_, nil), do: @default_label

  defp label(_start_date, _end_date) do
    "Foo Bar"
  end

  defp dates_from_range("lastMonth") do
    date = Timex.today() |> Timex.shift(months: -1)
    {Timex.beginning_of_month(date), Timex.end_of_month(date)}
  end

  defp dates_from_range("thisMonth") do
    date = Timex.today()
    {Timex.beginning_of_month(date), Timex.end_of_month(date)}
  end

  defp dates_from_range("nextMonth") do
    date = Timex.today() |> Timex.shift(months: 1)
    {Timex.beginning_of_month(date), Timex.end_of_month(date)}
  end

  defp dates_from_range("lastWeek") do
    date = Timex.today() |> Timex.shift(weeks: -1)
    {Timex.beginning_of_week(date), Timex.end_of_week(date)}
  end

  defp dates_from_range("thisWeek") do
    date = Timex.today()
    {Timex.beginning_of_week(date), Timex.end_of_week(date)}
  end

  defp dates_from_range("nextWeek") do
    date = Timex.today() |> Timex.shift(weeks: 1)
    {Timex.beginning_of_week(date), Timex.end_of_week(date)}
  end

  defp dates_from_range("last24hours") do
    date = Timex.now()
    {Timex.shift(date, hours: -24), date}
  end

  defp dates_from_range("yesterday") do
    date = Timex.now() |> Timex.shift(days: -1)
    {Timex.beginning_of_day(date), Timex.end_of_day(date)}
  end

  defp dates_from_range("today") do
    date = Timex.now()
    {Timex.beginning_of_day(date), Timex.end_of_day(date)}
  end

  defp dates_from_range("tomorrow") do
    date = Timex.now() |> Timex.shift(days: 1)
    {Timex.beginning_of_day(date), Timex.end_of_day(date)}
  end

  defp range_label(range_name) when is_binary(range_name) do
    @ranges[String.to_atom(range_name)]
  end

  def handle_event("toggle_picker", _, socket) do
    {:noreply, assign(socket, show: !socket.assigns.show)}
  end

  def handle_event("select_range", %{"range" => range}, socket) do
    {start_date, end_date} = dates_from_range(range)

    socket =
      assign(socket,
        selected_range: range,
        left_panel_date: start_date,
        start_date: start_date,
        end_date: end_date
      )

    {:noreply, socket}
  end

  def handle_event("shift_months", %{"months" => months}, socket) do
    months = String.to_integer(months)
    left_panel_date = Timex.shift(socket.assigns.left_panel_date, months: months)

    socket = assign(socket, left_panel_date: left_panel_date)
    {:noreply, socket}
  end
end
