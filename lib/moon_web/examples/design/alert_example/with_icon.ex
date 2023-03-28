defmodule MoonWeb.Examples.Design.AlertExample.WithIcon do
  @moduledoc false

  use Moon.StatelessComponent
  use MoonWeb, :example

  alias Moon.Icons.OtherFrame
  alias Moon.Design.Alert

  def render(assigns) do
    ~F"""
    <Alert>
      <Alert.Message>
        <OtherFrame class="text-moon-24" />
        Alert with icon
      </Alert.Message>
    </Alert>
    <Alert>
      <Alert.Title>
        <OtherFrame class="text-moon-24" />
        Alert with title and icon
      </Alert.Title>
      <Alert.Message>Alert message</Alert.Message>
    </Alert>
    """
  end

  def code() do
    """
    alias Moon.Icons.OtherFrame
    alias Moon.Design.Alert

    ...

    <Alert>
      <Alert.Message>
        <OtherFrame class="text-moon-24" />
        Alert with icon
      </Alert.Message>
    </Alert>
    <Alert>
      <Alert.Title>
        <OtherFrame class="text-moon-24" />
        Alert with title and icon
      </Alert.Title>
      <Alert.Message>Alert message</Alert.Message>
    </Alert>
    """
  end
end
