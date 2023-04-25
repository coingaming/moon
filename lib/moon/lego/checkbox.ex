defmodule Moon.Lego.Checkbox do
  @moduledoc false

  use Moon.StatelessComponent

  prop(id, :string)
  prop(testid, :string)
  prop(class, :css_class)
  prop(is_selected, :boolean)
  prop(on_click, :event)

  def render(assigns) do
    ~F"""
    <span
      {=@id}
      data-testid={@testid}
      :on-click={@on_click}
      aria-hidden="true"
      aria-checked={"#{@is_selected}"}
      class={
        merge([
          "flex w-4 h-4 items-center justify-center text-moon-16",
          "transition-colors rounded-moon-s-xs text-goten shadow-trunks",
          "moon-checked:bg-piccolo moon-checked:shadow-none",
          @class
        ]),
        "shadow-[0_0_0_1px_inset]"
      }
    >
      <svg
        width="1em"
        height="1em"
        viewBox="0 0 32 32"
        fill="none"
        xmlns="http://www.w3.org/2000/svg"
        class={"transition-opacity", "opacity-0": !@is_selected}
      >
        <path
          d="M7 14.941L13.667 22 25 10"
          stroke="currentColor"
          stroke-linecap="round"
          stroke-linejoin="round"
        />
      </svg>
    </span>
    """
  end
end
