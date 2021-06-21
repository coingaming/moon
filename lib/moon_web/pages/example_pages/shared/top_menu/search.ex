defmodule MoonWeb.Pages.ExamplePages.Shared.TopMenu.Search do
  use MoonWeb, :stateful_component

  alias Moon.Components.Form
  alias Moon.Components.TextInput

  alias __MODULE__.SearchResults

  data search_active, :boolean, default: false
  data search_map, :any, default: %{search_text: ""}

  def render(assigns) do
    ~F"""
    <div class="w-full relative z-20">
      <Form for={:search_map} change="update_search_map" submit="close_search" target={@myself} autocomplete="off" class="max-w-md relative m-auto">
        <TextInput
          left_icon="icon_zoom"
          right_icon={should_show_close_search(@search_map) && "icon_close_rounded"}
          right_icon_click="clear_search"
          placeholder="Search for dashboard, segments and more"
          field={:search_text}
          value={@search_map.search_text}
          on_focus="activate_search"
          class="bg-goku-100"
        />
        <SearchResults id="search" close="deactivate_search" search_text={@search_map.search_text} :if={@search_active} />
      </Form>
    </div>
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
