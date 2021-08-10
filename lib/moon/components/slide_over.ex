defmodule Moon.Components.SlideOver do
  use Moon.StatelessComponent

  alias Moon.Assets.Icons.IconCloseRounded

  prop on_close, :event, required: true

  slot default, required: true
  slot header
  slot options

  def render(assigns) do
    ~F"""
    <div
      :on-click={@on_close}
      class="fixed inset-0 z-20"
    />
    <div class="fixed top-0 right-0 bottom-0 w-1/2 p-6 z-20 bg-gohan-100 shadow overflow-y-auto">
      <div class="flex mb-6">
        <div class="flex-1">
          <#slot name="header" />
        </div>
        <div class="flex items-center">
          <#slot name="options" />
          <div class="p-2 rounded bg-goku-100 cursor-pointer" :on-click={@on_close}>
            <IconCloseRounded font_size="1.5rem" />
          </div>
        </div>
      </div>
      <#slot />
    </div>
    """
  end
end
