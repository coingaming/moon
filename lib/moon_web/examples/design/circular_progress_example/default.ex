
defmodule MoonWeb.Examples.Design.CircularProgressExample.Default do
  @moduledoc false

  use Moon.StatelessComponent
  use MoonWeb, :example

  alias Moon.Design.CircularProgress

  def render(assigns) do
    ~F"""
    <CircularProgress />
    """
  end

  def code() do
    """
    alias Moon.Design.CircularProgress
    ...
    <CircularProgress />
    """
  end
end
