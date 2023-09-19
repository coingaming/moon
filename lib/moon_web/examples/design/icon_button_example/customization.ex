defmodule MoonWeb.Examples.Design.IconButtonExample.Customization do
  @moduledoc false

  use Moon.StatelessComponent
  use MoonWeb, :example

  alias Moon.Design.Button.IconButton
  alias Moon.Icons.GenericSettings

  def render(assigns) do
    ~F"""
    <IconButton class="bg-roshi"><GenericSettings /></IconButton>
    <IconButton class="bg-krillin"><GenericSettings class="text-moon-32 text-whis" /></IconButton>
    <IconButton icon="generic_settings" class="rounded-moon-s-xx rounded-full" />
    """
  end

  def code() do
    """
    alias Moon.Design.Button.IconButton

    ...

    <IconButton class="bg-roshi"><GenericSettings /></IconButton>
    <IconButton class="bg-krillin"><GenericSettings class="text-moon-32 text-whis" /></IconButton>
    <IconButton icon="generic_settings" class="rounded-moon-s-xx rounded-full" />
    """
  end
end
