defmodule Moon.Helpers.Styled do
  @moduledoc false

  def get_style(string_style, props) do
    props_style = get_style(props)

    if string_style do
      if props_style do
        string_style <> props_style
      else
        string_style
      end
    else
      props_style
    end
  end

  def get_style(props) do
    props
    |> Enum.map(fn {x, y} ->
      x = String.replace("#{x}", "_", "-")

      cond do
        String.contains?(x, "color") && y ->
          get_style_with_color(x, y)

        x == "is-bold" && y ->
          "font-weight: var(--font-face--semibold--font-weight)"

        y ->
          "#{x}: #{y}"

        true ->
          nil
      end
    end)
    |> Enum.filter(fn x -> x end)
    |> Enum.join(";")
  end

  defp get_style_with_color(x, y) do
    if String.starts_with?(y, "#") do
      "#{x}: #{y}"
    else
      "#{x}: var(--#{y})"
    end
  end
end
