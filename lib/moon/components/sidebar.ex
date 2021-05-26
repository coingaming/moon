defmodule Moon.Components.Sidebar do
  use Moon.StatelessComponent
  alias Moon.Assets.Icons.IconChevronLeftRounded
  alias Moon.Assets.Icons.IconChevronRightRounded
  alias Moon.Assets.Icons.IconSlots
  alias Moon.Assets.Icons.IconSportsBaseBall
  alias Moon.Assets.Logos.LogoBitcasinoFull
  alias Moon.Assets.Logos.LogoBitcasinoShort

  def render(assigns) do
    ~H"""
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
        <div class="flex items-center h-10">
          <LogoBitcasinoShort font_size="2.1rem" />
        </div>

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
        class="flex flex-col w-56"
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
          <div class="flex items-center flex-shrink-0">
            <LogoBitcasinoFull font_size="10rem" class="h-10" />
          </div>

          <div class="flex-grow">
            <!-- Menu -->
            <nav class="mt-6 space-y-3 h-96">
              <a href="#" class="group flex items-center">
                <IconSlots font_size="1.75rem" class="mr-3 flex-shrink-0 transition transform scale-100 group-hover:scale-110" />
                <span class="group-hover:text-piccolo-100">Slots</span>
              </a>
              <a href="#" class="group flex items-center">
                <IconSportsBaseBall font_size="1.75rem" class="mr-3 flex-shrink-0 transition transform scale-100 group-hover:scale-110" />
                <span class="group-hover:text-piccolo-100">Baseball</span>
              </a>
            </nav>
          </div>
        </div>
      </div>
    </div>
    """
  end
end
