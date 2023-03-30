defmodule MoonWeb.Examples.Design.ButtonExample.Icons do
  @moduledoc false

  use Moon.StatelessComponent
  use MoonWeb, :example

  alias Moon.Icons.GenericSettings
  alias Moon.Design.Button

  def render(assigns) do
    ~F"""
    <div class="flex flex-wrap justify-around w-full">
      <Button left_icon="generic_settings">Icon Left</Button>
      <Button right_icon="generic_settings">Icon Right</Button>
    </div>
    <div class="flex flex-wrap justify-around w-full">
      <Button class="bg-roshi"><GenericSettings /> Icon inside
      </Button>
      <Button class="bg-krillin">Icon inside<GenericSettings class="text-moon-32 text-whis" />
      </Button>
    </div>
    """
  end

  def code() do
    """
    alias Moon.Design.Button
    alias Moon.Icons.GenericSettings

    ...

    <div class="flex flex-wrap justify-around w-full">
      <Button left_icon="generic_settings">Icon Left</Button>
      <Button right_icon="generic_settings">Icon Right</Button>
    </div>
    <div class="flex flex-wrap justify-around w-full">
      <Button class="bg-roshi"><GenericSettings /> Icon inside
      </Button>
      <Button class="bg-krillin">Icon inside<GenericSettings class="text-moon-32 text-whis" />
      </Button>
    </div>
    """
  end
end
