defmodule Elixir.Moon.Light.Lego do
  @moduledoc false
  use Moon.Light.Component

  @doc "Simple checkbox with or without selected mark to be used anywhere. Some SVG inside. Renders as a span"
  attr(:id, :string, doc: "Id to be given to the HTML tag", default: nil)
  attr(:testid, :string, doc: "Data-testid attribute value", default: nil)
  attr(:class, :any, doc: "Class to be given to the visible checkbox", default: nil)
  attr(:is_selected, :boolean, doc: "If the checkbox has selected mark", default: nil)
  attr(:on_click, Event, doc: "On_click event for the checkbox", default: nil)

  def checkbox(assigns) do
    ~H"""
    <span
      id={@id}
      data-testid={@testid}
      phx-click={@on_click && @on_click.name}
      phx-target={@on_click && @on_click.target}
      aria-hidden="true"
      aria-checked={(@is_selected && "true") || "false"}
      class={[
        merge([
          "flex w-4 h-4 items-center justify-center text-moon-16",
          "transition-colors rounded-moon-s-xs text-goten shadow-trunks",
          "moon-checked:bg-piccolo moon-checked:shadow-none cursor-pointer",
          @class
        ]),
        "shadow-[0_0_0_1px_inset]"
      ]}
    >
      <svg
        xmlns="http://www.w3.org/2000/svg"
        width="16"
        height="16"
        viewBox="0 0 16 16"
        fill="none"
        class={["transition-opacity", "opacity-0": !@is_selected]}
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
