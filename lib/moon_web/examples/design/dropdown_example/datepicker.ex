defmodule MoonWeb.Examples.Design.DropdownExample.Datepicker do
  @moduledoc false

  use Moon.StatefulComponent
  use MoonWeb, :example

  alias Moon.Design.Dropdown
  alias Moon.Components.Chip

  import Date, only: [new: 3, day_of_week: 1, add: 2]

  prop(value, :date, default: Date.utc_today())
  prop(month, :date, default: Date.utc_today())
  prop(is_open, :boolean)

  def handle_event("set_value", %{"value" => value}, socket) do
    {:noreply, assign(socket, value: Date.from_iso8601!(value), is_open: false)}
  end

  def handle_event("change_month", %{"value" => value}, socket) do
    {:noreply, assign(socket, month: Date.from_iso8601!(value), is_open: true)}
  end

  defp month_weeks(date) do
    import Enum, only: [map: 2]
    {:ok, month_start} = new(date.year, date.month, 1)
    start = month_start |> add(1 - day_of_week(month_start))

    # no more than 5 weeks in month
    0..4
    |> map(fn week_nr ->
      0..6 |> map(&add(start, week_nr * 7 + &1))
    end)
  end

  defp months() do
    [""] ++ ~w(Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec)
  end

  def render(assigns) do
    ~F"""
    <div>
      <Dropdown id="dropdown-datepicker" {=@is_open}>
        <Dropdown.Trigger>
          <Chip>{@value || "Choose date..."}</Chip>
        </Dropdown.Trigger>
        <Dropdown.Options class="w-auto p-1">
          <div class="w-full flex justify-between">
            <button
              class="hover:bg-gohan rounded-moon-i-sm py-1 w-6"
              :on-click="change_month"
              value={add(@month, -30)}
            >
              {"<"}
            </button>
            <span class="py-1">{Enum.at(months(), @month.month)} {@month.year}</span>
            <button
              class="hover:bg-gohan rounded-moon-i-sm py-1 w-6"
              :on-click="change_month"
              value={add(@month, 30)}
            >
              {">"}
            </button>
          </div>
          <div class="py-1 flex">
            {#for day <- ~w(m t w t f s s)}
              <span class="w-6 bg-gohan inline-block uppercase text-center text-trunks">{day}</span>
            {/for}
          </div>
          {#for week <- month_weeks(@month)}
            <div class="py-1 flex">
              {#for day <- week}
                <button
                  class={merge([
                    "w-6 hover:bg-gohan rounded-moon-i-sm",
                    "font-medium": @value == day,
                    "text-trunks": day.month != @month.month,
                    "text-piccolo": day == Date.utc_today()
                  ])}
                  value={day}
                  :on-click="set_value"
                >{day.day}</button>
              {/for}
            </div>
          {/for}
        </Dropdown.Options>
      </Dropdown>
    </div>
    """
  end

  def code() do
    """
    alias Moon.Design.Dropdown
    alias Moon.Components.Chip

    import Date, only: [new: 3, day_of_week: 1, add: 2]

    prop(value, :date, default: Date.utc_today())
    prop(month, :date, default: Date.utc_today())
    prop(is_open, :boolean)

    def handle_event("set_value", %{"value" => value}, socket) do
      {:noreply, assign(socket, value: Date.from_iso8601!(value), is_open: false)}
    end

    def handle_event("change_month", %{"value" => value}, socket) do
      {:noreply, assign(socket, month: Date.from_iso8601!(value), is_open: true)}
    end

    defp month_weeks(date) do
      import Enum, only: [to_list: 1, map: 2]
      {:ok, month_start} = new(date.year, date.month, 1)
      start = month_start |> add(1 - day_of_week(month_start))

      0..4
      |> to_list
      |> map(fn week_nr ->
        0..6 |> to_list |> map(&add(start, week_nr * 7 + &1))
      end)
    end

    defp months() do
      [""] ++ ~w(Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec)
    end

    def render(assigns) do
      ~F\"""
      <div>
        <Dropdown id="dropdown-datepicker" {=@is_open}>
          <Dropdown.Trigger>
            <Chip>{@value || "Choose date..."}</Chip>
          </Dropdown.Trigger>
          <Dropdown.Options class="w-auto p-1">
            <div class="w-full flex justify-between">
              <button class="hover:bg-gohan rounded-moon-i-sm py-1 w-6" :on-click="change_month" value={add(@month, -30)}> {"<"} </button>
              <span class="py-1">{Enum.at(months(), @month.month)} {@month.year}</span>
              <button class="hover:bg-gohan rounded-moon-i-sm py-1 w-6" :on-click="change_month" value={add(@month, 30)}> {">"} </button>
            </div>
            <div class="py-1 flex">
              {#for day <- ~w(m t w t f s s)}
                <span class="w-6 bg-gohan inline-block uppercase text-center">{day}</span>
              {/for}
            </div>
            {#for week <- month_weeks(@month)}
              <div class="py-1 flex">
                {#for day <- week}
                  <button class={
                    "w-6 hover:bg-gohan rounded-moon-i-sm",
                    "font-medium": @value == day,
                    "text-trunks": day.month != @month.month,
                    "text-piccolo": day == Date.utc_today()
                  } value={day} :on-click="set_value">{day.day}</button>
                {/for}
              </div>
            {/for}
          </Dropdown.Options>
        </Dropdown>
      </div>
      \"""
    end
    """
  end
end
