defmodule Moon.Helpers.MergeClass do
  @moduledoc """
  Helper function for merging tailwind classes, can operate with Surface css_class datatype
  """

  def merge(classes) do
    flatten(classes)
    # |> Enum.filter(fn x -> x != "" end)
    |> Enum.reduce(%{}, fn class, groups ->
      group =
        class
        # removing square brackets bc of "top-[-7px]"
        |> String.replace(~r/\[.*\]$/, "")
        # removing last value, e.g. "postion-top-1" => "position-top-"
        |> String.replace(~r/-[^-]*$/, "-")

      Map.put(groups, group, class)
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
end
