defmodule MoonWeb.Examples.Design.CircularProgressExample.DifferentValues do
  @moduledoc false

  use Moon.StatelessComponent
  use MoonWeb, :example

  alias Moon.Design.CircularProgress

  def render(assigns) do
    ~F"""
    <CircularProgress value={25} />
    <CircularProgress value={50} />
    <CircularProgress value={75} />
    <CircularProgress value={100} />
    """
  end

  def code() do
    """
    alias Moon.Design.CircularProgress

    ...

    <CircularProgress value={25} />
    <CircularProgress value={50} />
    <CircularProgress value={75} />
    <CircularProgress value={100} />
    """
  end
end
