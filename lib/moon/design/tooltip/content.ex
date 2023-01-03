defmodule Moon.Design.Tooltip.Content do
  @moduledoc false

  use Surface.Component, slot: "default"

  prop(class, :css_class)

  # prop(position, :string,
  #   values!: [
  #     "top-start",
  #     "top-center",
  #     "top-end",
  #     "bottom-start",
  #     "bottom-center",
  #     "bottom-end",
  #     "right",
  #     "left"
  #   ],
  #   default: "top-center"
  # )

  prop(position, :string,
    values: ["top", "right", "bottom", "left"],
    default: "top"
  )

  slot(default, required: true)

  # x-data={"{ position: \"#{@position}\" }"}

  def render(assigns) do
    ~F"""
    <div x-cloak x-show="tooltip" x-data-position={@position} class="absolute left-0 top-0 right-0 flex flex-col items-center">
      <div class="-translate-y-full">
        <div class="w-48 p-4 text-moon-14 text-center bg-gohan shadow rounded">
          <#slot />
        </div>
        <div class="w-full overflow-hidden">
          <div class="h-3 w-3 mx-auto bg-gohan -rotate-45 -translate-y-1/2 shadow" />
        </div>
      </div>
    </div>
    """
  end
end
