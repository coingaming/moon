defmodule MoonWeb.Pages.ExamplePages.Shared.TopMenu.Search do
  @moduledoc false
  use MoonWeb, :stateful_component

  alias Moon.Assets.Icons.IconCloseRounded
  alias Moon.Assets.Icons.IconZoom
  alias Moon.Components.Form
  alias Moon.Components.TextInput
  alias Moon.Components.Popover

  alias __MODULE__.SearchResults

  data search_active, :boolean, default: false
  data search_map, :any, default: %{search_text: ""}

  @spec render(any) :: Phoenix.LiveView.Rendered.t()
  def render(assigns) do
    ~F"""
    <Popover show={@search_active} on_close="deactivate_search" placement="bottom">
      <Form
        for={:search_map}
        change="update_search_map"
        submit="close_search"
        autocomplete="off"
        class="w-128 max-w-md"
      >
        <TextInput
          right_icon_click="clear_search"
          placeholder="Search for dashboard, segments and more"
          field={:search_text}
          value={@search_map.search_text}
          on_focus="activate_search"
          class="bg-goku-100 h-10 border-transparent"
        >
          <:left_icon><IconZoom /></:left_icon>
          <:right_icon :if={should_show_close_search(@search_map)}><IconCloseRounded /></:right_icon>
        </TextInput>
      </Form>

      <:content>
        <div class="w-128 max-w-md">
          <SearchResults id="search" search_text={@search_map.search_text} />
        </div>
      </:content>
    </Popover>
    """
  end

  def should_show_close_search(search_map) do
    String.length(search_map.search_text) > 0
  end

  def handle_event(
        "update_search_map",
        %{"search_map" => %{"search_text" => search_text}},
        socket
      ) do
    {:noreply, assign(socket, search_active: true, search_map: %{search_text: search_text})}
  end

  def handle_event(
        "activate_search",
        _,
        socket
      ) do
    {:noreply, assign(socket, search_active: true)}
  end

  def handle_event(
        "deactivate_search",
        _,
        socket
      ) do
    {:noreply, assign(socket, search_active: false)}
  end

  def handle_event("clear_search", _, socket) do
    {:noreply, assign(socket, search_map: %{search_text: ""})}
  end
end
