defmodule Moon.Components.MenuItem.Checkbox do
  @moduledoc false

  use Moon.StatelessComponent

  prop(is_selected, :boolean, default: false)

  def render(assigns) do
    ~F"""
    <span class="flex w-6 h-6 justify-center items-center">
      <span class={
        "block relative w-4 min-w-[1rem] h-4 rounded-moon-i-xs duration-200 transition-[background-color]",
        (@is_selected && "bg-piccolo-100 shadow-none") || "shadow-[0_0_0_1px_inset] shadow-trunks"
      }>
        <span :if={@is_selected} class="absolute top-1/2 left-1/2 translate-x-[-50%] translate-y-[-50%]">
          <svg
            width="1em"
            height="1em"
            viewBox="0 0 32 32"
            fill="none"
            xmlns="http://www.w3.org/2000/svg"
            class="text-[1rem] text-goten"
          >
            <path
              d="M7 14.941L13.667 22 25 10"
              stroke="currentColor"
              strokeLinecap="round"
              strokeLinejoin="round"
            />
          </svg>
        </span>
      </span>
    </span>
    """
  end
end
