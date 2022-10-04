defmodule Moon.Components.Datepicker do
  @moduledoc false

  use Moon.StatefulComponent

  alias Moon.Components.Chip
  alias Moon.Components.Datepicker.Month.FirstMonth
  alias Moon.Components.Datepicker.Month.SecondMonth
  alias Moon.Components.Datepicker.Helpers
  alias Moon.Components.Datepicker.DateInputs
  alias Moon.Components.Datepicker.Buttons
  alias Moon.Components.Popover

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
  prop button_class, :css_class, default: ""
  prop show_date_inputs, :boolean, default: false

  prop ranges, :list,
    default: ~w(lastMonth lastWeek yesterday thisWeek thisMonth last24hours today)

  prop start_date, :datetime
  prop end_date, :datetime
  prop submit, :event
  prop testid, :string

  # Internal values
  data internal_start_date, :datetime, default: Timex.today()
  data internal_end_date, :datetime, default: Timex.today()
  data left_panel_date, :datetime, default: Timex.today()
  data selected_range, :string, default: "thisMonth"
  data temp_range, :string, default: nil
  data show, :boolean, default: false

  def render(assigns) do
    ~F"""
    <Popover show={@show} on_close="toggle_picker" testid={@testid}>
      <Chip
        class={@button_class}
        on_click="toggle_picker"
        right_icon="controls_chevron_down"
        active={@start_date && @end_date}
        testid={"#{@testid}-chip"}
        button_type="button"
      >
        {button_label(@start_date, @end_date, @with_time, @selected_range)}
      </Chip>

      <:content>
        <div class={
          "p-2 pr-3 origin-top-left absolute left-0 bg-gohan-100 flex shadow-lg rounded text-moon-14 z-10 mt-2",
          hidden: !@show
        }>
          <!-- Ranges -->
          <div :if={length(@ranges) > 0} class="space-y-0.5 w-48 mr-4">
            <div
              :for={range <- @ranges}
              class={
                "py-2 px-3 hover:bg-goku-100 rounded cursor-pointer",
                "bg-goku-100": range == @selected_range
              }
              :on-click="select_range"
              phx-value-range={range}
              data-testid={"#{@testid}-select-range-#{range}"}
            >
              {range_label(range)}
            </div>
          </div>

          <!-- Content -->
          <div class="flex flex-col pt-2 pl-3">
            <!-- Months -->
            <div class="flex grow space-x-6">
              <FirstMonth
                date={@left_panel_date}
                start_date={@internal_start_date}
                end_date={@internal_end_date}
                week_starts_on={@week_starts_on}
                on_click="select_date"
              />
              <SecondMonth
                date={Timex.shift(@left_panel_date, months: 1)}
                start_date={@internal_start_date}
                end_date={@internal_end_date}
                week_starts_on={@week_starts_on}
                on_click="select_date"
              />
            </div>

            <div class={
              "flex items-center mt-6 gap-x-2",
              "justify-between": @show_date_inputs,
              "justify-end": !@show_date_inputs
            }>
              <DateInputs
                :if={@show_date_inputs}
                {=@with_time}
                {=@start_date_field}
                {=@end_date_field}
                {=@internal_start_date}
                {=@internal_end_date}
              />

              <Buttons
                on_click={@submit || "update_dates"}
                values={
                  start_date: Helpers.format_date(@internal_start_date, @with_time),
                  end_date: Helpers.format_date(@internal_end_date, @with_time)
                }
                testid={"#{@testid}-apply"}
              />
            </div>
          </div>
        </div>
      </:content>
    </Popover>
    """
  end

  # Handle date-input fields updates
  def update(assigns, socket) do
    socket = assign(socket, assigns)

    socket =
      case assigns do
        %{start_date: start_date, end_date: end_date} ->
          assign(
            socket,
            start_date: Helpers.parse_date(start_date),
            end_date: Helpers.parse_date(end_date),
            internal_start_date: Helpers.parse_date(start_date),
            internal_end_date: Helpers.parse_date(end_date)
          )

        _ ->
          # this is required, because if someone uses LiveView.send_update
          # then start_date and end_date might be missing
          socket
      end

    {:ok, socket}
  end

  def validate(start_date, end_date) do
    parsed_start_date = Helpers.parse_date(start_date)
    parsed_end_date = Helpers.parse_date(end_date)

    if parsed_start_date && parsed_end_date && Timex.after?(parsed_start_date, parsed_end_date) do
      {start_date, start_date}
    else
      {start_date, end_date}
    end
  end

  def handle_event("toggle_picker", _, socket) do
    %{
      show: show,
      start_date: start_date,
      end_date: end_date
    } = socket.assigns

    left_panel_date = if start_date, do: Timex.to_date(start_date), else: Timex.today()

    selected_range =
      if show do
        # Restore to an initial value on close
        socket.assigns.temp_range
      else
        socket.assigns.selected_range
      end

    socket =
      assign(socket,
        internal_start_date: start_date,
        internal_end_date: end_date,
        left_panel_date: left_panel_date,
        temp_range: selected_range,
        selected_range: selected_range,
        show: !show
      )

    {:noreply, socket}
  end

  def handle_event("select_range", %{"range" => range}, socket) do
    {start_date, end_date} = Helpers.dates_from_range(range, socket.assigns.week_starts_on)

    socket =
      assign(socket,
        selected_range: range,
        internal_start_date: start_date,
        internal_end_date: end_date,
        left_panel_date: Timex.to_date(start_date)
      )

    {:noreply, socket}
  end

  def handle_event("shift_months", %{"months" => months}, socket) do
    months = String.to_integer(months)
    left_panel_date = Timex.shift(socket.assigns.left_panel_date, months: months)

    {:noreply, assign(socket, left_panel_date: left_panel_date)}
  end

  def handle_event("select_date", %{"date" => date}, socket) do
    %{
      with_time: with_time,
      internal_start_date: start_date,
      internal_end_date: end_date
    } = socket.assigns

    date =
      date
      |> Helpers.parse_date()
      |> Helpers.format_to_date(with_time)

    {start_date, end_date} =
      if start_date && is_nil(end_date) && Timex.after?(date, start_date) do
        # Keep start, set end
        end_date = if with_time, do: Timex.end_of_day(date), else: date
        {start_date, end_date}
      else
        # Set start, reset end
        start_date = if with_time, do: Timex.beginning_of_day(date), else: date
        {start_date, nil}
      end

    {:noreply,
     assign(socket,
       selected_range: nil,
       internal_start_date: start_date,
       internal_end_date: end_date
     )}
  end

  def handle_event("update_dates", _, socket) do
    %{
      id: filter_id,
      start_date_field: start_date_field,
      end_date_field: end_date_field,
      internal_start_date: start_date,
      internal_end_date: end_date
    } = socket.assigns

    # TODO this is too filters specific and needs to be removed.
    # this should use normal Surface Event with handle_callback

    send(
      self(),
      {:filter,
       {
         filter_id,
         :apply,
         %{
           start_date_field => start_date,
           end_date_field => end_date
         }
       }}
    )

    {:noreply, assign(socket, show: false)}
  end

  def close(id: id) do
    send_update(__MODULE__, id: id, show: false)
  end

  defp button_label(nil, _, _, _), do: @default_label
  defp button_label(_, nil, _, _), do: @default_label

  defp button_label(start_date, end_date, with_time, nil) do
    date_format = "%0d/%0m/%Y"
    date_format = if with_time, do: date_format <> ", %R", else: date_format

    start_date_formatted = Timex.format!(start_date, date_format, :strftime)
    end_date_formatted = Timex.format!(end_date, date_format, :strftime)

    "#{start_date_formatted}-#{end_date_formatted}"
  end

  defp button_label(_start_date, _end_date, _, range), do: range_label(range)

  defp range_label(range_name) when is_binary(range_name) do
    @ranges[String.to_existing_atom(range_name)]
  end
end
