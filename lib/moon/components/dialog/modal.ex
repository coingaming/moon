defmodule Moon.Components.Dialog.Modal.BackgroundCover do
  @moduledoc false

  use Moon.StatelessComponent
  prop close, :event

  def render(assigns) do
    ~F"""
    <div
      :on-click={@close}
      class="fixed inset-0 bg-black opacity-[.66] transition-opacity"
      aria-hidden="true"
    />
    """
  end
end

defmodule Moon.Components.Dialog.Modal.Panel do
  @moduledoc false
  use Moon.StatelessComponent
  prop close, :event
  slot default

  def render(assigns) do
    ~F"""
    <div class="inline-block align-bottom rounded overflow-hidden shadow-xl transform transition-all sm:align-middle sm:max-w-lg sm:w-full bg-gohan-100 z-20">
      <#slot />
    </div>
    """
  end
end

defmodule Moon.Components.Dialog.Modal do
  @moduledoc false
  use Moon.StatelessComponent

  alias Moon.Autolayouts.PullAside
  alias Moon.Components.Divider
  alias Moon.Icons.ControlsClose
  alias __MODULE__.BackgroundCover
  alias __MODULE__.Panel

  prop close, :event
  slot title
  slot content
  slot footer

  def render(assigns) do
    ~F"""
    <div
      class="fixed z-10 inset-0 overflow-y-auto"
      aria-labelledby="modal-title"
      role="dialog"
      aria-modal="true"
    >
      <div class="flex items-end justify-center min-h-screen pt-4 px-4 pb-20 text-center sm:block sm:p-0">
        <BackgroundCover close={@close} />
        <span class="hidden sm:inline-block sm:align-middle sm:h-screen" aria-hidden="true">&#8203;</span>
        <Panel>
          <PullAside class="py-4 px-6">
            <:left>
              {#if slot_assigned?(:title)}
                <div class="text-lg font-medium">
                  <#slot name="title" />
                </div>
              {/if}
            </:left>
            <:right>
              <div :on-click={@close}><ControlsClose /></div>
            </:right>
          </PullAside>
          <Divider />
          {#if slot_assigned?(:content)}
            <div class="text-left p-6">
              <#slot name="content" />
            </div>
          {/if}
          <Divider />
          {#if slot_assigned?(:footer)}
            <div class="p-6">
              <#slot name="footer" />
            </div>
          {/if}
        </Panel>
      </div>
    </div>
    """
  end
end
