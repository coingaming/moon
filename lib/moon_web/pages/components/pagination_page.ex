defmodule MoonWeb.Pages.Components.PaginationPage do
  use MoonWeb, :live_view
  alias Moon.Components.Heading
  alias Moon.Components.Pagination
  alias Moon.Components.Stack

  def mount(params, _session, socket) do
    socket =
      assign(socket,
        theme_name: params["theme_name"] || "sportsbet-dark",
        active_page: __MODULE__,
        current_page_number: 5
      )

    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <Stack>
      <Heading size=32>Pagination</Heading>

      <p>
        Pagination component.
      </p>

      <div class="mt-8">
        <Pagination
          size="small"
          current_page_number={{ @current_page_number }}
          total_pages={{ 20 }}
          on_change="change_current_page"
        />
      </div>
    </Stack>
    """
  end

  def handle_event("change_current_page", %{"val" => page}, socket) do
    socket = assign(socket, current_page_number: String.to_integer(page))
    {:noreply, socket}
  end
end
