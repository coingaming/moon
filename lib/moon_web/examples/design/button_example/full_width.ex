defmodule MoonWeb.Examples.Design.ButtonExample.FullWidth do
  @moduledoc false

  use Moon.StatelessComponent
  use MoonWeb, :example

  alias Moon.Design.Button

  def render(assigns) do
    ~F"""
    <Button right_icon="generic_settings" full_width>
      Full width
    </Button>
    """
  end

  def code() do
    """
    alias Moon.Design.Button

    ...

    <Button right_icon="generic_settings" full_width="true">
      Full width
    </Button>
    """
  end
end
