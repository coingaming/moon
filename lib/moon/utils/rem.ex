defmodule Moon.Utils.Rem do
  def rem(value, base) do
    {base,_} = Integer.parse(base)
    {value,_} = Integer.parse(value)

    "#{value/base}rem"
  end

  def rem(value) do
    Moon.Utils.Rem.rem("#{value}", "16")
  end
end
