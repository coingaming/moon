defmodule MoonWeb.Pages.ExamplePages.Shared.TopMenu do
  @moduledoc false

  use MoonWeb, :stateful_component

  alias __MODULE__.Search
  alias Moon.Assets.Logos.LogoLabFull
  alias Moon.Components.IconButton

  prop class, :string
  prop reduced_opacity, :boolean, default: false

  def render(assigns) do
    ~F"""
    <div class={
      "flex items-center justify-between px-6 py-4 bg-gohan-100 #{@class}",
      "opacity-30": @reduced_opacity
    }>
      <div>
        <LogoLabFull font_size="3.75rem" class="block h-5" />
      </div>

      <div class="flex-1">
        <div class="text-center">
          <Search id="search" />
        </div>
      </div>

      <div class="flex items-center gap-x-4">
        <IconButton icon_name="generic_settings" title="Settings" />
        <IconButton icon_name="chat_chat" title="Messages" />
        <IconButton icon_name="notifications_bell_ringing_alternative" title="Notifications" />

        <!-- TODO: Replace with avatar -->
        <div
          class="h-10 w-10 rounded flex items-center justify-center cursor-pointer relative text-moon-14 text-gohan-100 bg-bulma-100"
          title="Profile"
        >
          <span>DN</span>
          <div
            class="absolute bottom-0 right-0 w-3 h-3 border-2 rounded-full"
            style="background-color: #0CD664;"
          />
        </div>
      </div>
    </div>
    """
  end
end
