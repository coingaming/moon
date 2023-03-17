defmodule Moon.Design.Drawer do
  @moduledoc false

  use Moon.StatelessComponent

  prop(is_open, :boolean, default: false)

  prop(on_close, :event)

  slot(panel, required: true)
  slot(backdrop)

  prop(test_id, :string)

  def render(assigns) do
    ~F"""
    <div
      aria-expanded={(@is_open && "true") || "false"}
      class={"fixed z-[99999] inset-0", hidden: @is_open == false}
      data-testid={@test_id}
    >
      <#slot {@backdrop} />
      <#slot
        {@panel}
        context_put={
          on_close: @on_close
        }
      />
    </div>
    """
  end
end
