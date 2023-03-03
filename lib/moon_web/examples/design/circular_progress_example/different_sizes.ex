defmodule MoonWeb.Examples.Design.CircularProgressExample.DifferentSizes do
  @moduledoc false

  use Moon.StatelessComponent
  use MoonWeb, :example

  alias Moon.Design.CircularProgress

  def render(assigns) do
    ~F"""
    <CircularProgress size="2xs" value={75} />
    <CircularProgress size="xs" value={75} />
    <CircularProgress size="sm" value={75} />
    <CircularProgress value={75} />
    <CircularProgress size="lg" value={75} />
    """
  end

  def code() do
    """
    alias Moon.Design.CircularProgress

    ...

    <CircularProgress size="2xs" value={75} />
    <CircularProgress size="xs" value={75} />
    <CircularProgress size="sm" value={75} />
    <CircularProgress value={75} />
    <CircularProgress size="lg" value={75} />
    """
  end
end
