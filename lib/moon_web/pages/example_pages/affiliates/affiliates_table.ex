defmodule MoonWeb.Pages.ExamplePages.Affiliates.AffiliatesTable do
  use MoonWeb, :stateful_component

  alias MoonWeb.Pages.ExamplePages.Shared.ListPagination
  alias Moon.Assets.Icons.IconSettings
  alias Moon.Components.TableV2

  prop affiliates, :list, required: true
  prop page, :integer, required: true
  prop sort_by, :tuple, required: true
  prop active_affiliate_id, :integer, required: true

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
      <TableV2
        columns={[
          %{label: "Affiliate username", field: [:user, :username], sortable: true},
          %{label: "Affiliate ID", field: [:id], sortable: true},
          %{label: "Email", field: [:user, :email]},
          %{label: "Site", field: [:user, :site]},
          %{label: "Signup time", field: [:signup_at]},
          %{label: "Country", field: [:user, :country]}
        ]}
        items={@affiliates}
        active_item_id={@active_affiliate_id}
        sort_by={@sort_by}
        on_select="select_affiliate"
        on_sort="sort_affiliates"
      >
        <:active_item_popover>
          <div class="inline-flex py-2 px-3 rounded bg-hit-120">
            <IconSettings color="goku-100" font_size="1.5rem" click="open_affiliate_settings"/>
          </div>
        </:active_item_popover>
      </TableV2>
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
      ["select_affiliate", affiliate_id_str] ->
        {affiliate_id, _} = affiliate_id_str |> Integer.parse()
        affiliate = socket.assigns.affiliates |> Enum.find(nil, &(&1.id == affiliate_id))

        if affiliate != nil, do: self() |> send({:table, {:select, affiliate}})
        {:noreply, socket}

      ["sort_affiliates", field_str] ->
        field =
          field_str
          |> String.split("+")
          |> (fn strs ->
                case strs do
                  [str] -> String.to_atom(str)
                  [_ | _] -> strs |> Enum.map(&String.to_atom(&1))
                  _ -> nil
                end
              end).()

        sort_by =
          case socket.assigns.sort_by do
            {^field, :asc} -> {field, :desc}
            {^field, :desc} -> {field, :asc}
            _ -> {field, :asc}
          end

        self() |> send({:table, {:sort, sort_by}})
        {:noreply, socket}

      _ ->
        {:noreply, socket}
    end
  end
end
