defmodule MoonWeb.Examples.Design.LoaderExample.Colours do
  @moduledoc false

  use Moon.StatelessComponent
  use MoonWeb, :example

  alias Moon.Design.Loader

  def render(assigns) do
    ~F"""
    <Loader color="dodoria" />
    <Loader color="trunks" />
    <Loader color="raditz" />
    """
  end

  def code() do
    """
    alias Moon.Design.Loader

    ...

    <Loader color="dodoria" />
    <Loader color="trunks" />
    <Loader color="raditz" />
    """
  end
end
