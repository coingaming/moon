defmodule MoonWeb.Components.SearchButton do
  @moduledoc false

  use MoonWeb, :stateful_component

  alias Moon.Design.Search

  import Moon.Helpers.Form, only: [filter_options: 2]

  prop(options, :list, default: MoonWeb.Schema.Link.titles())
  prop(filter, :string, default: "")

  def handle_event("change_filter", %{"value" => filter}, socket) do
    {:noreply, assign(socket, filter: filter)}
  end

  def render(assigns) do
    ~F"""
    <Search
      id="moon-search"
      {=@filter}
      on_keyup="change_filter"
      options={filter_options(@options, @filter)}
      prompt="Search..."
    >
      <:option :let={option: option}>
        <a href={live_path(MoonWeb.Endpoint, option[:page])}>
          {option[:key]}
        </a>
      </:option>
    </Search>
    """
  end
end
