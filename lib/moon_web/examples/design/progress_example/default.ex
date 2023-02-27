defmodule MoonWeb.Examples.Design.ProgressExample.Default do
  @moduledoc false

  use Moon.StatelessComponent
  use MoonWeb, :example

  alias Moon.Design.Progress

  def render(assigns) do
    ~F"""
    <Progress />
    """
  end

  def code() do
    """
    alias Moon.Design.Progress

    ...

    <Progress />
    """
  end
end
