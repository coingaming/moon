defmodule MoonWeb.Examples.Design.SearchExample.Custom do
  @moduledoc false

  # use Moon.StatefulComponent
  use MoonWeb, :stateful_component
  use MoonWeb, :example

  alias Moon.Design.Search
  alias Moon.Icon
  alias Moon.Design.Dropdown

  import Moon.Helpers.Form, only: [filter_options: 2]

  prop(options, :list, default: MoonWeb.Schema.Link.titles())
  prop(filter, :string, default: "")

  def handle_event("change_filter", %{"value" => filter}, socket) do
    {:noreply, assign(socket, filter: filter)}
  end

  def render(assigns) do
    ~F"""
    <Search
      id="custom-search"
      {=@filter}
      on_keyup="change_filter"
      options={@options |> filter_options(@filter)}
    >
      <:option :let={option: option}>
        <Dropdown.Link
          href={live_path(MoonWeb.Endpoint, option[:page])}
          class="h-10 py-2 px-3 rounded-moon-i-sm"
        >
          <Icon class="w-6 h-6" name={option[:icon]} :if={option[:icon]} />
          {option[:key]}
        </Dropdown.Link>
      </:option>
    </Search>
    """
  end

  def code() do
    """
    alias Moon.Design.Search
    alias Moon.Icon
    alias Moon.Design.Dropdown

    import Moon.Helpers.Form, only: [filter_options: 2]

    prop(options, :list, default: MoonWeb.Schema.Link.titles())
    prop(filter, :string, default: "")

    def handle_event("change_filter", %{"value" => filter}, socket) do
      {:noreply, assign(socket, filter: filter)}
    end

    def render(assigns) do
      ~F\"""
      <Search
        id="custom-search"
        {=@filter}
        on_keyup="change_filter"
        options={@options |> filter_options(@filter)}
      >
        <:option :let={option: option}>
          <Dropdown.Link
            href={live_path(MoonWeb.Endpoint, option[:page])}
            class="h-10 py-2 px-3 rounded-moon-i-sm"
          >
            <Icon class="w-6 h-6" name={option[:icon]} :if={option[:icon]} />
            {option[:key]}
          </Dropdown.Link>
        </:option>
      </Search>
      \"""
    end
    """
  end
end
