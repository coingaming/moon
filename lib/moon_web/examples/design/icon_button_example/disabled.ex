defmodule MoonWeb.Examples.Design.IconButtonExample.Disabled do
  @moduledoc false

  use Moon.StatelessComponent
  use MoonWeb, :example

  alias Moon.Design.Button.IconButton

  def render(assigns) do
    ~F"""
    <IconButton icon="generic_settings" disabled="true" />
    """
  end

  def code() do
    """
    alias Moon.Design.Button.IconButton

    ...

    <IconButton icon="generic_settings" disabled="true" />
    """
  end
end
