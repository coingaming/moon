defmodule MoonWeb.Examples.Design.ButtonExample.Variants do
  @moduledoc false

  use Moon.StatelessComponent
  use MoonWeb, :example

  alias Moon.Design.Button

  def render(assigns) do
    ~F"""
    <Button>Fill is default</Button>
    <Button variant="outline">Outline</Button>
    <Button variant="ghost">Ghost</Button>
    """
  end

  def code() do
    """
    alias Moon.Design.Button

    ...

    <Button>Fill is default</Button>
    <Button variant="outline">Outline</Button>
    <Button variant="ghost">Ghost</Button>
    """
  end
end
