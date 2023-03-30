defmodule MoonWeb.Examples.Design.IconButtonExample.Variants do
  @moduledoc false

  use Moon.StatelessComponent
  use MoonWeb, :example

  alias Moon.Design.Button.IconButton

  def render(assigns) do
    ~F"""
    <IconButton icon_only="generic_settings" />
    <IconButton icon_only="generic_settings" variant="secondary" />
    <IconButton icon_only="generic_settings" variant="tertiary" />
    <IconButton icon_only="generic_settings" variant="ghost" />
    """
  end

  def code() do
    """
    alias Moon.Design.Button.IconButton

    ...

    <IconButton icon_only="generic_settings" />
    <IconButton icon_only="generic_settings" variant="secondary" />
    <IconButton icon_only="generic_settings" variant="tertiary" />
    <IconButton icon_only="generic_settings" variant="ghost" />
    """
  end
end
