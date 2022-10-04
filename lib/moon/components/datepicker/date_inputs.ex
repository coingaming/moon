defmodule Moon.Components.Datepicker.DateInputs do
  @moduledoc false

  use Moon.StatelessComponent

  alias Surface.Components.Form.DateInput
  alias Surface.Components.Form.DateTimeLocalInput
  alias Moon.Components.Datepicker.Helpers

  prop with_time, :boolean, default: false
  prop internal_start_date, :datetime, default: Timex.today()
  prop internal_end_date, :datetime, default: Timex.today()
  prop start_date_field, :atom, default: :start_date
  prop end_date_field, :atom, default: :end_date

  def render(assigns) do
    ~F"""
    <div class="flex shrink-0 gap-x-2">
      <DateTimeLocalInput
        :if={@with_time}
        field={@start_date_field}
        class="text-moon-12 rounded date-icon-hidden w-36 moon-text-input border-beerus-100"
        opts={
          placeholder: "dd/mm/yyyy, --:--",
          "phx-hook": "Datepicker",
          "data-pending-val": Helpers.format_date(@internal_start_date, @with_time)
        }
      />

      <DateInput
        :if={!@with_time}
        field={@start_date_field}
        class="text-moon-12 rounded date-icon-hidden w-28 moon-text-input border-beerus-100"
        opts={
          placeholder: "dd/mm/yyyy",
          "phx-hook": "Datepicker",
          "data-pending-val": Helpers.format_date(@internal_start_date, @with_time)
        }
      />

      <DateTimeLocalInput
        :if={@with_time}
        field={@end_date_field}
        class="text-moon-12 rounded date-icon-hidden w-36 moon-text-input border-beerus-100"
        opts={
          placeholder: "dd/mm/yyyy, --:--",
          "phx-hook": "Datepicker",
          "data-pending-val": Helpers.format_date(@internal_end_date, @with_time)
        }
      />

      <DateInput
        :if={!@with_time}
        field={@end_date_field}
        class="text-moon-12 rounded date-icon-hidden w-28 moon-text-input border-beerus-100"
        opts={
          placeholder: "dd/mm/yyyy",
          "phx-hook": "Datepicker",
          "data-pending-val": Helpers.format_date(@internal_end_date, @with_time)
        }
      />
    </div>
    """
  end
end
