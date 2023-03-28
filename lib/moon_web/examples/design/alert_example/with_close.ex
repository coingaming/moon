defmodule MoonWeb.Examples.Design.AlertExample.WithClose do
  @moduledoc false

  use Moon.StatelessComponent
  use MoonWeb, :example

  alias Moon.Design.Alert

  def render(assigns) do
    ~F"""
    <Alert>
      Alert with close
      <Alert.Close />
    </Alert>
    <Alert>
      <Alert.Title>Alert with title and close</Alert.Title>
      <Alert.Message>Alert message</Alert.Message>
      <Alert.Close />
    </Alert>
    """
  end

  def code() do
    """
    alias Moon.Design.Alert

    ...

    <Alert>
      Alert with close
      <Alert.Close />
    </Alert>
    <Alert>
      <Alert.Title>Alert with title and close</Alert.Title>
      <Alert.Message>Alert message</Alert.Message>
      <Alert.Close />
    </Alert>
    """
  end
end
