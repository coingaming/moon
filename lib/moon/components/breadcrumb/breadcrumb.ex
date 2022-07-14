defmodule Moon.Components.Breadcrumb do
  @moduledoc false

  use Moon.StatefulComponent

  prop breadcrumbs, :list, default: []

  data is_collapsed, :boolean, default: false

  def update(assigns, socket) do
    is_collapsed =
      if Enum.count(assigns.breadcrumbs) > 4 do
        true
      else
        false
      end

    IO.puts("****")
    IO.inspect(is_collapsed)

    socket = assign(socket, :is_collapsed, is_collapsed)
    {:ok, socket}
  end

  def render(assigns) do
    ~F"""
    <div></div>
    """
  end
end
