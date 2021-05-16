defmodule Moon.Components.Calendar.Day do
  use Moon.StatelessComponent

  prop day, :datetime, required: true
  prop text_color, :string

  def render(assigns) do
    ~H"""
    <div
      class="relative rounded-lg bg-gohan-100"
      style="padding-top: 100%;"
    >
      <div
        class="absolute text-lg leading-none top-3 right-3 {{ @text_color }}"
      >
        {{ day_label(@day) }}
      </div>
    </div>
    """
  end

  defp day_label(date) do
    day = Timex.format!(date, "%-d", :strftime)
    if day == "1", do: Timex.format!(date, "%b %-d", :strftime), else: day
  end
end
