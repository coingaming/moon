defmodule Moon.Helpers.ClassNameSupport do
  def get_class_name(str) do
    uniq = :crypto.hash(:md5, str) |> Base.encode16(case: :lower)
    "c-#{uniq}"
  end
end
