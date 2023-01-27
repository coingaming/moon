defmodule Moon.Design.Modal.Panel do
  @moduledoc false

  use Moon.StatelessComponent, slot: "panel"

  prop(class, :css_class)

  slot(default)
  slot(header)

  def render(assigns) do
    ~F"""
    <div class={merge([
      "w-full max-w-sm inline-block transform rounded-xl bg-gohan align-middle shadow-moon-lg transition-all",
      @class
    ])}>
      <#slot {@header} />
      <#slot />
    </div>
    """
  end
end
