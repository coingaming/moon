defmodule Moon.Helpers.GetColorSupport do
  def get_color(color, theme) do
    Map.get(theme.color, :"#{color}") || color
  end
end
