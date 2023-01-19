defmodule Moon.Design.Tooltip do
  @moduledoc false

  use Moon.StatefulComponent

  prop(selected_index, :integer, default: 0)

  slot(default, required: true)
  slot(trigger, required: true)

  def render(assigns) do
    ~F"""
    <div class="relative inline-block group" tabindex={@selected_index}>
      <div
        role="tooltip"
        class="hidden group-hover:block group-focus:block transition-opacity transition-200"
        ,
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
