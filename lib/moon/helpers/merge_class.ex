defmodule Moon.Helpers.MergeClass do
  @moduledoc """
  Helper function for merging tailwind classes, can operate with Surface css_class datatype
  """

  def merge(classes) do
    classes
    |> flatten()
    |> Enum.reduce(%{}, fn class, groups ->
      Map.put(groups, group_class(class), class)
    end)
    |> Map.values()
    |> Tails.classes()
    |> String.split(" ")
    |> Enum.map(&rename_class/1)
    |> Enum.join(" ")
  end

  # dark/light theme crutches
  def group_class("theme-moon-" <> _), do: "theme-name"
  def group_class(other), do: other

  # tails crutches

  defp rename_class(class = "after:moon-" <> _), do: replace_class_parts(class)
  defp rename_class(class = "ltr:not-last" <> _), do: replace_class_parts(class)
  defp rename_class(class = "ltr:not-first" <> _), do: replace_class_parts(class)
  defp rename_class(class), do: class

  defp replace_class_parts(class) do
    [p1 | [p2 | other]] = String.split(class, ":")
    Enum.join([p2 | [p1 | other]], ":")
  end

  # original functions

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
