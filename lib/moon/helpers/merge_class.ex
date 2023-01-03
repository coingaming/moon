defmodule Moon.Helpers.MergeClass do
  @moduledoc """
  Helper function for merging tailwind classes, can operate with Surface css_class datatype
  """
  import Twix

  def merge(classes) do
    flatten(classes) |> tw() |> String.split(" ")
  end

  def merge2(classes) do
    flatten(classes)
    # |> Enum.filter(fn x -> x != "" end)
    |> Enum.reduce(%{}, fn class, groups ->
      # removing square brackets bc of "top-[-7px]"
      group = Regex.replace(~r/\[.*\]$/, class, "")
      # removing last value, e.g. "postion-top-1" => "position-top"
      group = Regex.replace(~r/-[^-]*$/, group, "")
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
end
