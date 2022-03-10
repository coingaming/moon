defmodule Moon.Components.Drawer.Dialog do
  @moduledoc false
  use Moon.StatelessComponent

  alias Moon.Autolayouts.PullAside
  alias Moon.Components.Divider
  alias Moon.Icons.ControlsClose

  prop close, :event
  slot title
  slot content
  slot footer

  def render(assigns) do
    ~F"""
    <div class="relative w-full h-full bg-gohan-100">
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
        <div class="p-6">
          <#slot name="content" />
        </div>
      {/if}
      {#if slot_assigned?(:footer)}
        <div class="absolute bottom-0 left-0 right-0">
          <Divider />
          <div class="p-4">
            <#slot name="footer" />
          </div>
        </div>
      {/if}
    </div>
    """
  end
end

defmodule Moon.Components.Drawer do
  @moduledoc false
  use Moon.StatelessComponent
  prop id, :string
  prop testid, :string
  prop class, :css_class
  prop close, :event
  slot default

  def render(assigns) do
    ~F"""
    <div
      id={@id}
      class={"fixed top-0 right-0 bottom-0 bg-gohan-100 z-[999]", @class}
      data-testid={@testid}
    >
      <#slot />
    </div>
    """
  end
end
