defmodule Moon.Design.Tag.Utils do
  @moduledoc false

  def get_icon_size(size) do
    case size do
      "2xs" -> "text-moon-12"
      "xs" -> "text-moon-16"
    end
  end

  def get_right_icon_paddings(size) do
    case size do
      "2xs" -> "py-0 ps-2 pe-0.5"
      "xs" -> "py-1 ps-2 pe-1"
    end
  end

  def get_left_icon_paddings(size) do
    case size do
      "2xs" -> "py-0 ps-0.5 pe-2"
      "xs" -> "py-1 ps-1 pe-2"
    end
  end

  def get_both_icon_paddings(size) do
    case size do
      "2xs" -> "py-0 px-0.5"
      "xs" -> "p-1"
    end
  end
end
