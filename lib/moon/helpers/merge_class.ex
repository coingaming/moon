defmodule Moon.Helpers.MergeClass do
  @moduledoc """
  Helper function for merging tailwind classes, can operate with Surface css_class datatype
  """

  def merge(classes) do
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

  defp group_name("bg-" <> _rest) do
    "background"
  end

  defp group_name(class) do
    class
    # removing square brackets bc of "top-[-7px]"
    |> String.replace(~r/\[.*\]$/, "")
    # removing last value, e.g. "postion-top-1" => "position-top-"
    |> String.replace(~r/-[^-]*$/, "-")
  end
end
