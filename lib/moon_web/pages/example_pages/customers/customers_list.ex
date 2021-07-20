defmodule MoonWeb.Pages.ExamplePages.CustomersPage.CustomersList do
  use MoonWeb, :stateful_component

  alias MoonWeb.Pages.ExamplePages.Shared.ListPagination
  alias MoonWeb.Pages.ExamplePages.Shared.Table

  prop customers, :list, required: true
  prop page, :integer, required: true
  prop sorted_by, :tuple, required: true
  prop active_customer_id, :integer, required: true

  def render(assigns) do
    ~F"""
    <div class="max-w-full overflow-scroll">
      <ListPagination
        {=@page}
        page_count={20}
        total_count={10056}
        on_prev_page="goto_prev_page"
        on_next_page="goto_next_page"
      />
      <Table
        columns={[
          %{label: "Customer", field: :username, sortable: true},
          %{label: "Profile ID", field: :id, sortable: true},
          %{label: "Email", field: :email},
          %{label: "Country", field: :country},
          %{label: "Brand", field: :site, type: :brand},
          %{label: "Signup time", field: :signup_at, type: :date}
        ]}
        items={@customers}
        active_item_id={@active_customer_id}
        sorted_by={@sorted_by}
        on_select="select_customer"
        on_sort="sort_customers"
      />
    </div>
    """
  end

  def handle_event("goto_prev_page", _, socket = %{assigns: %{page: page}}) do
    self() |> send({:table, {:paginate, if(page > 1, do: page - 1, else: page)}})
    {:noreply, socket}
  end

  def handle_event("goto_next_page", _, socket = %{assigns: %{page: page}}) do
    self() |> send({:table, {:paginate, page + 1}})
    {:noreply, socket}
  end

  def handle_event(event, _, socket) do
    case String.split(event, ":") do
      ["select_customer", customer_id_str] ->
        {customer_id, _} = customer_id_str |> Integer.parse()
        customer = socket.assigns.customers |> Enum.find(nil, &(&1.id == customer_id))

        if customer != nil, do: self() |> send({:table, {:select, customer}})
        {:noreply, socket}

      ["sort_customers", field_str] ->
        field = field_str |> String.to_atom
        sort_by = case socket.assigns.sorted_by do
          {^field, :asc}  -> {field, :desc}
          {^field, :desc} -> {field, :asc}
          _               -> {field, :asc}
        end

        self() |> send({:table, {:sort, sort_by}})
        {:noreply, socket}
    end
  end
end
