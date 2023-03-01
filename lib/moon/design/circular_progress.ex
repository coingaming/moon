defmodule Moon.Design.CircularProgress do
  @moduledoc false

  use Moon.StatelessComponent

  alias Moon.Design.CircularProgress.Path

  prop(bg_color, :string, default: "trunks/[.24]")
  prop(progress_color, :string, default: "border-piccolo")
  prop(size, :string, values: ["2xs", "xs", "sm", "md", "lg"], default: "md")
  prop(value, :decimal, default: 0)

  prop(dash_ratio, :number)
  prop(path_radius, :number)

  def render(assigns) do
    ~F"""
    <!--<div class={merge([
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
    </div>-->
    <svg
      style={get_style(width: "2.5rem", height: "2.5rem", vertical_align: "middle")}
      viewBox="0 0 10 10"
      fontSize: {get_circular_size(@size)}
      aria-valuemin={0}
      aria-valuemax={100}
      role="progressbar"
    >
      <path
      style={get_style(fill_opacity: 0, stroke: "blue", stroke_width: "0.5")}
      d="M 5,5
      m 0,-4
      a 4,4 0 1 1 0,8
      a 4,4 0 1 1 0,-8"
      >
      </path>
      <path/>
    </svg>
    """
  end

  def get_circular_size(size) do
    case size do
      "2xs" -> "1rem"
      "xs" -> "1.5rem"
      "sm" -> "2rem"
      "md" -> "2.5rem"
      "lg" -> "3rem"
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


  defp viewbox_width(), do: 100

  defp viewbox_height(), do: 100

  defp viewbox_center_x(), do: 50

  defp viewbox_center_y(), do: 50

  defp path_radius(), do: ({viewbox_height} - 2) / 2
end
