defmodule Moon.Helpers.MergeClass do
  @moduledoc """
  Helper function for merging tailwind classes, can operate with Surface css_class datatype
  """

  def merge(classes) do
    classes
    |> Tails.classes()
    |> rename_classes()
  end

  def rename_classes(classes) do
    classes
    |> String.split(" ")
    |> Enum.map(fn class -> rename_class(class) end)
    |> Enum.join(" ")
  end

  def rename_class(class) do
    if String.starts_with?(class, "after:moon-checked:") do
      # [prefix | rest ] = String.split("after:moon-checked", ":")
      # renamed_name = "moon-checked:after" <> Enum.join(":", rest)
      # renamed_name
      # temporary
      class
    else
      class
    end
  end

  def merge_original(classes) do
    flatten(classes)
    |> Enum.reduce(%{}, fn class, groups ->
      Map.put(groups, group_name(class), class)
    end)
    |> Map.values()
  end

  defp flatten(classes) when is_list(classes) do
    classes
    |> Enum.flat_map(fn
      # :css_class datatype in Surface
      {k, v} -> (!!v && flatten("#{k}")) || []
      x -> flatten(x)
    end)
  end

  defp flatten(classes) when is_binary(classes), do: classes |> String.split(" ")
  defp flatten(nil), do: []
  defp flatten(false), do: []

  defp group_name(class) when class in ~w(absolute relative fixed static sticky),
    do: "prop_position"

  defp group_name(class) when class in ~w(block inline hidden flex grid),
    do: "prop_display"

  defp group_name("font-" <> family) when family in ~w(averta dm-sans grotesk),
    do: "prop_font_family"

  defp group_name("border-" <> loc) when loc in ~w(t b l r x y s e),
    do: "prop_border_width"

  # defp group_name("border-" <> loc <> "-" <> _) when loc in ~c(t b l r x y s e),
  #   do: "prop_border_width"

  defp group_name("bg-" <> _rest), do: "prop_background"

  defp group_name(class) do
    class
    # removing square brackets bc of "top-[-7px]"
    |> String.replace(~r/\[.*\]$/, "")
    # removing last value, e.g. "postion-top-1" => "position-top-"
    |> String.replace(~r/-[^-]*$/, "-")
  end
end
