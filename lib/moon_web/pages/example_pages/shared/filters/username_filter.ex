defmodule MoonWeb.Pages.ExamplePages.Shared.Filters.UsernameFilter do
  use MoonWeb, :stateful_component

  alias Moon.Components.Chip
  alias Moon.Components.DropdownMultiFilter
  alias MoonWeb.Pages.ExamplePages.Helpers

  alias MoonWeb.MockDB.Users

  data show_filter, :boolean, default: false
  data search_text, :string, default: ""
  data all_items, :list, default: []
  data selected_items, :list, default: []

  prop active_items, :list, required: true

  def render(assigns) do
    ~F"""
    <DropdownMultiFilter
      {=@show_filter}
      {=@search_text}
      {=@all_items}
      {=@selected_items}
      {=@active_items}
      on_apply="apply_filter"
      on_discard="discard_filter"
      on_clear="clear_filter"
      on_search="handle_filter_search"
      on_select="handle_filter_select"
    >
      <Chip on_click="toggle_filter" value="users" right_icon="icon_chevron_down_rounded">
        {"Users #{length(@active_items) |> Helpers.format_filter_count()}"}
      </Chip>
    </DropdownMultiFilter>
    """
  end

  #
  # Public API
  #
  def clear(id \\ "username_filter") do
    send_update(__MODULE__, id: id,
      show_filter: false,
      selected_items: []
    )
  end

  def close(id \\ "username_filter" ) do
    send_update(__MODULE__, id: id,
      show_filter: false
    )
  end

  #
  # Event Handlers
  #
  def handle_event("apply_filter", _, socket) do
    %{ selected_items: items } = socket.assigns

    apply_filter(items)
    {:noreply, socket
      |> assign(show_filter: false)
    }
  end

  def handle_event("discard_filter", _, socket) do
    {:noreply, socket
      |> assign(show_filter: false)
      |> assign(selected_items: socket.assigns.active_items)
    }
  end

  def handle_event("clear_filter", _, socket) do
    %{ all_items: all_items, active_items: active_items } = socket.assigns

    {:noreply, socket
      |> assign(all_items: (if length(all_items) > 0, do: all_items, else: active_items))
      |> assign(selected_items: [])
    }
  end

  def handle_event("toggle_filter", _, socket) do
    %{ show_filter: show_filter } = socket.assigns

    {:noreply, socket |> assign(show_filter: !show_filter)}
  end

  def handle_event("handle_filter_search", %{"search" => %{"search_text" => search_text}}, socket) do
    all_items = Users.search_by_usernames(search_text)
        |> Enum.map(&(%{label: &1.username, value: to_string(&1.id)}))
        |> Enum.take(10)

    {:noreply, socket
      |> assign(search_text: search_text)
      |> assign(all_items: all_items)
    }
  end

  def handle_event("handle_filter_select", %{"toggled_item_id" => id}, socket) do
    %{ all_items: all, selected_items: selected } = socket.assigns

    {:noreply, socket
      |> assign(selected_items: Helpers.toggle_selected_item(all, selected, id))
    }
  end

  defp apply_filter(items) do
    send(self(), {:apply_filter, {:username, items}})
  end
end
