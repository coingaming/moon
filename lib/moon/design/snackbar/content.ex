defmodule Moon.Design.Snackbar.Content do
  @moduledoc false

  use Surface.Component, slot: "content"

  import Moon.Helpers.MergeClass

  alias Moon.Icon
  alias Moon.Icons.ControlsClose

  prop(class, :css_class)

  slot(header)
  slot(message)
  slot(icon_slot)

  prop(icon, :string)

  prop(on_close, :event, from_context: :on_close)

  prop(has_close, :boolean, default: false)

  def render(assigns) do
    ~F"""
    <div class={merge([
      "flex w-fit max-w-xs items-center gap-4 p-4 bg-gohan shadow-moon-lg rounded-moon-s-sm",
      @class
      ])}>

      <div class="flex aspect-square items-center justify-center rounded-moon-s-sm text-moon-32 h-10 bg-roshi-10 text-roshi">
      {#if slot_assigned?(:icon_slot)}
          <#slot {@icon_slot} />
        {#else}
          <Icon
            name={@icon}
            :if={@icon}
          />
        {/if}
      </div>

      <div class="w-full">
      <#slot {@header} />
      <#slot {@message} />
      </div>

      <button
      :if={@has_close}
      class={merge(["flex h-8 aspect-square items-center justify-center text-bulma text-moon-16", @class])}
      :on-click={@on_close}>
      <ControlsClose />
      </button>
    </div>
    """
  end
end
