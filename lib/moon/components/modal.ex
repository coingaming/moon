defmodule Moon.Components.Modal do
  use Moon.StatelessComponent

  alias Moon.Components.{Divider, Heading}
  alias Moon.Assets.Icons.IconCloseRounded

  prop on_close, :event, required: true

  slot heading
  slot content, required: true
  slot footer

  def render(assigns) do
    ~F"""
    <div class="fixed inset-0 z-40">
      <div class="flex items-end justify-center min-h-screen pt-4 px-4 pb-20 text-center sm:block sm:p-0">
        {!-- Overlay --}
        <div
          :on-click={@on_close}
          class="fixed inset-0 bg-piccolo-100 opacity-40"
        />

        <span class="hidden sm:inline-block sm:align-middle sm:h-screen" />

        {!-- Modal --}
        <div class="max-w-4xl inline-block align-bottom bg-gohan-100 rounded-lg py-3 text-left overflow-hidden shadow-xl transform transition-all sm:my-8 sm:align-middle sm:max-w-lg sm:w-full">
          <div class="flex items-center justify-between px-3">
            <Heading size="20"><#slot name="heading" /></Heading>
            <div class="p-2 rounded bg-goku-100 cursor-pointer" :on-click={@on_close}>
              <IconCloseRounded font_size="1.5rem" />
            </div>
          </div>

          <Divider class="my-3" />
          <div class="mx-3"><#slot name="content" /></div>
          <Divider class="my-3" />

          <div class="px-3">
            <#slot name="footer" />
          </div>
        </div>
      </div>
    </div>
    """
  end
end
