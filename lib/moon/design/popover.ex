defmodule Moon.Design.Popover do
  @moduledoc false

  use Moon.StatelessComponent

  slot(default, required: true)
  slot(trigger, required: true)

  def render(assigns) do
    ~F"""
    <div class="relative inline-block group">
      <div class="hidden group-hover:block">
        <#slot />
      </div>
      <div aria-describedby="tooltip" class="inline-block">
        <#slot {@trigger} />
      </div>
    </div>
    """
  end
end
