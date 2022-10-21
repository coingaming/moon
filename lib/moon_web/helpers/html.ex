defmodule MoonWeb.Helpers.Html do
  @moduledoc """
  Some interal helpers for html-escaping and transforming
  """

  def get_as_anchor_id(title) do
    title |> String.replace(" ", "-")
  end
end
