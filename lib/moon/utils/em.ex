defmodule Moon.Utils.Em do
  def em(value, base) do
    {base, _} = Integer.parse(base)
    {value, _} = Integer.parse(value)

    "#{value / base}em"
  end

  def em(value) do
    em("#{value}", "16")
  end
end
