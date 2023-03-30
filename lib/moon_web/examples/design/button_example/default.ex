defmodule MoonWeb.Examples.Design.ButtonExample.Default do
  @moduledoc false

  use Moon.StatelessComponent
  use MoonWeb, :example

  alias Moon.Design.Button

  def render(assigns) do
    ~F"""
    <Button>Default</Button>
    """
  end

  def code() do
    """
    alias Moon.Design.Button

    ...

    <Button>Default</Button>
    """
  end
end
