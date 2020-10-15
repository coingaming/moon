defmodule Moon.Utils.Mq do
  import Moon.Utils.Em

  def mq(bp, direction) do
    v = (direction == "max-width" && em(bp - 1)) || em(bp)
    "@media (#{direction}: #{v})"
  end

  def mq(bp) do
    mq(bp, "min-width")
  end
end
