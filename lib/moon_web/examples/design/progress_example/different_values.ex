defmodule MoonWeb.Examples.Design.ProgressExample.DifferentValues do
  @moduledoc false

  use Moon.StatelessComponent
  use MoonWeb, :example

  alias Moon.Design.Progress

  def render(assigns) do
    ~F"""
    <Progress value={25} />
    <Progress value={50} />
    <Progress value={75} />
    <Progress value={100} />
    """
  end

  def code() do
    """
    alias Moon.Design.Progress

    ...

    <Progress value={25} />
    <Progress value={50} />
    <Progress value={75} />
    <Progress value={100} />
    """
  end
end
