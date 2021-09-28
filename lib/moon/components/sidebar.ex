defmodule Moon.Components.Sidebar do
  @moduledoc false

  use Moon.StatelessComponent
  alias Moon.Assets.Icons.IconChevronLeftRounded
  alias Moon.Assets.Icons.IconChevronRightRounded

  slot full_logo
  slot short_logo
  slot menu

  prop open_width, :string, default: "14.5rem"
  prop background_color, :string, default: ""

  def render(assigns) do
    ~F"""
    <div x-data="{ collapsed: false, showBtn: false }" class="flex flex-shrink-0">
      <div x-cloak x-show="collapsed" class="flex items-center p-5">
        <!-- Short logo -->
        <#slot name="short_logo" />

        <!-- Expand button -->
        <div class="ml-2">
          <button
            type="button"
            class="flex items-center justify-center w-6 h-6 rounded-full shadow-lg focus:outline-none"
            x-cloak
            @click="collapsed = false"
          >
            <span class="sr-only">Expand sidebar</span>
            <IconChevronRightRounded font_size="0.75rem" />
          </button>
        </div>
      </div>

      <div
        @mouseover="showBtn = true"
        @mouseout="showBtn = false"
        x-show="!collapsed"
        class="flex flex-col"
        style={"width: #{@open_width};"}
      >
        <div class={"relative flex flex-col h-screen py-5 #{@background_color}"}>
          <!-- Collapse button -->
          <div class="absolute top-0 right-0">
            <button
              type="button"
              class="flex items-center justify-center w-6 h-6 -mr-3 transition rounded-full shadow-lg mt-7 focus:outline-none bg-gohan-100"
              :class="{ 'opacity-100': showBtn, 'opacity-0': !showBtn }"
              x-cloak
              @click="collapsed = true"
            >
              <span class="sr-only">Collapse sidebar</span>
              <IconChevronLeftRounded font_size="0.75rem" />
            </button>
          </div>

          <!-- Full logo -->
          <div class="flex items-center flex-shrink-0 px-5">
            <#slot name="full_logo" />
          </div>

          <div class="flex-1 overflow-y-auto pl-5 pr-0">
            <!-- Menu -->
            <#slot name="menu" />
          </div>
        </div>
      </div>
    </div>
    """
  end
end
