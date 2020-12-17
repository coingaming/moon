defmodule Moon.Helpers.Styled do
  def get_style(props) do
    props
    |> Enum.map(fn {x, y} ->
      x = String.replace("#{x}", "_", "-")

      cond do
        String.contains?(x, "color") && y ->
          if String.starts_with?(y, "#") do
            "#{x}: #{y}"
          else
            "#{x}: var(--color--#{y})"
          end

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
end
