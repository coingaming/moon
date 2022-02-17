defmodule Moon.Components.DateTimePicker do
  @moduledoc false

  use Moon.StatefulComponent

  # alias Surface.Components.Form.DateInput
  # alias Surface.Components.Form.DateTimeLocalInput
  # alias Moon.Components.Popover
  alias Moon.Components.Datetimepicker.Sidebar
  alias Moon.Components.Datetimepicker.MonthSelector
  alias Moon.Components.Datetimepicker.Month
  alias Moon.Components.Datetimepicker.Footer

  prop(class, :string)
  prop start_date, :datetime
  prop end_date, :datetime
  prop submit, :event
  prop is_two_panels, :boolean, default: true
  prop is_sidebar, :boolean, default: true
  prop is_range, :boolean, default: true
  prop disabled_range, :any

  data internal_start_date, :datetime, default: Timex.today()
  data internal_end_date, :datetime, default: Timex.today()

  def render(assigns) do
    ~F"""
    <div class="p-2 pr-3 bg-gohan-100 flex shadow-lg rounded text-sm z-10 mt-2">
      <Sidebar :if={@is_sidebar} />
      <div class="flex justify-between flex-col items-stretch">
        <MonthSelector is_two_panels={@is_two_panels}/>
        <div class="flex mt-4">
          <Month />
          <Month class="ml-4" :if={@is_two_panels} />
        </div>
        <Footer is_two_panels={@is_two_panels}/>
      </div>
    </div>
    """
  end
end
