defmodule Moon.Components.Lego.Radio do
  @moduledoc false

  use Moon.StatelessComponent

  prop(is_selected, :boolean, from_context: :is_selected)
  prop(class, :css_class)
  prop(id, :string)
  prop(testid, :string)

  def render(assigns) do
    ~F"""
    <span class="flex w-6 h-6 justify-center items-center" {=@id} data-testid={@testid}>
      <span class={
        merge([
          "block relative w-4 h-4 rounded-full",
          (@is_selected && "shadow-piccolo") || "shadow-trunks",
          @class
        ]),
        "shadow-[0_0_0_1px_inset]"
      }>
        <span class={
          (@is_selected && "scale") || "scale-0",
          "h-2 w-2 rounded-full absolute top-1/2 left-1/2 translate-x-[-50%] translate-y-[-50%] bg-piccolo transition-transform"
        } />
      </span>
    </span>
    """
  end
end
