defmodule Moon.Helpers.Assets do
  @moduledoc false

  def asset_name_to_filename(name) do
    name
    |> to_string()
    |> String.replace("_", "-")
  end
end
