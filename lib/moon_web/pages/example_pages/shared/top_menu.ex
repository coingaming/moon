defmodule MoonWeb.Pages.ExamplePages.Shared.TopMenu do
  use MoonWeb, :stateful_component

  alias __MODULE__.Search
  alias __MODULE__.MenuButton
  alias Moon.Assets.Icons.IconSettings
  alias Moon.Assets.Icons.IconBell
  alias Moon.Assets.Icons.IconLiveChat
  alias Moon.Assets.Logos.LogoLabFull

  def render(assigns) do
    ~F"""
    <div class="flex gap-2 items-center p-4 bg-gohan-100">
      <div class="p-2"><LogoLabFull font_size="5rem" /></div>
      <Search id="search" />
      <div class="flex gap-2 items-center">
        <MenuButton><IconSettings /></MenuButton>
        <MenuButton><IconLiveChat /></MenuButton>
        <MenuButton><IconBell /></MenuButton>
        <MenuButton class="bg-piccolo-100 text-gohan-100 relative">
          DN
          <div class="absolute right-0 bottom-0 w-3 h-3 border-2 rounded-full" style="background-color: #0CD664;"></div>
        </MenuButton>
      </div>
    </div>
    """
  end
end
