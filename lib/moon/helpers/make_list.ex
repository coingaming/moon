defmodule Moon.Helpers.MakeList do
  @moduledoc false

  def make_list(l) when is_list(l), do: l
  def make_list(l), do: [l]
end
