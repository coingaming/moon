defmodule Moon.Autolayouts.TopToDown do
  use Moon.StatelessComponent

  slot(default)
  prop(class, :string, default: nil)

  def render(assigns) do
    ~H"""
    <div class="flex gap-2 flex-col {{ @class }}">
      <slot />
    </div>
    """
  end
end
