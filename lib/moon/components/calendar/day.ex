defmodule Moon.Components.Calendar.Day do
  use Moon.StatelessComponent

  prop day, :datetime, required: true
  prop text_color, :string
  prop events, :list, default: []

  def render(assigns) do
    ~F"""
    <div
      class="rounded-lg bg-gohan-100 aspect-w-1 aspect-h-1"
    >
      <div
        class={"text-xxs md:text-base lg:text-lg leading-none text-right pt-2 pr-3 #{@text_color}"}
      >
        {day_label(@day)}
      </div>

      <div class="p-3 mt-6 space-y-1 text-xxs md:text-xs">
        <div :for.with_index={{event, index} <- @events}>
          <div
            :if={index < 2}
            class="overflow-hidden leading-tight whitespace-nowrap overflow-ellipsis"
            title={event.description}
          >
            {event.description}
          </div>

          <div
            :if={index < 2 && event.location}
            class="overflow-hidden leading-tight text-trunks-100 whitespace-nowrap overflow-ellipsis"
            title={event.location}
          >
            {event.location}
          </div>
        </div>

        <div :if={length(@events) > 2} class="text-xs font-semibold">
          {length(@events) - 2} more
        </div>
      </div>
    </div>
    """
  end

  defp day_label(date) do
    day = Timex.format!(date, "%-d", :strftime)
    if day == "1", do: Timex.format!(date, "%b %-d", :strftime), else: day
  end
end
