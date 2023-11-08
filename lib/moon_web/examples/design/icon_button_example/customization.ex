defmodule MoonWeb.Examples.Design.IconButtonExample.Customization do
  @moduledoc false

  use Moon.StatelessComponent
  use MoonWeb, :example

  alias Moon.Design.Button.IconButton
  alias Moon.Icons.GenericSettings

  def render(assigns) do
    ~F"""
    <IconButton class="bg-roshi"><GenericSettings /></IconButton>
    <IconButton class="bg-krillin p-0"><GenericSettings class="text-moon-32 text-whis" /></IconButton>
    <IconButton icon="generic_settings" class="rounded-full" />
    """
  end

  def code() do
    """
    alias Moon.Design.Button.IconButton

    ...

    <IconButton class="bg-roshi"><GenericSettings /></IconButton>
    <IconButton class="bg-krillin p-0"><GenericSettings class="text-moon-32 text-whis" /></IconButton>
    <IconButton icon="generic_settings" class="rounded-full" />
    """
  end
end
