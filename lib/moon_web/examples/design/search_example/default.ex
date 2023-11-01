defmodule MoonWeb.Examples.Design.SearchExample.Default do
  @moduledoc false

  use MoonWeb, :stateful_component
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
      options={@options |> page_to_href() |> filter_options(@filter)}
    />
    """
  end

  defp page_to_href(options) do
    options |> Enum.map(&Keyword.put(&1, :page, live_path(MoonWeb.Endpoint, &1[:page])))
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
