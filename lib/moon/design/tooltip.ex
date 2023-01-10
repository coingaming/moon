defmodule Moon.Design.Tooltip do
  @moduledoc false

  use Moon.StatelessComponent

  slot(default, required: true)
  slot(trigger, required: true)

  def render(assigns) do
    ~F"""
    <div class="relative inline-block group">
      <div
        role="tooltip"
        class="hidden group-hover:block pointer-events-none transition-opacity transition-200"
      >
        <#slot />
      </div>
      <div aria-describedby="tooltip" class="inline-block">
        <#slot {@trigger} />
      </div>
    </div>
    """
  end
end
