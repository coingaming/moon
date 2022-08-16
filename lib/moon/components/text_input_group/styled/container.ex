defmodule Moon.Components.TextInputGroup.Container do
  @moduledoc false

  use Moon.StatelessComponent

  slot default

  def render(assigns) do
    ~F"""
    <Context
      get={Moon.Components.TextInputGroup, orientation: orientation}
      get={Moon.Components.TextInputGroup, dir: dir}
      get={Moon.Components.TextInputGroup, background_color: background_color}
      get={Moon.Components.TextInputGroup, is_error: is_error}
      get={Moon.Components.TextInputGroup, size: size}
    >
      <div
        {=dir}
        class={
          "flex border-none shadow-input relative",
          get_display_for_orientation(orientation),
          get_radius_for_size(size),
          get_class_for_orientation(orientation, is_error),
          background_color: background_color
        }
      >
        <slot />
      </div>
    </Context>
    """
  end

  defp get_display_for_orientation(orientation) do
    if orientation == "horizontal" do
      "flex-row"
    else
      "flex-col"
    end
  end

  defp get_radius_for_size(size) do
    if size == "xl" do
      "rounded-moon-i-md"
    else
      "rounded-moon-i-sm"
    end
  end

  defp get_class_for_orientation(is_error, orientation) do
    cond do
      orientation == "horizontal" && !is_error ->
        "after:content-[''] after:absolute after:top-0 after:bottom-0 after:w-px after:left-1/2 after:translate-x-[-50%] after:bg-beerus after:x-[3] hover:after:hidden focus-within:after:hidden"

      !is_error ->
        "after:content-[''] after:absolute after:top-1/2 after:bottom-0 after:w-full after:h-px after:left-0 after:translate-y-[-50%] after:bg-beerus after:x-[3] hover:after:hidden focus-within:after:hidden"

      true ->
        ""
    end
  end
end
