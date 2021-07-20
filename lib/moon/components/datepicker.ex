defmodule Moon.Components.Datepicker do
  use Moon.StatefulComponent
  alias Moon.Assets.Icons.IconChevronLeft
  alias Moon.Assets.Icons.IconChevronRight
  alias Moon.Components.Button
  alias Moon.Components.Datepicker.Month
  alias Surface.Components.Form.DateInput
  alias Surface.Components.Form.DateTimeLocalInput

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

  prop with_time, :boolean, default: false
  prop week_starts_on, :integer, default: 1, values: Enum.to_list(1..7)
  prop start_date_field, :atom, default: :start_date
  prop end_date_field, :atom, default: :end_date
  prop on_date_change, :string, default: "update_dates"
  prop button_class, :string, default: "mt-4"

  prop ranges, :list,
    default: ~w(lastMonth lastWeek yesterday thisWeek thisMonth last24hours today)

  data show, :boolean, default: false
  data selected_range, :string, default: "thisMonth"
  data left_panel_date, :datetime, default: Timex.today()

  prop start_date, :datetime, default: nil
  prop end_date, :datetime, default: nil

  def render(assigns) do
    ~F"""
    {asset_import @socket, "js/components/text-input"}
    {asset_import @socket, "js/tailwind"}

    <div class="relative block">
      <Button
        class={"font-normal #{@button_class}"}
        variant="tertiary"
        on_click="toggle_picker"
        rounded
      >
        {button_label(@start_date, @end_date, @with_time, @selected_range)}
      </Button>

      <div
        class={
          "py-4 px-5 origin-top-left absolute left-0 bg-goku-100 flex shadow-lg rounded-xl text-sm z-10 mt-2",
          hidden: !@show
        }
      >
        <!-- Ranges -->
        <div :if={length(@ranges) >0} class="space-y-1 w-44">
          <div
            :for={range <- @ranges}
            class={
              "py-2 px-3 hover:bg-hover rounded-lg cursor-pointer",
              "bg-hover": range == @selected_range
            }
            :on-click="select_range"
            phx-value-range={range}
          >
            {range_label(range)}
          </div>
        </div>

        <!-- Content -->
        <div class="flex flex-col pt-2 pl-4">
          <!-- Months -->
          <div class="flex flex-grow space-x-6">
            <!-- First Month -->
            <div class="relative flex flex-col items-center">
              <button
                type="button"
                class="absolute leading-none left-6"
                :on-click="shift_months"
                phx-value-months={-2}
              >
                <IconChevronLeft class="block" font_size="1rem"/>
              </button>

              <div class="flex-grow">
                <Month
                  date={@left_panel_date}
                  start_date={@start_date}
                  end_date={@end_date}
                  week_starts_on={@week_starts_on}
                  on_click="select_date"
                />
              </div>

              <DateTimeLocalInput
                :if={@with_time}
                field={@start_date_field}
                class="w-60 mt-4 rounded-lg moon-text-input border-beerus-100"
                opts={
                  placeholder: "dd/mm/yyyy, --:--",
                  "phx-hook": "Datepicker",
                  "data-pending-val": format_date(@start_date, @with_time)
                }
              />

              <DateInput
                :if={!@with_time}
                field={@start_date_field}
                class="w-60 mt-4 rounded-lg moon-text-input border-beerus-100"
                opts={
                  placeholder: "dd/mm/yyyy",
                  "phx-hook": "Datepicker",
                  "data-pending-val": format_date(@start_date, @with_time)
                }
              />
            </div>

            <!-- Second Month -->
            <div class="relative flex flex-col items-center">
              <button
                type="button"
                class="absolute leading-none right-6"
                :on-click="shift_months"
                phx-value-months={2}
              >
                <IconChevronRight class="block" font_size="1rem"/>
              </button>

              <div class="flex-grow">
                <Month
                  date={Timex.shift(@left_panel_date, months: 1)}
                  start_date={@start_date}
                  end_date={@end_date}
                  week_starts_on={@week_starts_on}
                  on_click="select_date"
                />
              </div>

              <DateTimeLocalInput
                :if={@with_time}
                field={@end_date_field}
                class="w-60 mt-4 rounded-lg moon-text-input border-beerus-100"
                opts={
                  placeholder: "dd/mm/yyyy, --:--",
                  "phx-hook": "Datepicker",
                  "data-pending-val": format_date(@end_date, @with_time)
                }
              />

              <DateInput
                :if={!@with_time}
                field={@end_date_field}
                class="w-60 mt-4 rounded-lg moon-text-input border-beerus-100"
                opts={
                  placeholder: "dd/mm/yyyy",
                  "phx-hook": "Datepicker",
                  "data-pending-val": format_date(@end_date, @with_time)
                }
              />
            </div>
          </div>

          <div class="mt-4 text-right">
            <Button
              class="rounded-lg"
              variant="primary"
              on_click="toggle_picker"
            >
              Apply
            </Button>
          </div>
        </div>
      </div>
    </div>
    """
  end

  defp button_label(nil, _, _, _), do: @default_label
  defp button_label(_, nil, _, _), do: @default_label

  defp button_label(start_date, end_date, with_time, nil) do
    date_format = "%0d/%0m/%Y"
    date_format = if with_time, do: date_format <> ", %R", else: date_format

    start_date_formatted = Timex.format!(start_date, date_format, :strftime)
    end_date_formatted = Timex.format!(end_date, date_format, :strftime)

    "#{start_date_formatted} - #{end_date_formatted}"
  end

  defp button_label(_start_date, _end_date, _, range), do: range_label(range)

  defp dates_from_range("lastMonth", _) do
    date =
      Timex.now()
      |> truncate_date()
      |> Timex.shift(months: -1)

    {Timex.beginning_of_month(date), Timex.end_of_month(date)}
  end

  defp dates_from_range("thisMonth", _) do
    date = Timex.now() |> truncate_date()
    {Timex.beginning_of_month(date), Timex.end_of_month(date)}
  end

  defp dates_from_range("nextMonth", _) do
    date =
      Timex.now()
      |> truncate_date()
      |> Timex.shift(months: 1)

    {Timex.beginning_of_month(date), Timex.end_of_month(date)}
  end

  defp dates_from_range("lastWeek", weekstart) do
    date =
      Timex.now()
      |> truncate_date()
      |> Timex.shift(weeks: -1)

    {Timex.beginning_of_week(date, weekstart), Timex.end_of_week(date, weekstart)}
  end

  defp dates_from_range("thisWeek", weekstart) do
    date = Timex.now() |> truncate_date()
    {Timex.beginning_of_week(date, weekstart), Timex.end_of_week(date, weekstart)}
  end

  defp dates_from_range("nextWeek", weekstart) do
    date =
      Timex.now()
      |> truncate_date()
      |> Timex.shift(weeks: 1)

    {Timex.beginning_of_week(date, weekstart), Timex.end_of_week(date, weekstart)}
  end

  defp dates_from_range("last24hours", _) do
    date = Timex.now() |> truncate_date()
    {Timex.shift(date, hours: -24), date}
  end

  defp dates_from_range("yesterday", _) do
    date =
      Timex.now()
      |> truncate_date()
      |> Timex.shift(days: -1)

    {Timex.beginning_of_day(date), Timex.end_of_day(date)}
  end

  defp dates_from_range("today", _) do
    date = Timex.now() |> truncate_date()
    {Timex.beginning_of_day(date), Timex.end_of_day(date)}
  end

  defp dates_from_range("tomorrow", _) do
    date =
      Timex.now()
      |> truncate_date()
      |> Timex.shift(days: 1)

    {Timex.beginning_of_day(date), Timex.end_of_day(date)}
  end

  defp range_label(range_name) when is_binary(range_name) do
    @ranges[String.to_atom(range_name)]
  end

  defp update_dates(socket, start_date, end_date) do
    send(self(), {
      socket.assigns.on_date_change,
      %{
        socket.assigns.start_date_field => start_date,
        socket.assigns.end_date_field => end_date
      }
    })
  end

  defp parse_date(date) when is_binary(date) do
    case Timex.parse(date, "%Y-%0m-%0dT%R", :strftime) do
      {:ok, datetime} ->
        datetime

      {:error, _} ->
        {:ok, date} = Timex.parse(date, "%Y-%0m-%0d", :strftime)
        date
    end
  end

  defp parse_date(date), do: date

  defp format_date(nil, _), do: nil
  defp format_date(date, true), do: Timex.format!(date, "%Y-%0m-%0dT%R", :strftime)
  defp format_date(date, false), do: Timex.format!(date, "%Y-%0m-%0d", :strftime)

  defp truncate_date(date) do
    date
    |> Timex.to_naive_datetime()
    |> NaiveDateTime.truncate(:second)
  end

  defp format_to_date(datetime, true), do: datetime
  defp format_to_date(datetime, false), do: Timex.to_date(datetime)

  def validate(start_date, end_date) do
    parsed_start_date = parse_date(start_date)
    parsed_end_date = parse_date(end_date)

    if parsed_start_date && parsed_end_date && Timex.after?(parsed_start_date, parsed_end_date) do
      {start_date, start_date}
    else
      {start_date, end_date}
    end
  end

  def handle_event("toggle_picker", _, socket) do
    {:noreply, assign(socket, show: !socket.assigns.show)}
  end

  def handle_event("select_range", %{"range" => range}, socket) do
    {start_date, end_date} = dates_from_range(range, socket.assigns.week_starts_on)
    socket = assign(socket, selected_range: range, left_panel_date: Timex.to_date(start_date))
    update_dates(socket, start_date, end_date)

    {:noreply, socket}
  end

  def handle_event("shift_months", %{"months" => months}, socket) do
    months = String.to_integer(months)
    left_panel_date = Timex.shift(socket.assigns.left_panel_date, months: months)

    socket = assign(socket, left_panel_date: left_panel_date)
    {:noreply, socket}
  end

  def handle_event("select_date", %{"date" => date}, socket) do
    with_time = socket.assigns.with_time
    start_date = socket.assigns.start_date

    date =
      date
      |> parse_date()
      |> format_to_date(with_time)

    {start_date, end_date} =
      cond do
        start_date && is_nil(socket.assigns.end_date) && Timex.after?(date, start_date) ->
          # Keep start, set end
          end_date = if with_time, do: Timex.end_of_day(date), else: date
          {start_date, end_date}

        true ->
          # Set start, reset end
          start_date = if with_time, do: Timex.beginning_of_day(date), else: date
          {start_date, nil}
      end

    update_dates(socket, start_date, end_date)
    {:noreply, assign(socket, selected_range: nil)}
  end
end
