defmodule MoonWeb.Examples.Design.TableExample.WithPaging do
  @moduledoc false

  use Moon.StatefulComponent
  use MoonWeb, :example

  alias Moon.Design.Table
  alias Moon.Design.Table.Column
  alias Moon.Design.Pagination

  alias Moon.Components.Renderers.Datetime

  alias Moon.Icons.ControlsChevronRight
  alias Moon.Icons.ControlsChevronLeft

  prop(current_page, :integer, default: 1)
  prop(limit, :integer, default: 10)

  def render(assigns) do
    ~F"""
    <div class="w-full gap-4">
      <Pagination
        id="with_buttons"
        total_pages={page_count(Enum.count(get_all_models()), @limit)}
        value={@current_page}
        on_change="handle_paging_click"
      >
        <Pagination.PrevButton class="border-none">
          <ControlsChevronLeft class="text-moon-24 rtl:rotate-180" />
        </Pagination.PrevButton>
        <Pagination.Pages />
        <Pagination.NextButton class="border-none">
          <ControlsChevronRight class="text-moon-24 rtl:rotate-180" />
        </Pagination.NextButton>
      </Pagination>
      <Table items={model <- get_models_10(assigns)}>
        <Column name="id" label="ID">
          {model.id}
        </Column>
        <Column name="name" label="Name">
          {model.name}
        </Column>
        <Column name="created_at" label="Created at">
          <Datetime value={model.created_at} />
        </Column>
      </Table>
    </div>
    """
  end

  def get_all_models() do
    Enum.map(1..102, fn x ->
      %{id: x, name: "Name #{x}", created_at: DateTime.add(DateTime.utc_now(), -3600 + x)}
    end)
  end

  defp page_count(total_count, limit) do
    ceil(total_count / limit)
  end

  def get_models_10(assigns) do
    all_models = get_all_models()
    current_page = assigns.current_page
    limit = assigns.limit

    offset = (current_page - 1) * limit

    all_models
    |> Enum.slice(offset..(offset + limit - 1))
  end

  def handle_event("handle_paging_click", %{"value" => current_page}, socket) do
    current_page = String.to_integer(current_page)

    {:noreply,
     socket
     |> assign(current_page: current_page, models_10: get_models_10(socket.assigns))}
  end

  def code() do
    """
    alias Moon.Design.Table
    alias Moon.Design.Table.Column
    alias Moon.Design.Pagination

    alias Moon.Components.Renderers.Datetime

    alias Moon.Icons.ControlsChevronRight
    alias Moon.Icons.ControlsChevronLeft

    prop(current_page, :integer, default: 1)
    prop(limit, :integer, default: 10)

    def render(assigns) do
      ~F\"""
      <div class="w-full gap-4">
        <Pagination
          id="with_buttons"
          total_pages={page_count(Enum.count(get_all_models()), @limit)}
          value={@current_page}
          on_change="handle_paging_click"
        >
          <Pagination.PrevButton class="border-none">
            <ControlsChevronLeft class="text-moon-24 rtl:rotate-180" />
          </Pagination.PrevButton>
          <Pagination.Pages />
          <Pagination.NextButton class="border-none">
            <ControlsChevronRight class="text-moon-24 rtl:rotate-180" />
          </Pagination.NextButton>
        </Pagination>
        <Table items={model <- get_models_10(assigns)}>
          <Column name="id" label="ID">
            {model.id}
          </Column>
          <Column name="name" label="Name">
            {model.name}
          </Column>
          <Column name="created_at" label="Created at">
            <Datetime value={model.created_at} />
          </Column>
        </Table>
      </div>
      \"""
    end

    def get_all_models() do
      Enum.map(1..102, fn x ->
        %{id: x, name: "Name #\{x}", created_at: DateTime.add(DateTime.utc_now(), -3600 + x)}
      end)
    end

    defp page_count(total_count, limit) do
      ceil(total_count / limit)
    end

    def get_models_10(assigns) do
      all_models = get_all_models()
      current_page = assigns.current_page
      limit = assigns.limit

      offset = (current_page - 1) * limit

      all_models
      |> Enum.slice(offset..(offset + limit - 1))
    end

    def handle_event("handle_paging_click", %{"value" => current_page}, socket) do
      current_page = String.to_integer(current_page)

      {:noreply,
      socket
      |> assign(current_page: current_page, models_10: get_models_10(socket.assigns))}
    end
    """
  end
end
