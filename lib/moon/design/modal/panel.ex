defmodule Moon.Design.Modal.Panel do
  @moduledoc false

  use Surface.Component, slot: "panel"

  import Moon.Helpers.MergeClass

  prop(class, :css_class)

  slot(default)
  slot(header)

  def render(assigns) do
    ~F"""
    <div class={merge([
      "w-full max-w-sm inline-block transform rounded-xl bg-gohan align-middle shadow-moon-lg transition-all",
      @class
    ])}>
      {#if slot_assigned?(:header)}
        <#slot {@header} />
      {/if}
      <#slot />
    </div>
    """
  end
end
