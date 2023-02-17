defmodule MoonWeb.Examples.Design.TagExample.Default do
  @moduledoc false

  use Moon.StatelessComponent

  use MoonWeb, :example

  alias Moon.Design.Tag

  def render(assigns) do
    ~F"""
    <Tag>Default</Tag>
    """
  end

  def code() do
    """
    alias Moon.Design.Tag

    ...

    <Tag>Default</Tag>
    """
  end
end
