defmodule MoonWeb.Pages.ExamplePages.Shared.TopMenu do
  use MoonWeb, :stateful_component

  alias __MODULE__.Search
  alias Moon.Assets.Icons.IconSettings
  alias Moon.Assets.Icons.IconBell
  alias Moon.Assets.Icons.IconLiveChat
  alias Moon.Assets.Logos.LogoLabFull
  alias Moon.Components.MenuButton

  def render(assigns) do
    ~F"""
    <div class="flex items-center gap-4 px-6 py-4 bg-gohan-100">
      <div>
        <LogoLabFull font_size="3.75rem" class="block h-5" />
      </div>

      <Search id="search" />

      <div class="flex items-center gap-x-4">
        <MenuButton title="Settings">
          <IconSettings />
        </MenuButton>
        <MenuButton title="Messages">
          <IconLiveChat />
        </MenuButton>
        <MenuButton title="Notifications">
          <IconBell />
        </MenuButton>

        <!-- TODO: Replace with avatar -->
        <div
          class="h-10 w-10 rounded flex items-center justify-center cursor-pointer relative text-sm text-gohan-100 bg-bulma-100"
          title="Profile"
        >
          <span>DN</span>
          <div
            class="absolute bottom-0 right-0 w-3 h-3 border-2 rounded-full"
            style="background-color: #0CD664;"
          ></div>
        </div>
      </div>
    </div>
    """
  end
end
