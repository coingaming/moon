defmodule Moon.Helpers.GetClassNameSupport do
  def get_class_name(str) do
    uniq = :crypto.hash(:md5, str) |> Base.encode16(case: :lower)
    "c-#{uniq}"
  end

  def get_class_name(module, assigns) do
    uniq = module.style_assigns |> Enum.map(fn x -> assigns[x] end) |> Enum.join("-")

    get_class_name("#{module}-#{uniq}")
  end
end
