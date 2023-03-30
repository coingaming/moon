defmodule MoonWeb.Examples.Design.ButtonExample.Disabled do
  @moduledoc false

  use Moon.StatelessComponent
  use MoonWeb, :example

  alias Moon.Design.Button

  def render(assigns) do
    ~F"""
    <Button disabled="true">
      Disabled
    </Button>
    """
  end

  def code() do
    """
    alias Moon.Design.Button

    ...

    <Button disabled="true">
      Disabled
    </Button>
    """
  end
end
