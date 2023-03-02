defmodule Moon.Design.CircularProgress do
  @moduledoc false

  use Moon.StatelessComponent

  prop(bg_color, :string, default: "stroke-trunks/[.24]")
  prop(progress_color, :string, default: "stroke-piccolo")
  prop(size, :string, values: ["2xs", "xs", "sm", "md", "lg"], default: "md")
  prop(value, :decimal, default: 0)

  def render(assigns) do
    ~F"""
    <svg
      style={get_style(width: "1em", height: "1em", vertical_align: "middle")}
      viewBox={"0 0 #{viewbox_width()} #{viewbox_height()}"}
      font-size={get_circular_size(@size)}
      aria-valuemin={0}
      aria-valuemax={100}
      aria-valuenow={@value}
      role="progressbar"
    >
      <path
        style={get_style(fill_opacity: 0)}
        class={"stroke-[0.5rem] #{@bg_color}"}
        d={"M #{viewbox_center_x()},#{viewbox_center_y()}
          m 0,-#{path_radius()}
          a #{path_radius()},#{path_radius()} 0 1 1 0,#{2 * path_radius()}
          a #{path_radius()},#{path_radius()} 0 1 1 0,-#{2 * path_radius()}"}
      />
      <path
        style={get_style(fill_opacity: 0, stroke_linecap: "round", stroke_dashoffset: "216.76989309769573px")}
        class={"stroke-[0.5rem] rtl:-scale-x-100 rtl:translate-x-full #{@progress_color} "}
        stroke-dasharray={"#{circumference()}px #{circumference()}px"}
        value={@value}
        d={"M #{viewbox_center_x()},#{viewbox_center_y()}
          m 0,-#{path_radius()}
          a #{path_radius()},#{path_radius()} 0 1 1 0,#{2 * path_radius()}
          a #{path_radius()},#{path_radius()} 0 1 1 0,-#{2 * path_radius()}
           "}
      />
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

  defp viewbox_width(), do: 100
  defp viewbox_height(), do: 100
  defp viewbox_center_x(), do: 50
  defp viewbox_center_y(), do: 50
  defp path_radius(), do: (viewbox_height() - 8) / 2
  defp circumference(), do: pi() * 2 * path_radius()
  defp pi(), do: 3.14159
end
