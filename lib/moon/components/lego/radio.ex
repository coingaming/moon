defmodule Moon.Components.Lego.Radio do
  @moduledoc false

  use Moon.StatelessComponent

  prop(is_selected, :boolean, from_context: {Moon.Components.Lego, :is_selected})
  prop(class, :css_class)

  def render(assigns) do
    ~F"""
    <span class="flex w-6 h-6 justify-center items-center">
      <span class={
        "block relative w-4 h-4 rounded-full shadow-[0_0_0_1px_inset] ",
        (@is_selected && "shadow-piccolo") || "shadow-trunks",
        @class
      }>
        <span class={
          (@is_selected && "scale-100") || "scale-0",
          "h-2 w-2 rounded-full absolute top-1/2 left-1/2 translate-x-[-50%] translate-y-[-50%] bg-piccolo-100 transition-transform"
        } />
      </span>
    </span>
    """
  end
end
