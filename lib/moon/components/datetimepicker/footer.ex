defmodule Moon.Components.Datetimepicker.Footer do
  use Moon.StatelessComponent

  alias Moon.Components.Button
  # alias Surface.Components.Form.DateInput
  # alias Surface.Components.Form.DateTimeLocalInput

  prop start_date, :date
  prop end_date, :date
  prop is_two_panels, :boolean, default: true
  prop with_time, :boolean, default: false
  prop submit, :event
  prop cancel, :event

  def render(assigns) do
    ~F"""
    <div class="flex justify-end mt-6 gap-x-2">
      <input type="datetime-local" class="text-xs text-black rounded date-icon-hidden w-28 moon-text-input border-beerus-100" />
      <input :if={@is_two_panels} type="datetime-local" class="text-xs text-black rounded date-icon-hidden w-28 moon-text-input border-beerus-100" />
      <Button variant="tertiary" size="xsmall" on_click={@cancel}>
        Discard
      </Button>
      <Button
        class="px-3 py-2 rounded"
        variant="primary"
        size="xsmall"
        on_click={@submit}
      >
        Apply
      </Button>
    </div>
    """
  end
end
