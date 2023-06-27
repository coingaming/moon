defmodule MoonWeb.Examples.Design.SearchExample.Default do
  @moduledoc false

  use Moon.StatefulComponent
  use MoonWeb, :example

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
      id="default-search"
      {=@filter}
      on_keyup="change_filter"
      options={filter_options(@options, @filter)}
    />
    """
  end

  def code() do
    """
    alias Moon.Design.Search

    import Moon.Helpers.Form, only: [filter_options: 2]

    prop(options, :list, default: MoonWeb.Schema.Link.titles())
    prop(filter, :string, default: "")

    def handle_event("change_filter", %{"value" => filter}, socket) do
      dbg(filter)
      {:noreply, assign(socket, filter: filter)}
    end

    def render(assigns) do
      ~F\"""
      <Search
        id="default-search"
        {=@filter}
        on_keyup="change_filter"
        options={filter_options(@options, @filter)}
      />
      \"""
    end
    """
  end
end
