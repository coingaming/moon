defmodule MoonWeb.Examples.Design.PaginationExample.WithText do
  @moduledoc false

  use Moon.StatefulComponent
  use MoonWeb, :example

  alias Moon.Design.Pagination

  prop(current_page, :integer, default: 1)

  def render(assigns) do
    ~F"""
    <Pagination id="default" total_pages={11} value={@current_page} on_change="set_current_page">
      <Pagination.PrevButton
        class="border-none font-normal"
        hover_bg_class="group-hover:bg-transparent"
        testid="prev_button"
      >Previous</Pagination.PrevButton>
      <Pagination.Pages />
      <Pagination.NextButton
        class="border-none font-normal"
        hover_bg_class="group-hover:bg-transparent"
        testid="next_button"
      >Next</Pagination.NextButton>
    </Pagination>
    """
  end

  def handle_event("set_current_page", %{"value" => page}, socket) do
    socket = assign(socket, current_page: String.to_integer(page))
    {:noreply, socket}
  end

  def code() do
    """
    alias Moon.Design.Pagination

    prop(current_page, :integer, default: 1)

    def render(assigns) do
      ~F\"""
      <Pagination id="default" total_pages={11} value={@current_page} on_change="set_current_page">
        <Pagination.PrevButton class="border-none font-normal" hover_bg_class="group-hover:bg-transparent">Previous</Pagination.PrevButton>
        <Pagination.Pages />
        <Pagination.NextButton class="border-none font-normal" hover_bg_class="group-hover:bg-transparent">Next</Pagination.NextButton>
      </Pagination>
      \"""
    end

    def handle_event("set_current_page", %{"value" => page}, socket) do
      socket = assign(socket, current_page: String.to_integer(page))
      {:noreply, socket}
    end
    """
  end
end
