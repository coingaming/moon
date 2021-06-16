defmodule Moon.Autolayouts.ButtonsList do
  use Moon.StatelessComponent

  slot(default)

  def render(assigns) do
    ~H"""
    <div class="flex gap-2 relative z-10 max-w-full flex-wrap">
      <slot />
    </div>
    """
  end
end
