defmodule Moon.Helpers.ClassNameSupport do
  def get_classname(str) do
    uniq = :crypto.hash(:md5, str) |> Base.encode16(case: :lower)
    "c-#{uniq}"
  end
end
