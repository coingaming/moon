defmodule Moon.Components.Dialog.Modal.BackgroundCover do
  use Moon.StatelessComponent
  prop close, :event

  def render(assigns) do
    ~F"""
    <div
      :on-click={@close}
      class="fixed inset-0 transition-opacity"
      style="background-color: rgba(0, 0, 0, 0.56); z-index: 998"
      aria-hidden="true"
    >
    </div>
    """
  end
end

defmodule Moon.Components.Dialog.Modal.Panel do
  use Moon.StatelessComponent
  prop close, :event
  slot default

  def render(assigns) do
    ~F"""
    <div
      class="inline-block align-bottom rounded p-6 overflow-hidden shadow-xl transform transition-all sm:align-middle sm:max-w-lg sm:w-full sm:p-6 bg-gohan-100"
      style="z-index: 999"
    >
      <#slot />
    </div>
    """
  end
end

defmodule Moon.Components.Dialog.Modal do
  use Moon.StatelessComponent

  alias Moon.Autolayouts.PullAside
  alias Moon.Icon
  alias __MODULE__.BackgroundCover
  alias __MODULE__.Panel

  prop close, :event
  slot title
  slot content
  slot footer

  def render(assigns) do
    ~F"""
    <BackgroundCover close={@close} />
    <div class="fixed inset-0 overflow-y-auto" aria-labelledby="modal-title" role="dialog" aria-modal="true" style="z-index: 999">
      <div class="flex items-end justify-center min-h-screen pt-4 px-4 pb-20 text-center sm:block sm:p-0">
        <span class="hidden sm:inline-block sm:align-middle sm:h-screen" aria-hidden="true">&#8203;</span>
        <Panel>
          <PullAside>
            <:left>
              {#if slot_assigned?(:title)}
                <#slot name="title" />
              {/if}
            </:left>
            <:right>
              <div :on-click={@close}><Icon name="controls_close_small" /></div>
            </:right>
          </PullAside>
          {#if slot_assigned?(:content)}
            <#slot name="content" />
          {/if}
          {#if slot_assigned?(:footer)}
            <#slot name="footer" />
          {/if}
        </Panel>
      </div>
    </div>
    """
  end
end
