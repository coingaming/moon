defmodule MoonWeb.Examples.Design.ButtonExample.MultiLine do
  @moduledoc false

  use Moon.StatelessComponent
  use MoonWeb, :example

  alias Moon.Design.Button

  def render(assigns) do
    ~F"""
    <Button size="xl" class="py-3">
      <span class="flex flex-col gap-1">
        <span class="leading-none">Button text</span>
        <span class="text-moon-9 font-normal leading-none">
          Placeholder text
        </span>
      </span>
    </Button>
    """
  end

  def note() do
    """
    Multiline button exists in XL size only. Please copy and paste the code below to see the result.
    """
  end

  def code() do
    """
    alias Moon.Design.Button

    ...

    <Button size="xl" class="py-3">
      <span class="flex flex-col gap-1">
        <span class="leading-none">Button text</span>
        <span class="text-moon-9 font-normal leading-none">
          Placeholder text
        </span>
      </span>
    </Button>
    """
  end
end
