defmodule MoonWeb.Examples.Design.ProgressExample.ProgressWithPin do
  @moduledoc false

  use Moon.StatelessComponent
  use MoonWeb, :example

  alias Moon.Design.Progress

  def render(assigns) do
    ~F"""
    <Progress value={75}>
      <Progress.Pin />
    </Progress>
    """
  end

  def code() do
    """
    alias Moon.Design.Progress

    ...

    <Progress value={75}>
      <Progress.Pin />
    </Progress>
    """
  end
end
