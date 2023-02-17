defmodule MoonWeb.Examples.Design.TagExample.WithIcons do
  @moduledoc false

  use Moon.StatelessComponent

  use MoonWeb, :example

  alias Moon.Icons.ControlsClose
  alias Moon.Icons.OtherFrame
  alias Moon.Design.Tag

  def render(assigns) do
    ~F"""
    <Tag>
      <:left_icon><OtherFrame /></:left_icon>
      Left icon
    </Tag>
    <Tag>
      Right icon
      <:right_icon><ControlsClose /></:right_icon>
    </Tag>
    <Tag>
      <:left_icon><OtherFrame /></:left_icon>
      Both icons
      <:right_icon><ControlsClose /></:right_icon>
    </Tag>
    """
  end

  def code() do
    """

    alias Moon.Icons.ControlsClose
    alias Moon.Icons.OtherFrame
    alias Moon.Design.Tag
    ...

    <Tag>
      <:left_icon><OtherFrame /></:left_icon>
      Left icon
    </Tag>
    <Tag>
      Right icon
      <:right_icon><ControlsClose /></:right_icon>
    </Tag>
    <Tag>
      <:left_icon><OtherFrame /></:left_icon>
      Both icons
      <:right_icon><ControlsClose /></:right_icon>
    </Tag>
    """
  end
end
