defmodule Moon.Components.Sidebar do
  use Moon.StatelessComponent
  alias Moon.Assets.Icons.IconChevronLeftRounded
  alias Moon.Assets.Icons.IconChevronRightRounded

  slot full_logo
  slot short_logo
  slot menu

  prop open_width, :string, default: "14.5rem"

  def render(assigns) do
    ~H"""
    {{ asset_import @socket, "js/tailwind" }}

    <div
      x-data="{ collapsed: false, showBtn: false }"
      class="flex flex-shrink-0"
    >
      <div
        x-cloak
        x-show="collapsed"
        class="p-5 flex items-center"
      >
        <!-- Short logo -->
        <slot name="short_logo" />

        <!-- Expand button -->
        <div class="ml-2">
          <button
            type="button"
            class="flex items-center justify-center h-6 w-6 rounded-full focus:outline-none shadow-lg"
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
        style="width: {{ @open_width }};"
      >
        <div class="relative flex flex-col flex-grow p-5">
          <!-- Collapse button -->
          <div class="absolute top-0 right-0">
            <button
              type="button"
              class="mt-7 -mr-3 flex items-center justify-center h-6 w-6 rounded-full focus:outline-none shadow-lg transition"
              :class="{ 'opacity-100': showBtn, 'opacity-0': !showBtn }"
              x-cloak
              @click="collapsed = true"
            >
              <span class="sr-only">Collapse sidebar</span>
              <IconChevronLeftRounded font_size="0.75rem" />
            </button>
          </div>

          <!-- Full logo -->
          <slot name="full_logo" />

          <div class="flex-grow">
            <!-- Menu -->
            <slot name="menu" />
          </div>
        </div>
      </div>
    </div>
    """
  end
end
