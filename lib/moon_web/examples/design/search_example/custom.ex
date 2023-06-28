defmodule MoonWeb.Examples.Design.SearchExample.Custom do
  @moduledoc false

  # use Moon.StatefulComponent
  use MoonWeb, :stateful_component
  use MoonWeb, :example

  alias Moon.Design.Search
  alias Moon.Icon
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
      options={filter_options(@options, @filter)}
    >
      <:option :let={option: option}>
        <a href={live_path(MoonWeb.Endpoint, option[:page])}>
          <Icon class="w-6 h-6" name={option[:icon]} :if={option[:icon]} />
          {option[:key]}
        </a>
      </:option>
    </Search>
    """
  end

  def code() do
    """
    alias Moon.Design.Search
    alias Moon.Icon
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
        options={filter_options(@options, @filter)}
      >
        <:option :let={option: option}>
          <a href={live_path(MoonWeb.Endpoint, option[:page])}>
            <Icon class="w-6 h-6" name={option[:icon]} :if={option[:icon]} />
            {option[:key]}
          </a>
        </:option>
      </Search>
      \"""
    end
    """
  end
end
