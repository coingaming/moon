defmodule MoonWeb.Examples.Design.IconButtonExample.ButtonAsLinkHtmlElement do
  @moduledoc false

  use Moon.StatelessComponent
  use MoonWeb, :example

  alias Moon.Design.Button.IconButton

  def render(assigns) do
    ~F"""
    <IconButton icon_only="generic_settings" as="a" href="/components/v2/button" />
    """
  end

  def code() do
    """
    alias Moon.Design.Button.IconButton

    ...

    <IconButton icon_only="generic_settings" as="a" href="/components/v2/button" />
    """
  end
end
