defmodule Moon.Lego.Checkbox do
  @moduledoc "Simple checkbox with or without selected mark to be used anywhere. Some SVG inside. Renders as a span"

  use Moon.StatelessComponent

  @doc "Id to be given to the HTML tag"
  prop(id, :string)
  @doc "Data-testid attribute value"
  prop(testid, :string)
  @doc "Class to be given to the visible checkbox"
  prop(class, :css_class)
  @doc "If the checkbox has selected mark"
  prop(is_selected, :boolean, from_context: :is_selected)
  @doc "On_click event for the checkbox"
  prop(on_click, :event)

  def render(assigns) do
    ~F"""
    <span
      {=@id}
      data-testid={@testid}
      :on-click={@on_click}
      aria-hidden="true"
      aria-checked={(@is_selected && "true") || "false"}
      class={
        merge([
          "flex w-4 h-4 items-center justify-center text-moon-16",
          "transition-colors rounded-moon-s-xs text-goten shadow-trunks",
          "moon-checked:bg-piccolo moon-checked:shadow-none cursor-pointer",
          @class
        ]),
        "shadow-[0_0_0_1px_inset]"
      }
    >
      <svg
        xmlns="http://www.w3.org/2000/svg"
        width="16"
        height="16"
        viewBox="0 0 16 16"
        fill="none"
        class={"transition-opacity", "opacity-0": !@is_selected}
      >
        <path
          d="M3.5 7.47059L6.83333 11L12.5 5"
          stroke="currentColor"
          stroke-width="1.5"
          stroke-linecap="round"
          stroke-linejoin="round"
        />
      </svg>
    </span>
    """
  end
end
