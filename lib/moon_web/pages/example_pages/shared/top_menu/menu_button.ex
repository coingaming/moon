defmodule MoonWeb.Pages.ExamplePages.Shared.TopMenu.MenuButton do
  use MoonWeb, :stateless_component

  slot default
  prop class, :string

  def render(assigns) do
    ~F"""
    <div
      class={"h-10 w-10 flex items-center justify-center cursor-pointer #{@class}"}
    >
      <#slot />
    </div>
    """
  end
end
