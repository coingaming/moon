defmodule Moon.Design.Snackbar.Header do
  @moduledoc false

  use Moon.StatelessComponent, slot: "header"

  prop(class, :css_class)

  slot(default)

  def render(assigns) do
    ~F"""
    <div class={merge(["w-full text-moon-14 font-medium transition-colors text-bulma", @class])}>
      <#slot />
    </div>
    """
  end
end
