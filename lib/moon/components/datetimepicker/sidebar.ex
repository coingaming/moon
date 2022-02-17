defmodule Moon.Components.Datetimepicker.Sidebar do
  use Moon.StatelessComponent

  @ranges %{
    today: 'Today',
    yesterday: 'Yesterday',
    thisWeek: 'This week',
    lastWeek: 'Last week',
    thisMonth: 'This month',
    lastMonth: 'Last month',
    custom: 'Custom'
  }

  prop current_range, :string, default: "custom"
  prop select_range, :event
  prop ranges, :list, default: ~w(today yesterday thisWeek lastWeek thisMonth lastMonth custom)

  def render(assigns) do
    ~F"""
    <ul class="space-y-0.5 w-48 mr-4">
      <li
        :for={range <- @ranges}
        class={
          "py-2 px-3 hover:bg-goku-100 rounded cursor-pointer",
          "bg-goku-100": range == @current_range
        }
        :on_click={@select_range}
        phx-value-range={range}
      >
        {range_label(range)}
      </li>
    </ul>
    """
  end

  defp range_label(range_name) when is_binary(range_name) do
    @ranges[String.to_existing_atom(range_name)]
  end
end
