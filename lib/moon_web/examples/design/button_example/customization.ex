defmodule MoonWeb.Examples.Design.ButtonExample.Customization do
  @moduledoc false

  use Moon.StatelessComponent
  use MoonWeb, :example

  alias Moon.Design.Button
  alias Moon.Icons.{GenericSettings, ArrowsTopRight}

  def render(assigns) do
    ~F"""
    <Button class="bg-roshi ps-2 pe-4"><GenericSettings />Icon inside
    </Button>
    <Button class="bg-krillin ps-4 pe-2">Icon inside<GenericSettings class="text-moon-32 text-whis" />
    </Button>
    <Button class="rounded-moon-s-xx rounded-full">Rounded</Button>
    <Button full_width>
      Full width with custom size icon
      <ArrowsTopRight class="text-moon-16 absolute block top-1/2 translate-y-[-50%] ltr:right-3 rtl:left-3" />
    </Button>
    """
  end

  def code() do
    """
    alias Moon.Design.Button

    ...

    <Button class="bg-roshi ps-2 pe-4"><GenericSettings />Icon inside
    </Button>
    <Button class="bg-krillin ps-4 pe-2">Icon inside<GenericSettings class="text-moon-32 text-whis" />
    </Button>
    <Button class="rounded-moon-s-xx rounded-full">Rounded</Button>
    <Button full_width>
      Full width with custom size icon
      <ArrowsTopRight class="text-moon-16 absolute block top-1/2 translate-y-[-50%] ltr:right-3 rtl:left-3" />
    </Button>
    """
  end
end
