defmodule MoonWeb.Pages.ExamplePages.AffiliatesPage.UsernameFilter do
  use MoonWeb, :stateful_component

  alias Moon.Components.Chip
  alias Moon.Components.Popover
  alias Moon.Components.CheckboxMultiselect
  alias Moon.Components.Form
  alias Moon.Components.TextInput
  alias Moon.Components.Button
  alias MoonWeb.MockDB.Users

  data opened, :boolean, default: false
  data search, :map
  data usernames, :list
  data selected_user_ids, :list

  def render(assigns) do
    ~F"""
    <Popover.Outer>
      <Chip class="w-64" on_click="toggle_username_filter" value="users" right_icon="icon_chevron_down_rounded">
        Users
      </Chip>

      <Popover placement="under" :if={@opened}>
        <Form for={:search} change="handle_search_change" autocomplete="off" target={@myself}>
          <TextInput
            left_icon="icon_zoom"
            placeholder="Search..."
            field={:search_text}
            value={@search.search_text}
            class="bg-goku-100"
          />
        </Form>

        {#if length(@usernames) > 0}
          <CheckboxMultiselect
            :if={length(@usernames) > 0}
            class="h-64 mt-4"
            on_change="handle_select_user_id"
            value={@selected_user_ids}
            options={@usernames}
          />
        {#else}
          <div :if={length(@usernames) == 0} class="h-64 mt-4 flex items-center justify-around">
            <div>Search for users</div>
          </div>
        {/if}

        <div class="flex justify-between mt-4">
          <Button variant="danger" on_click="toggle_username_filter">
            Cancel
          </Button>
          <Button :if={length(@selected_user_ids) > 0} variant="primary" on_click="apply_filter">
            Apply
          </Button>
        </div>
      </Popover>
    </Popover.Outer>
    """
  end

  def mount(socket) do
    socket = socket
      |> assign(search: %{search_text: ""})
      |> update_search_results()
      |> assign(selected_user_ids: [])

    {:ok, socket}
  end

  def handle_event("apply_filter", _, socket) do
    socket = socket
      |> assign(opened: false)

    self()
      |> send({:username_filter, socket.assigns.selected_user_ids})

    {:noreply, socket}
  end

  def handle_event("toggle_username_filter", _, socket) do
    socket = socket
      |> assign(opened: !socket.assigns.opened)
      |> assign(search: %{search_text: ""})
      |> update_search_results()

    {:noreply, socket}
  end

  def handle_event("handle_search_change", %{"search" => %{"search_text" => search_text}}, socket) do
    socket = socket
      |> assign(search: %{search_text: search_text})
      |> update_search_results()

    {:noreply, socket}
  end

  def handle_event("handle_select_user_id", %{"toggled_item_id" => user_id}, socket) do
    user_id = String.to_integer(user_id)
    selected_user_ids = socket.assigns.selected_user_ids
    new_selected_user_ids =
      if Enum.member?(selected_user_ids, user_id) do
        Enum.filter(selected_user_ids, &(&1 != user_id))
      else
        [user_id | selected_user_ids]
      end

    {:noreply, socket |> assign(selected_user_ids: new_selected_user_ids)}
  end

  defp update_search_results(socket) do
    usernames =
      if socket.assigns.search.search_text == "" do
        []
      else
        socket.assigns.search.search_text
        |> Users.search_by_usernames()
        |> Enum.map(&(%{label: &1.username, value: &1.id}))
        |> Enum.take(10)
      end

    socket |> assign(usernames: usernames)
  end
end
