defmodule Moon.Design.Modal do
  @moduledoc false
  use Moon.StatelessComponent

  slot(backdrop, required: true)
  slot(panel, required: true)

  prop(is_open, :boolean, default: false)
  prop(on_close, :event)

  prop(testid, :string)
  prop(id, :string)

  def render(assigns) do
    ~F"""
    <div
      {=@id}
      class={"fixed inset-0 overflow-y-auto z-[9999999]", hidden: @is_open == false}
      data-testid={@testid}
    >
      <div class="flex min-h-full items-center justify-center p-4">
        <#slot {@backdrop} />
        <#slot
          {@panel}
          context_put={
            on_close: @on_close
          }
        />
      </div>
    </div>
    """
  end
end
