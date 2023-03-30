defmodule MoonWeb.Examples.Design.IconButtonExample.Animation do
  @moduledoc false

  use Moon.StatelessComponent
  use MoonWeb, :example

  alias Moon.Design.Button.IconButton

  def render(assigns) do
    ~F"""
    <IconButton icon_only="generic_settings" animation="progress" />
    <IconButton icon_only="generic_settings" animation="success" />
    <IconButton icon_only="generic_settings" animation="error" />
    <IconButton icon_only="generic_settings" animation="pulse" />
    """
  end

  def code() do
    """
    alias Moon.Design.Button.IconButton

    ...

    <IconButton icon_only="generic_settings" animation="progress" />
    <IconButton icon_only="generic_settings" animation="success" />
    <IconButton icon_only="generic_settings" animation="error" />
    <IconButton icon_only="generic_settings" animation="pulse" />
    """
  end
end
