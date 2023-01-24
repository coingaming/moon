defmodule Moon.Design.Modal do
  @moduledoc false
  use Moon.StatelessComponent

  slot(backdrop, required: true)
  slot(panel, required: true)

  def render(assigns) do
    ~F"""
    <div class="fixed inset-0 overflow-y-auto z-[9999999]">
      <div class="flex min-h-full items-center justify-center p-4">
        <#slot {@backdrop} />
        <#slot {@panel} />
      </div>
    </div>
    """
  end
end
