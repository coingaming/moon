defmodule Moon.Design.Snackbar.Close do
  @moduledoc false

  use Moon.StatelessComponent, slot: "close"

  alias Moon.Icons.ControlsClose

  slot(default)

  prop(class, :css_class)

  def render(assigns) do
    ~F"""
    <button class={merge(["flex h-8 aspect-square items-center justify-center text-bulma text-moon-16", @class])}>
      <ControlsClose />
    </button>
    """
  end
end
