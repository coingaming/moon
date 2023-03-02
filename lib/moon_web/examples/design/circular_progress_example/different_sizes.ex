defmodule MoonWeb.Examples.Design.CircularProgressExample.DifferentSizes do
  @moduledoc false

  use Moon.StatelessComponent
  use MoonWeb, :example

  alias Moon.Design.CircularProgress

  def render(assigns) do
    ~F"""
    <CircularProgress size="2xs" />
    <CircularProgress size="xs" />
    <CircularProgress size="sm" />
    <CircularProgress />
    <CircularProgress size="lg" />
    """
  end

  def code() do
    """
    alias Moon.Design.CircularProgress

    ...

    <CircularProgress size="2xs" />
    <CircularProgress size="xs" />
    <CircularProgress size="sm" />
    <CircularProgress />
    <CircularProgress size="lg" />
    """
  end
end
