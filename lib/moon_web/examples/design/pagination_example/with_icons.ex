defmodule MoonWeb.Examples.Design.PaginationExample.WithIcons do
  @moduledoc false

  use Moon.StatefulComponent
  use MoonWeb, :example

  alias Moon.Icons.ControlsChevronRight
  alias Moon.Icons.ControlsChevronLeft
  alias Moon.Design.Pagination

  prop(current_page, :integer, default: 1)

  def render(assigns) do
    ~F"""
    <Pagination id="with_buttons" total_pages={26} value={@current_page} on_change="set_current_page">
      <Pagination.PrevButton>
        <ControlsChevronLeft class="text-moon-24 rtl:rotate-180" />
      </Pagination.PrevButton>
      <Pagination.Pages />
      <Pagination.NextButton>
        <ControlsChevronRight class="text-moon-24 rtl:rotate-180" />
      </Pagination.NextButton>
    </Pagination>
    """
  end

  def handle_event("set_current_page", %{"value" => page}, socket) do
    socket = assign(socket, current_page: String.to_integer(page))
    {:noreply, socket}
  end

  def code() do
    """
    alias Moon.Icons.ControlsChevronRight
    alias Moon.Icons.ControlsChevronLeft
    alias Moon.Design.Pagination

    prop(current_page, :integer, default: 1)

    def render(assigns) do
      ~F\"""
      <Pagination id="with_buttons" total_pages={26} value={@current_page} on_change="set_current_page">
        <Pagination.PrevButton>
          <ControlsChevronLeft class="text-moon-24 rtl:rotate-180" />
        </Pagination.PrevButton>
        <Pagination.Pages />
        <Pagination.NextButton>
          <ControlsChevronRight class="text-moon-24 rtl:rotate-180" />
        </Pagination.NextButton>
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
