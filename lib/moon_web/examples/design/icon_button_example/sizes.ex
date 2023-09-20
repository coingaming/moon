defmodule MoonWeb.Examples.Design.IconButtonExample.Sizes do
  @moduledoc false

  use Moon.StatelessComponent
  use MoonWeb, :example

  alias Moon.Design.Button.IconButton

  def render(assigns) do
    ~F"""
    <IconButton icon="generic_settings" size="xs" />
    <IconButton icon="generic_settings" size="sm" />
    <IconButton icon="generic_settings" size="md" />
    <IconButton icon="generic_settings" size="lg" />
    <IconButton icon="generic_settings" size="xl" />
    """
  end

  def code() do
    """
    alias Moon.Design.Button.IconButton

    ...

    <IconButton icon="generic_settings" size="xs" />
    <IconButton icon="generic_settings" size="sm" />
    <IconButton icon="generic_settings" size="md" />
    <IconButton icon="generic_settings" size="lg" />
    <IconButton icon="generic_settings" size="xl" />
    """
  end
end
