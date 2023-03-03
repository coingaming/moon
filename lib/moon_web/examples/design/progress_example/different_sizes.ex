defmodule MoonWeb.Examples.Design.ProgressExample.DifferentSizes do
  @moduledoc false

  use Moon.StatelessComponent
  use MoonWeb, :example

  alias Moon.Design.Progress

  def render(assigns) do
    ~F"""
    <Progress size="6xs" value={75} />
    <Progress size="5xs" value={75} />
    <Progress size="4xs" value={75} />
    <Progress size="3xs" value={75} />
    <Progress value={75} />
    """
  end

  def code() do
    """
    alias Moon.Design.Progress

    ...

    <Progress size="6xs" value={75} />
    <Progress size="5xs" value={75} />
    <Progress size="4xs" value={75} />
    <Progress size="3xs" value={75} />
    <Progress value={75} />
    """
  end
end
