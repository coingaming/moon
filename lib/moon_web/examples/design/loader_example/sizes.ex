defmodule MoonWeb.Examples.Design.LoaderExample.Sizes do
  @moduledoc false

  use Moon.StatelessComponent
  use MoonWeb, :example

  alias Moon.Design.Loader

  def render(assigns) do
    ~F"""
    <Loader size="2xs" />
    <Loader size="xs" />
    <Loader size="sm" />
    <Loader />
    <Loader size="lg" />
    """
  end

  def code() do
    """
    alias Moon.Design.Loader

    ...

    <Loader size="2xs" />
    <Loader size="xs" />
    <Loader size="sm" />
    <Loader />
    <Loader size="lg" />
    """
  end
end
