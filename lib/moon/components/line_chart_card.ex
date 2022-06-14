defmodule Moon.Components.LineChartCard do
  @moduledoc false

  use Moon.StatefulComponent

  alias Moon.Assets.Icons.IconRefresh
  alias Moon.Components.LineChart
  alias Moon.Components.Select

  prop title, :string, required: true
  prop select_options, :list, default: []
  prop filters, :list, default: []
  prop values, :list, default: []
  prop time_format, :string, default: "%d/%m"

  def render(assigns) do
    ~F"""
    <div class="bg-gohan-100 p-6 rounded-sm">
      <div class="flex items-center mt-0.5 mb-6">
        <div class="grow text-moon-20 text-bulma-100">
          {@title}
        </div>

        <div class="flex-none" :if={length(@select_options) > 0}>
          <Select
            options={@select_options}
            class="pl-2 rounded-sm text-moon-12 text-trunks-100 bg-goku-100"
          />
        </div>

        <button type="button" class="flex-none ml-3 p-2">
          <IconRefresh class="block text-trunks-100" />
        </button>
      </div>

      {#if length(@filters) > 0}
        <div class="flex gap-x-3 mb-5 overflow-x-scroll">
          <button
            :for={filter <- @filters}
            class={
              "p-3 font-normal text-left rounded-sm hover:bg-goku-100",
              "bg-gohan-100": !filter.is_active,
              "bg-goku-100": filter.is_active
            }
            style="min-width: 120px;"
            type="button"
            :on-click="toggle_filter"
            phx-value-name={filter.data_key}
          >
            <p class="text-trunks-100 text-moon-12">{filter.label}</p>
            <p class="text-bulma-100 text-moon-20">{filter.value}</p>
          </button>
        </div>
      {/if}

      <LineChart
        id="line-chart"
        width="container"
        values={filter_values(@values, @filters)}
        {=@time_format}
      />
    </div>
    """
  end

  def handle_event("toggle_filter", %{"name" => filter_data_key}, socket) do
    filters =
      Enum.map(socket.assigns.filters, fn item ->
        if item.data_key == filter_data_key do
          %{item | is_active: !item.is_active}
        else
          item
        end
      end)

    socket =
      if filters |> only_active() |> Enum.empty?() do
        socket
      else
        socket
        |> assign(filters: filters)
        |> push_event("vega_lite:line-chart:redraw", %{
          "data" => filter_values(socket.assigns.values, filters)
        })
      end

    {:noreply, socket}
  end

  defp filter_values(values, filters) do
    active_filters = active_filters_keys(filters)

    Enum.filter(values, fn item ->
      item.category in active_filters
    end)
  end

  defp active_filters_keys(filters) do
    filters
    |> only_active()
    |> Enum.map(& &1.data_key)
  end

  defp only_active(filters), do: Enum.filter(filters, & &1.is_active)
end
