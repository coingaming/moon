defmodule MoonWeb.Pages.ExamplePages.TransactionsPage.MenuButton do
  use MoonWeb, :stateless_component

  slot default

  def render(assigns) do
    ~H"""
    <div class="p-4"><slot /></div>
    """
  end
end
