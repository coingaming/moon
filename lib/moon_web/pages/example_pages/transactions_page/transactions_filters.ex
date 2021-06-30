defmodule MoonWeb.Pages.ExamplePages.TransactionsPage.TransactionsFilters do
  use MoonWeb, :stateful_component

  alias Moon.Components.Button
  alias Moon.Components.Chip
  alias Moon.Components.Popover
  alias Moon.Autolayouts.ButtonsList

  prop transaction_id, :string, required: true
  data clicked_name, :string, default: ""

  def render(assigns) do
    ~F"""
    <ButtonsList>
      <Popover.Outer>
        <Chip value="search" left_icon="icon_zoom">
          Search
        </Chip>
        <Popover close="close_popover" placement="under" :if={@clicked_name == "search"}>
          Yay
        </Popover>
      </Popover.Outer>

      <Popover.Outer>
        <Chip on_click="open_popover" value="timeframe" right_icon="icon_chevron_down_rounded">
          Last 7 days
        </Chip>
        <Popover close="close_popover" placement="under" :if={@clicked_name == "timeframe"}>
          Yay
        </Popover>
      </Popover.Outer>

      <Popover.Outer>
        <Chip on_click="open_popover" value="brand" right_icon="icon_chevron_down_rounded">Brand · All</Chip>
        <Popover close="close_popover" placement="under" :if={@clicked_name == "brand"}>
          Yay
        </Popover>
      </Popover.Outer>

      <Popover.Outer>
        <Chip on_click="open_popover" value="users" right_icon="icon_chevron_down_rounded">Users · 1</Chip>
        <Popover close="close_popover" placement="under" :if={@clicked_name == "users"}>
          Yay
        </Popover>
      </Popover.Outer>

      <Popover.Outer>
        <Chip on_click="open_popover" value="country" right_icon="icon_chevron_down_rounded">Country · All</Chip>
        <Popover close="close_popover" placement="under" :if={@clicked_name == "country"}>
          Yay
        </Popover>
      </Popover.Outer>

      <Popover.Outer>
        <Chip on_click="open_popover" value="range" right_icon="icon_chevron_down_rounded">Range · All</Chip>
        <Popover close="close_popover" placement="under" :if={@clicked_name == "range"}>
          Yay
        </Popover>
      </Popover.Outer>

      <Popover.Outer>
        <Chip on_click="open_popover" value="status" right_icon="icon_chevron_down_rounded">Status · All</Chip>
        <Popover close="close_popover" placement="under" :if={@clicked_name == "status"}>
          Yay
        </Popover>
      </Popover.Outer>

      <Popover.Outer>
        <Chip on_click="open_popover" value="more_filters" right_icon="icon_chevron_down_rounded">More filters</Chip>
        <Popover close="close_popover" placement="under" :if={@clicked_name == "more_filters"}>
          Yay
        </Popover>
      </Popover.Outer>

      <Button left_icon="icon_timer">Save segment</Button>
      <Button>Clear all</Button>
    </ButtonsList>
    """
  end

  def handle_event(
        "open_popover",
        %{"click_value" => click_value},
        socket
      ) do
    {:noreply, assign(socket, clicked_name: click_value)}
  end

  def handle_event(
        "close_popover",
        _,
        socket
      ) do
    {:noreply, assign(socket, clicked_name: nil)}
  end
end
