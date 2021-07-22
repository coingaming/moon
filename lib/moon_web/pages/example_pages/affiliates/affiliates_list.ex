defmodule MoonWeb.Pages.ExamplePages.AffiliatesPage.AffiliatesList do
  use MoonWeb, :stateful_component

  alias MoonWeb.Pages.ExamplePages.Shared.ListPagination
  alias Moon.Components.TableV2

  prop affiliates, :list, required: true
  prop page, :integer, required: true

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
          %{label: "Affiliate username", field: [:user, :username]},
          %{label: "Affiliate ID", field: [:id]},
          %{label: "Email", field: [:user, :email]},
          %{label: "Site", field: [:user, :site]},
          %{label: "Signup time", field: [:signup_at]},
          %{label: "Country", field: [:user, :country]}
        ]}
        items={@affiliates}
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
end
