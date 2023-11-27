defmodule MoonWeb.Examples.Design.TagExample.Sizes do
  @moduledoc false

  use Moon.StatelessComponent

  use MoonWeb, :example

  alias Moon.Design.Tag

  def render(assigns) do
    ~F"""
    <Tag size="2xs">2xs size</Tag>
    <Tag>xs size</Tag>
    <Tag size="sm">sm size</Tag>
    """
  end

  def code() do
    """
    alias Moon.Design.Tag

    ...

    <Tag size="2xs">2xs size</Tag>
    <Tag>xs size</Tag>
    <Tag size="sm">sm size</Tag>
    """
  end
end
