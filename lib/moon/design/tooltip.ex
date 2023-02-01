defmodule Moon.Design.Tooltip do
  @moduledoc false

  use Moon.StatelessComponent

  prop(tabindex, :string, default: "0")
  prop(class, :css_class)

  slot(default, required: true)
  slot(trigger, required: true)

  def render(assigns) do
    ~F"""
    <div class={merge(["relative inline-block group focus:outline-none", @class])} {=@tabindex}>
      <div
        role="tooltip"
        class="hidden group-hover:block group-focus:block transition-opacity duration-200"
      >
        <#slot />
      </div>
      <div
        aria-describedby="tooltip"
        class="inline-block group-focus:ring-2 group-focus:outline-none rounded-moon-s-sm"
      >
        <#slot {@trigger} />
      </div>
    </div>
    """
  end
end
