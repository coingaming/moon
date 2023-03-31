defmodule Moon.Design.Modal.Panel do
  @moduledoc false

  use Moon.StatelessComponent, slot: "panel"

  prop(class, :css_class)
  slot(default)

  prop(id, :string)
  prop(testid, :string)

  # Internal API
  prop(on_close, :event, from_context: :on_close)

  def render(assigns) do
    ~F"""
    <div
      {=@id}
      class={merge([
        "w-full max-w-sm inline-block transform rounded-xl bg-gohan align-middle shadow-moon-lg transition-all",
        "moon-panel",
        @class
      ])}
      :on-click-away={@on_close}
      data-testid={@testid}
    >
      <#slot />
    </div>
    """
  end
end
