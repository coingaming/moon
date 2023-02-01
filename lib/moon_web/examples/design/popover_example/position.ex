defmodule MoonWeb.Examples.Design.PopoverExample.Position do
  @moduledoc false

  use Moon.StatelessComponent

  def render(assigns) do
    ~F"""
    <div>
      <p class="p-4 text-moon-14">
        Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
        tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
        quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
        consequat.
      </p>
    </div>
    """
  end
end
