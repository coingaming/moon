defmodule Moon.Design.Modal do
  @moduledoc false
  use Moon.StatelessComponent

  alias Moon.Design.Modal.Backdrop

  prop(id, :string)
  prop(close, :event)
  slot(default)

  def render(assigns) do
    ~F"""
    <div class="fixed inset-0 overflow-y-auto z-[9999999]">
      <div id={@id} class="flex min-h-full items-center justify-center p-4">
        <Backdrop />
        <#slot />
      </div>
    </div>
    """
  end
end
