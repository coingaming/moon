defmodule Moon.Design.Chip.Utils do
  @moduledoc false

  def get_right_icon_paddings(size) do
    case size do
      "sm" -> "py-1 ps-2 pe-1"
      "md" -> "py-2 ps-3 pe-2"
    end
  end

  def get_left_icon_paddings(size) do
    case size do
      "sm" -> "py-1 ps-1 pe-2"
      "md" -> "py-2 ps-2 pe-3"
    end
  end

  def get_no_icon_paddings(size) do
    case size do
      "sm" -> "py-1 px-2"
      "md" -> "py-2 px-3"
    end
  end
end
