defmodule Moon.Components.Datetimepicker.MonthSelector do
  use Moon.StatelessComponent

  alias Moon.Assets.Icons.IconChevronLeft
  alias Moon.Assets.Icons.IconChevronRight

  prop date, :date, default: Timex.today()
  prop is_two_panels, :boolean

  def render(assigns) do
    ~F"""
    <div class="flex justify-between pt-2 pl-3">
      <button
        type="button"
        class="leading-none"
      >
        <IconChevronLeft class="block" font_size="1rem" />
      </button>
      <div>
        {Timex.format!(@date, "%B %Y", :strftime)}
      </div>
      <div :if={@is_two_panels}>
        {Timex.format!(@date, "%B %Y", :strftime)}
      </div>
      <button
        type="button"
        class="leading-none"
      >
        <IconChevronRight class="block" font_size="1rem" />
      </button>

    </div>
    """
  end
end
