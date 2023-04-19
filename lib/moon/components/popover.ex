defmodule Moon.Components.Popover do
  @moduledoc false

  use Moon.StatelessComponent

  prop(class, :css_class)
  prop(inline_class, :boolean)
  prop(show, :boolean)

  prop(placement, :string,
    values: [
      "top-start",
      "top",
      "top-end",
      "right-start",
      "right",
      "right-end",
      "bottom-start",
      "bottom",
      "bottom-end",
      "left-start",
      "left",
      "left-end"
    ],
    default: "bottom-start"
  )

  prop(on_close, :event)

  prop(testid, :string)

  slot(default, required: true)
  slot(content, required: true)

  def render(assigns) do
    ~F"""
    <div :hook="default" data-testid={@testid} data-placement={@placement}>
      <div aria-describedby="tooltip"><#slot /></div>
      {#if @show}
        <div class="fixed z-50" role="tooltip" :on-click-away={@on_close}><#slot {@content} /></div>
        <div :on-click={@on_close} class="fixed inset-0 z-40" data-testid="close" />
      {/if}
    </div>
    """
  end
end
