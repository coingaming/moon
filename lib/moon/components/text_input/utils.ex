defmodule Moon.Components.TextInput.Utils do
  @moduledoc false

  def get_border_radius(size) do
    case size do
      "xl" -> "rounded-moon-i-md"
      "lg" -> "rounded-moon-i-sm"
      _ -> "rounded-moon-i-sm"
    end
  end

  def get_size_styles(size) do
    case size do
      "xl" ->
        "#{get_height_by_size(size)} leading-[3.5rem] rounded-moon-i-md hover:rounded-moon-i-md focus:rounded-moon-i-md invalid:rounded-moon-i-md"

      "lg" ->
        "#{get_height_by_size(size)} leading-[3rem] rounded-moon-i-sm hover:rounded-moon-i-sm focus:rounded-moon-i-sm invalid:rounded-moon-i-sm"

      _ ->
        "#{get_height_by_size(size)} leading-10 rounded-moon-i-sm hover:rounded-moon-i-sm focus:rounded-moon-i-sm invalid:rounded-moon-i-sm"
    end
  end

  def get_height_by_size(size) do
    case size do
      "xl" -> "h-14"
      "lg" -> "h-12"
      _ -> "h-10"
    end
  end
end
