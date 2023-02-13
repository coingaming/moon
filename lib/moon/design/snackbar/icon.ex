defmodule Moon.Design.Snackbar.Icon do
  @moduledoc false

  use Moon.StatelessComponent, slot: "icon"

  slot(default)

  prop(class, :css_class)

  def render(assigns) do
    ~F"""
    <div class={merge([
      "flex aspect-square items-center justify-center rounded-moon-s-sm text-moon-32 h-10",
      @class
    ])}>
      <#slot />
    </div>
    """
  end
end
