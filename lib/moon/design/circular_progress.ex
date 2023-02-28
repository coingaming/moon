defmodule Moon.Design.CircularProgress do
  @moduledoc false

  use Moon.StatelessComponent

  alias Moon.Design.CircularProgress.Path

  prop(bg_color, :string, default: "border-trunks/[.24]")
  prop(progress_color, :string, default: "border-piccolo")
  prop(size, :string, values: ["2xs", "xs", "sm", "md", "lg"], default: "md")
  prop(value, :decimal, default: 0)

  def render(assigns) do
    ~F"""
    <div class={merge([
      "relative w-full h-full rounded-full",
      get_circular_size(@size)
    ])}>
      <div class={
        merge([
          "absolute w-full h-full rounded-full",
          get_stroke_size(@size)
        ]),
        @bg_color
      } />
      <div class={
        merge([
          "absolute w-full h-full rounded-full  rtl:-scale-x-100 rtl:translate-x-full",
          get_stroke_size(@size)
        ]),
        @progress_color
      } />
    </div>
    <svg
      width="10"
      height="10"
      viewBox="0 0 10 10"
      class={"relative", get_circular_size(@size)}
      aria-valuemin={0}
      aria-valuemax={100}
      role="progressbar"
    >
      <Path/>
      <Path/>
    </svg>
    """
  end

  def get_circular_size(size) do
    case size do
      "2xs" -> "w-4 h-4"
      "xs" -> "w-6 h-6"
      "sm" -> "w-8 h-8"
      "md" -> "w-10 h-10"
      "lg" -> "w-12 h-12"
    end
  end

  defp get_stroke_size(size) do
    case size do
      "2xs" -> "border-2"
      "xs" -> "border-2"
      "sm" -> "border-2"
      "md" -> "border-4"
      "lg" -> "border-2"
    end
  end
end
