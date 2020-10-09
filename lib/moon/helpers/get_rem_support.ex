defmodule Moon.Helpers.GetRemSupport do
  def get_rem(x, base) do
    a = Decimal.new("#{x}")
    b = Decimal.new("#{base}")
    c = Decimal.div(a, b)
    d = Decimal.to_float(c)
    "#{d}rem"
  end

  def get_rem(x) do
    get_rem(x, 16)
  end
end
