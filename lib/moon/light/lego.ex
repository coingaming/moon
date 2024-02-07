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
      phx-click={Event.from(@on_click).name}
      phx-target={Event.from(@on_click).target}
      aria-hidden="true"
      aria-checked={(@is_selected && "true") || "false"}
      class={
        merge([
          "flex w-4 h-4 items-center justify-center text-moon-16",
          "transition-colors rounded-moon-s-xs text-goten shadow-trunks",
          "moon-checked:bg-piccolo moon-checked:shadow-none cursor-pointer",
          "shadow-[0_0_0_1px_inset]",
          @class
        ])
      }
    >
      <svg
        xmlns="http://www.w3.org/2000/svg"
        width="16"
        height="16"
        viewBox="0 0 16 16"
        fill="none"
        class={merge(["transition-opacity", "opacity-0": !@is_selected])}
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

  @doc "Radio round mark to be shown"
  attr(:class, :any, doc: "Additional CSS classes for the ", default: nil)
  attr(:id, :string, doc: "Id attribute to be given to the HTML tag", default: nil)
  attr(:testid, :string, doc: "Data-testid attribute value", default: nil)
  attr(:is_selected, :boolean, doc: "If the mark should be checked ", default: nil)

  def radio(assigns) do
    ~H"""
    <span
      aria-checked={(@is_selected && "true") || "false"}
      class={
        merge([
          "relative flex items-center justify-center w-4 h-4 aspect-square m-1 rounded-full border border-trunks transition-colors",
          "after:content-[\"\"] after:absolute after:w-0 after:h-0 after:rounded-full after:top-1/2 after:left-1/2",
          "after:-translate-y-1/2 after:transition-all after:-translate-x-1/2 after:bg-piccolo",
          "moon-checked:after:w-2 moon-checked:after:h-2 moon-checked:border-piccolo",
          @class
        ])
      }
      id={@id}
      data-testid={@testid}
    />
    """
  end
end
