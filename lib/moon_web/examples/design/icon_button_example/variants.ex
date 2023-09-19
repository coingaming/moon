defmodule MoonWeb.Examples.Design.IconButtonExample.Variants do
  @moduledoc false

  use Moon.StatelessComponent
  use MoonWeb, :example

  alias Moon.Design.Button.IconButton

  def render(assigns) do
    ~F"""
    <IconButton icon="generic_settings" />
    <IconButton icon="generic_settings" variant="outline" />
    <IconButton icon="generic_settings" variant="ghost" />
    """
  end

  def code() do
    """
    alias Moon.Design.Button.IconButton

    ...

    <IconButton icon="generic_settings" />
    <IconButton icon="generic_settings" variant="outline" />
    <IconButton icon="generic_settings" variant="ghost" />
    """
  end
end
