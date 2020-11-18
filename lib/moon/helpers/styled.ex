defmodule Moon.Helpers.Styled do
  def get_style(props) do
    props |> Enum.map(fn {x, y} ->
      if y do
        x = String.replace("#{x}", "_", "-")

        if String.contains?(x, "color") do
          "#{x}: var(--color--#{y})"
        else
          "#{x}: #{y}"
        end
      end
    end) |> Enum.filter(fn x -> x end) |> Enum.join(";")
  end
end
