defmodule MoonWeb.Examples.Design.PaginationExample.WithPageHrefs do
  @moduledoc false

  use Moon.StatefulComponent
  use MoonWeb, :example

  alias Moon.Icons.ControlsChevronRightSmall
  alias Moon.Icons.ControlsChevronLeftSmall
  alias Moon.Design.Pagination

  prop(current_page, :integer, default: 1)

  def render(assigns) do
    ~F"""
    <Pagination id="with_buttons" total_pages={10} value={@current_page} on_change="set_current_page">
      <Pagination.PrevButton testid="prev_button">
        <ControlsChevronLeftSmall class="text-moon-24 rtl:rotate-180" />
      </Pagination.PrevButton>
      <Pagination.Pages />
      <Pagination.NextButton testid="next_button">
        <ControlsChevronRightSmall class="text-moon-24 rtl:rotate-180" />
      </Pagination.NextButton>
    </Pagination>
    """
  end

  def handle_event("set_current_page", %{"value" => page}, socket) do
    {:noreply, push_redirect(socket, to: "/components/v2/pagination?page=#{page}")}
  end

  def code() do
    """
    alias Moon.Icons.ControlsChevronRightSmall
    alias Moon.Icons.ControlsChevronLeftSmall
    alias Moon.Design.Pagination

    prop(current_page, :integer, default: 1)

    def render(assigns) do
      ~F\"""
      <Pagination id="with_buttons" total_pages={10} value={@current_page} on_change="set_current_page">
        <Pagination.PrevButton testid="prev_button">
          <ControlsChevronLeftSmall class="text-moon-24 rtl:rotate-180" />
        </Pagination.PrevButton>
        <Pagination.Pages />
        <Pagination.NextButton testid="next_button">
          <ControlsChevronRightSmall class="text-moon-24 rtl:rotate-180" />
        </Pagination.NextButton>
      </Pagination>
      \"""
    end

    def handle_event("set_current_page", %{"value" => page}, socket) do
      {:noreply, push_redirect(socket, to: "/components/v2/pagination?page=#\{page}")}
    end
    """
  end
end
