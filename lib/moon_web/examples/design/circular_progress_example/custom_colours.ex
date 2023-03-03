defmodule MoonWeb.Examples.Design.CircularProgressExample.CustomColours do
  @moduledoc false

  use Moon.StatelessComponent
  use MoonWeb, :example

  alias Moon.Design.CircularProgress

  def render(assigns) do
    ~F"""
    <CircularProgress value={75} bg_color="stroke-trunks" />
    <CircularProgress value={75} bg_color="stroke-whis" progress_color="stroke-dodoria" />
    <CircularProgress value={75} progress_color="stroke-roshi" />
    """
  end

  def code() do
    """
    alias Moon.Design.CircularProgress

    ...

    <CircularProgress value={75} bg_color="stroke-trunks" />
    <CircularProgress value={75} bg_color="stroke-whis" progress_color="stroke-dodoria" />
    <CircularProgress value={75} progress_color="stroke-roshi" />
    """
  end
end
