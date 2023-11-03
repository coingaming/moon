defmodule MoonWeb.Components.SearchButton do
  @moduledoc false

  use MoonWeb, :stateful_component

  alias Moon.Design.Search
  alias Moon.Design.Dropdown

  import Moon.Helpers.Form, only: [filter_options: 2, input_classes_light: 1]

  prop(options, :list, default: MoonWeb.Schema.Link.titles())
  prop(filter, :string, default: "")
  prop(on_keyup, :event)

  def handle_event("change_filter", %{"value" => filter}, socket) do
    {:noreply, assign(socket, filter: filter)}
  end

  def render(assigns) do
    ~F"""
    <Search
      id="moon-search"
      {=@filter}
      on_keyup="change_filter"
      options={@options |> page_to_href() |> filter_options(@filter)}
      class="focus:bg-heles"
    >
      <:trigger :let={is_open: is_open}>
        <Dropdown.Input
          placeholder="Search..."
          on_keyup="change_filter"
          value={@filter}
          class={
            "ps-[2.5rem] bg-goku hover:border-trunks h-10",
            input_classes_light(assigns),
            "rounded-bl-none rounded-br-none": is_open
          }
        >
          <Search.Icon class="start-[9px] text-moon-24" />
          <Search.Button on_click={@on_keyup} />
        </Dropdown.Input>
      </:trigger>
    </Search>
    """
  end

  defp page_to_href(options) do
    options |> Enum.map(&Keyword.put(&1, :page, live_path(MoonWeb.Endpoint, &1[:page])))
  end
end
