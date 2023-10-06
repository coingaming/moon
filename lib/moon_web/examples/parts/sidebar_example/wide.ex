defmodule MoonWeb.Examples.Parts.SidebarExample.Wide do
  @moduledoc false

  use Moon.StatefulComponent
  use MoonWeb, :example

  alias Moon.Design.Button

  def render(assigns) do
    ~F"""
    <Button left_icon="generic_menu" variant="outline" on_click="open_sidebar">Open Wide Sidebar on small screens</Button>
    """
  end

  def code() do
    """

    """
  end
end
