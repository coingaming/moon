defmodule MoonWeb.Examples.Design.ProgressExample.CustomColours do
  @moduledoc false

  use Moon.StatelessComponent
  use MoonWeb, :example

  alias Moon.Design.Progress

  def render(assigns) do
    ~F"""
    <Progress value={75} bg_color="bg-trunks" />
    <Progress value={75} bg_color="bg-whis" progress_color="bg-dodoria" />
    <Progress value={75} progress_color="bg-roshi" />
    """
  end

  def code() do
    """
    alias Moon.Design.Progress

    ...

    <Progress value={75} bg_color="bg-trunks" />
    <Progress value={75} bg_color="bg-whis" progress_color="bg-dodoria" />
    <Progress value={75} progress_color="bg-roshi" />
    """
  end
end
