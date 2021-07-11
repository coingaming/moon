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
    <div class="flex gap-4 items-center bg-gohan-100 py-4 px-6">
      <div>
        <LogoLabFull font_size="3.75rem" class="block h-5" />
      </div>

      <Search id="search" />

      <div class="flex gap-x-4 items-center">
        <MenuButton class="text-trunks-100"><IconSettings /></MenuButton>
        <MenuButton class="text-trunks-100"><IconLiveChat /></MenuButton>
        <MenuButton class="text-trunks-100"><IconBell /></MenuButton>
        <MenuButton class="text-gohan-100 bg-piccolo-100 text-xs relative rounded-sm">
          <span>DN</span>
          <div
            class="absolute right-0 bottom-0 w-3 h-3 border-2 rounded-full"
            style="background-color: #0CD664;"
          ></div>
        </MenuButton>
      </div>
    </div>
    """
  end
end
