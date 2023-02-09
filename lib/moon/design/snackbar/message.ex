defmodule Moon.Design.Snackbar.Message do
  @moduledoc false

  use Moon.StatelessComponent, slot: "message"

  prop(class, :css_class)

  slot(default)

  def render(assigns) do
    ~F"""
    <p class={merge(["w-full text-moon-14 transition-colors text-bulma", @class])}>
      <#slot />
    </p>
    """
  end
end
