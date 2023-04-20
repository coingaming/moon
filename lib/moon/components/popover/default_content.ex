defmodule Moon.Components.Popover.DefaultContent do
  @moduledoc false

  use Moon.StatelessComponent
  alias Moon.Autolayouts.TopToDown

  slot(default)

  def render(assigns) do
    ~F"""
    <div class={
      "overflow-auto rounded-moon-i-md box-border border border-solid",
      "border-beerus drop-shadow-2xl bg-gohan"
    }>
      <TopToDown>
        <#slot {@default} />
      </TopToDown>
    </div>
    """
  end
end
