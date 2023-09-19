defmodule MoonWeb.Examples.Design.IconButtonExample.Animation do
  @moduledoc false

  use Moon.StatelessComponent
  use MoonWeb, :example

  alias Moon.Design.Button.IconButton

  def render(assigns) do
    ~F"""
    <IconButton icon="generic_settings" animation="progress" />
    <IconButton icon="generic_settings" animation="success" />
    <IconButton icon="generic_settings" animation="error" />
    <IconButton icon="generic_settings" animation="pulse" />
    """
  end

  def code() do
    """
    alias Moon.Design.Button.IconButton

    ...

    <IconButton icon="generic_settings" animation="progress" />
    <IconButton icon="generic_settings" animation="success" />
    <IconButton icon="generic_settings" animation="error" />
    <IconButton icon="generic_settings" animation="pulse" />
    """
  end
end
