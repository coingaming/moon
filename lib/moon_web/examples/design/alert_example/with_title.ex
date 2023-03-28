defmodule MoonWeb.Examples.Design.AlertExample.WithTitle do
  @moduledoc false

  use Moon.StatelessComponent
  use MoonWeb, :example

  alias Moon.Design.Alert

  def render(assigns) do
    ~F"""
    <Alert>
      <Alert.Title>Alert title</Alert.Title>
      <Alert.Message>Alert message</Alert.Message>
    </Alert>
    """
  end

  def code() do
    """
    alias Moon.Design.Alert

    ...

    <Alert>
      <Alert.Title>Alert title</Alert.Title>
      <Alert.Message>Alert message</Alert.Message>
    </Alert>
    """
  end
end
