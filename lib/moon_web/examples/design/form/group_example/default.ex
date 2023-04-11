defmodule MoonWeb.Examples.Design.Form.GroupExample.Default do
  @moduledoc false

  use Moon.StatelessComponent
  use MoonWeb, :example

  alias Moon.Design.Form.Group
  alias Moon.Design.Form.Input

  def render(assigns) do
    ~F"""
    <Group>
      <Input />
      <Input />
      <Input />
    </Group>
    """
  end

  def code() do
    """

    """
  end
end
