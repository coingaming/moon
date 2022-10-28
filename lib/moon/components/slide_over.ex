defmodule Moon.Components.SlideOver do
  @moduledoc false

  use Moon.StatelessComponent

  alias Moon.Assets.Icons.IconCloseRounded
  alias Moon.Components.Heading

  prop on_close, :event, required: true

  slot heading
  slot options
  slot content, required: true

  def render(assigns) do
    ~F"""
    {!-- Overlay --}
    <div :on-click={@on_close} class="fixed inset-0 z-20" />
    <div class="w-screen max-w-2xl fixed top-0 right-0 bottom-0 w-1/2 p-6 z-20 bg-gohan-100 shadow overflow-y-auto">
      {!-- SlideOver Header --}
      <div class="flex items-center justify-between mb-6">
        <Heading size="20">
          <#slot {@heading} />
        </Heading>
        <div class="flex items-center">
          <#slot {@options} />
          <div class="p-2 rounded bg-goku-100 cursor-pointer" :on-click={@on_close}>
            <IconCloseRounded font_size="1.5rem" />
          </div>
        </div>
      </div>
      {!-- SlideOver Content --}
      <#slot {@content} />
    </div>
    """
  end
end
