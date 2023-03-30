defmodule MoonWeb.Examples.Design.ButtonExample.Animations do
  @moduledoc false

  use Moon.StatelessComponent
  use MoonWeb, :example

  alias Moon.Design.Button

  def render(assigns) do
    ~F"""
    <Button animation="progress">Progress</Button>
    <Button animation="success">Success</Button>
    <Button animation="error">Error</Button>
    <Button animation="pulse">Pulse</Button>
    """
  end

  def code() do
    """
    alias Moon.Design.Button

    ...

    <Button animation="progress">Progress</Button>
    <Button animation="success">Success</Button>
    <Button animation="error">Error</Button>
    <Button animation="pulse">Pulse</Button>
    """
  end
end
