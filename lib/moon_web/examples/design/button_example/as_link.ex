defmodule MoonWeb.Examples.Design.ButtonExample.ButtonAsLinkHtmlElement do
  @moduledoc false

  use Moon.StatelessComponent
  use MoonWeb, :example

  alias Moon.Design.Button

  def render(assigns) do
    ~F"""
    <Button as="a" href="/components/v2/button">Link HTML element</Button>
    """
  end

  def code() do
    """
    alias Moon.Design.Button

    ...

    <Button as="a" href="/components/v2/button">Link HTML element</Button>
    """
  end
end
