defmodule MoonWeb.Examples.Design.AlertExample.Default do
  @moduledoc false

  use Moon.StatelessComponent
  use MoonWeb, :example

  alias Moon.Design.Alert

  def render(assigns) do
    ~F"""
    <Alert>Default alert</Alert>
    """
  end

  def code() do
    """
    alias Moon.Design.Alert

    ...

    <Alert>Default alert</Alert>
    """
  end
end
