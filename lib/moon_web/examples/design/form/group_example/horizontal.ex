defmodule MoonWeb.Examples.Design.Form.GroupExample.Horizontal do
  @moduledoc false

  use Moon.StatelessComponent
  use MoonWeb, :example

  alias Moon.Design.Form.Group
  alias Moon.Design.Form.Input

  def render(assigns) do
    ~F"""
    <Group orientation="horizontal">
      <Input placeholder="First" />
      <Input placeholder="Second" />
      <Input placeholder="Third" />
    </Group>
    """
  end

  def code() do
    """

    """
  end
end
