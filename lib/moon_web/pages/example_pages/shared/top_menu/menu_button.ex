defmodule MoonWeb.Pages.ExamplePages.Shared.TopMenu.MenuButton do
  use MoonWeb, :stateless_component

  slot default
  prop class, :string

  def render(assigns) do
    ~H"""
    <div class="p-2 m-2 rounded-lg {{ @class }}"><slot /></div>
    """
  end
end
