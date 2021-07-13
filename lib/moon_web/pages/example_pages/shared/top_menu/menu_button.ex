defmodule MoonWeb.Pages.ExamplePages.Shared.TopMenu.MenuButton do
  use MoonWeb, :stateless_component

  slot default
  prop class, :string
  prop title, :string

  def render(assigns) do
    ~F"""
    <div
      class={"h-10 w-10 rounded flex items-center justify-center cursor-pointer text-trunks-100 hover:text-bulma-100 hover:bg-goku-80 #{@class}"}
      title={@title}
    >
      <#slot />
    </div>
    """
  end
end
