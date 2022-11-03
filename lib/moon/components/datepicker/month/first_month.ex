defmodule Moon.Components.Datepicker.Month.FirstMonth do
  @moduledoc false

  use Moon.StatelessComponent

  alias Moon.Components.Datepicker.Month
  alias Moon.Assets.Icons.IconChevronLeft

  prop(date, :datetime, default: Timex.today())
  prop(start_date, :datetime, default: Timex.today())
  prop(end_date, :datetime, default: Timex.today())
  prop(week_starts_on, :integer, default: 1, values: Enum.to_list(1..7))
  prop(on_click, :event)

  def render(assigns) do
    ~F"""
    <div class="relative flex flex-col items-center">
      <button type="button" class="absolute left-6" :on-click="shift_months" phx-value-months={-2}>
        <IconChevronLeft class="block" font_size="1rem" />
      </button>

      <div class="grow">
        <Month {=@date} {=@start_date} {=@end_date} {=@week_starts_on} {=@on_click} />
      </div>
    </div>
    """
  end
end
