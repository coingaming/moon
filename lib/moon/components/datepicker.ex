defmodule Moon.Components.Datepicker do
  use Moon.StatefulComponent
  alias Moon.Assets.Icons.IconChevronLeft
  alias Moon.Assets.Icons.IconChevronRight
  alias Moon.Components.Button
  alias Moon.Components.Datepicker.Month
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

  # TODO
  prop with_time, :boolean, default: false
  prop week_starts_on, :integer, default: 1

  prop model, :map, default: %{}
  prop start_date_field, :atom, default: :start_date
  prop end_date_field, :atom, default: :end_date

  prop ranges, :list,
    default: ~w(lastMonth lastWeek yesterday thisWeek thisMonth last24hours today)

  data show, :boolean, default: true
  data selected_range, :string, default: "thisWeek"
  data left_panel_date, :datetime, default: Timex.today()

  def render(assigns) do
    ~H"""
    {{ asset_import @socket, "js/components/text-input" }}
    {{ asset_import @socket, "js/tailwind" }}

    <div class="relative block">
      <Button
        class="font-normal mt-4"
        variant="tertiary"
        on_click="toggle_picker"
      >
        {{ button_label(@model[@start_date_field], @model[@end_date_field], @selected_range) }}
      </Button>

      <div
        class={{
          "py-4 px-5 origin-top-left absolute left-0 bg-goku-100 flex shadow-lg rounded-xl text-sm",
          hidden: !@show
        }}
      >
        <!-- Ranges -->
        <div :if={{ length(@ranges) >0 }} class="space-y-1 w-44">
          <div
            :for={{ range <- @ranges }}
            class={{
              "py-2 px-3 hover:bg-hover rounded-lg cursor-pointer",
              "bg-hover": range == @selected_range
            }}
            :on-click="select_range"
            phx-value-range={{ range }}
          >
            {{ range_label(range) }}
          </div>
        </div>

        <!-- Content -->
        <div class="flex flex-col pt-2 pl-4">
          <!-- Months -->
          <div class="flex flex-grow space-x-6">
            <!-- First Month -->
            <div class="relative flex flex-col items-center">
              <button
                class="absolute leading-none left-6"
                :on-click="shift_months"
                phx-value-months={{ -2 }}
              >
                <IconChevronLeft class="block" font_size="1rem"/>
              </button>

              <div class="flex-grow">
                <Month
                  date={{ @left_panel_date }}
                  start_date={{ @model[@start_date_field] }}
                  end_date={{ @model[@end_date_field] }}
                  on_click="select_date"
                />
              </div>

              <DateTimeLocalInput
                value={{ @model[@start_date_field] }}
                field={{ @start_date_field }}
                class="w-60 mt-4 rounded-lg moon-text-input border-beerus-100"
                opts={{
                  placeholder: "dd/mm/yyyy, --:--",
                  required: true,
                  "phx-hook": "FormChange"
                }}
              />
            </div>

            <!-- Second Month -->
            <div class="relative flex flex-col items-center">
              <button
                class="absolute leading-none right-6"
                :on-click="shift_months"
                phx-value-months={{ 2 }}
              >
                <IconChevronRight class="block" font_size="1rem"/>
              </button>

              <div class="flex-grow">
                <Month
                  date={{ Timex.shift(@left_panel_date, months: 1) }}
                  start_date={{ @model[@start_date_field] }}
                  end_date={{ @model[@end_date_field] }}
                  on_click="select_date"
                />
              </div>

              <DateTimeLocalInput
                value={{ @model[@end_date_field] }}
                field={{ @end_date_field }}
                class="w-60 mt-4 rounded-lg moon-text-input border-beerus-100"
                opts={{
                  placeholder: "dd/mm/yyyy, --:--",
                  required: true,
                  "phx-hook": "FormChange"
                }}
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

  defp button_label(nil, _, _), do: @default_label
  defp button_label(_, nil, _), do: @default_label

  defp button_label(start_date, end_date, nil) do
    start_date_formatted = Timex.format!(start_date, "%0d/%0m/%Y, %R", :strftime)
    end_date_formatted = Timex.format!(end_date, "%0d/%0m/%Y, %R", :strftime)

    "#{start_date_formatted} - #{end_date_formatted}"
  end

  defp button_label(_start_date, _end_date, range), do: range_label(range)

  defp dates_from_range("lastMonth") do
    date =
      Timex.now()
      |> Timex.to_naive_datetime()
      |> Timex.shift(months: -1)

    {Timex.beginning_of_month(date), Timex.end_of_month(date)}
  end

  defp dates_from_range("thisMonth") do
    date = Timex.now() |> Timex.to_naive_datetime()
    {Timex.beginning_of_month(date), Timex.end_of_month(date)}
  end

  defp dates_from_range("nextMonth") do
    date =
      Timex.now()
      |> Timex.to_naive_datetime()
      |> Timex.shift(months: 1)

    {Timex.beginning_of_month(date), Timex.end_of_month(date)}
  end

  defp dates_from_range("lastWeek") do
    date =
      Timex.now()
      |> Timex.to_naive_datetime()
      |> Timex.shift(weeks: -1)

    {Timex.beginning_of_week(date), Timex.end_of_week(date)}
  end

  defp dates_from_range("thisWeek") do
    date = Timex.now() |> Timex.to_naive_datetime()
    {Timex.beginning_of_week(date), Timex.end_of_week(date)}
  end

  defp dates_from_range("nextWeek") do
    date =
      Timex.now()
      |> Timex.to_naive_datetime()
      |> Timex.shift(weeks: 1)

    {Timex.beginning_of_week(date), Timex.end_of_week(date)}
  end

  defp dates_from_range("last24hours") do
    date = Timex.now() |> Timex.to_naive_datetime()
    {Timex.shift(date, hours: -24), date}
  end

  defp dates_from_range("yesterday") do
    date =
      Timex.now()
      |> Timex.to_naive_datetime()
      |> Timex.shift(days: -1)

    {Timex.beginning_of_day(date), Timex.end_of_day(date)}
  end

  defp dates_from_range("today") do
    date = Timex.now() |> Timex.to_naive_datetime()
    {Timex.beginning_of_day(date), Timex.end_of_day(date)}
  end

  defp dates_from_range("tomorrow") do
    date =
      Timex.now()
      |> Timex.to_naive_datetime()
      |> Timex.shift(days: 1)

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

    model =
      socket.assigns.model
      |> Map.put(socket.assigns.start_date_field, start_date)
      |> Map.put(socket.assigns.end_date_field, end_date)

    socket =
      assign(socket,
        selected_range: range,
        left_panel_date: Timex.to_date(start_date),
        model: model
      )

    {:noreply, socket}
  end

  def handle_event("shift_months", %{"months" => months}, socket) do
    months = String.to_integer(months)
    left_panel_date = Timex.shift(socket.assigns.left_panel_date, months: months)

    socket = assign(socket, left_panel_date: left_panel_date)
    {:noreply, socket}
  end

  def handle_event("select_date", %{"date" => date}, socket) do
    model = socket.assigns.model
    start_date = model[socket.assigns.start_date_field]
    end_date = model[socket.assigns.end_date_field]
    {:ok, date} = Timex.parse(date, "%Y-%0m-%0d %T", :strftime)

    socket =
      cond do
        start_date && is_nil(end_date) && Timex.after?(date, start_date) ->
          assign(socket,
            model: Map.put(model, socket.assigns.end_date_field, Timex.end_of_day(date)),
            selected_range: nil
          )

        true ->
          assign(socket,
            model: Map.put(model, socket.assigns.start_date_field, Timex.beginning_of_day(date)),
            selected_range: nil
          )
      end

    {:noreply, socket}
  end
end
