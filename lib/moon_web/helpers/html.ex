defmodule MoonWeb.Helpers.Html do
  @moduledoc """
  Some interal helpers for html-escaping and transforming
  """

  def get_as_anchor_id(title) do
    title |> String.replace(" ", "-")
  end

  @doc "remove line-start tabulations from Surface-rendered HTML"
  def trim_tabs(html) do
    Regex.replace(~r/\n\ */, html, "\n") |> String.trim()
  end
end
