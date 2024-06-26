defmodule Moon.Components.Lego.Checkbox do
  @moduledoc false

  use Moon.StatelessComponent

  prop(is_selected, :boolean, from_context: :is_selected)

  def render(assigns) do
    ~F"""
    <span class="flex w-6 h-6 justify-center items-center">
      <div class={
        "z-0 left-0 rounded-sm w-4 h-4 inline-block",
        "border border-trunks": !@is_selected,
        "border border-piccolo bg-piccolo": @is_selected
      }>
        <div :if={@is_selected} style="padding-left: 2px; padding-top: 4px">
          <svg width="10" height="7" viewBox="0 0 10 7" fill="none" xmlns="http://www.w3.org/2000/svg">
            <path
              fill-rule="evenodd"
              clip-rule="evenodd"
              d="M9 0C8.72 0 8.47 0.11 8.29 0.29L4 4.59L1.71 2.29C1.53 2.11 1.28 2 1 2C0.45 2 0 2.45 0 3C0 3.28 0.11 3.53 0.29 3.71L3.29 6.71C3.47 6.89 3.72 7 4 7C4.28 7 4.53 6.89 4.71 6.71L9.71 1.71C9.89 1.53 10 1.28 10 1C10 0.45 9.55 0 9 0Z"
              fill="white"
            />
          </svg>
        </div>
      </div>
    </span>
    """
  end
end
