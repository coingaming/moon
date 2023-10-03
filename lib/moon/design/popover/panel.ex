defmodule Moon.Design.Popover.Panel do
  @moduledoc false

  use Moon.StatelessComponent, slot: "default"

  import Moon.Helpers.Positions

  prop(class, :css_class)
  prop(position, :string, values!: position_list(), default: "top")

  slot(default, required: true)

  prop(testid, :string)
  prop(id, :string)

  def render(assigns) do
    ~F"""
    <div
      {=@id}
      class={merge([
        "absolute z-[9999999] w-72 overflow-y-auto rounded-moon-i-md box-border bg-goku shadow-moon-lg",
        position_class(@position),
        @class
      ])}
      data-testid={@testid}
    >
      <#slot />
    </div>
    """
  end
end
