defmodule Moon.Lego.Radio do
  @moduledoc false

  use Moon.StatelessComponent

  prop(is_selected, :boolean, from_context: :is_selected)
  prop(class, :css_class)
  prop(id, :string)
  prop(testid, :string)

  def render(assigns) do
    ~F"""
    <span
      aria-checked={"#{@is_selected}"}
      class={merge([
        "relative flex items-center justify-center w-4 h-4 aspect-square m-1 rounded-full border border-trunks transition-colors",
        "after:content-[\"\"] after:absolute after:w-0 after:h-0 after:rounded-full after:top-1/2 after:left-1/2",
        "after:-translate-y-1/2 after:transition-all after:-translate-x-1/2 after:bg-piccolo",
        "moon-checked:after:w-2 moon-checked:after:h-2 moon-checked:border-piccoloo",
        @class
      ])}
      {=@id}
      data-testid={@testid}
    />
    """
  end
end
