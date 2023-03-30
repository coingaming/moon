defmodule MoonWeb.Examples.Design.LoaderExample.Default do
  @moduledoc false

  use Moon.StatelessComponent
  use MoonWeb, :example

  alias Moon.Design.Loader

  def render(assigns) do
    ~F"""
    <Loader />
    """
  end

  def code() do
    """
    alias Moon.Design.Loader

    ...

    <Loader />
    """
  end
end
