defmodule MoonWeb.Examples.Design.Form.GroupExample.States do
  @moduledoc false

  use Moon.StatelessComponent
  use MoonWeb, :example

  alias Moon.Design.Form.Group
  alias Moon.Design.Form.Input

  def render(assigns) do
    ~F"""
    <Group>
      <Input error placeholder="Something's wrong" />
      <Input error placeholder="Something's wrong" />
    </Group>
    <Group>
      <Input disabled placeholder="Disabled" />
      <Input disabled placeholder="Disabled" />
    </Group>
    <Group>
      <Input readonly placeholder="Readonly" />
      <Input readonly placeholder="Readonly" />
    </Group>
    """
  end

  def code() do
    """
    <Group>
      <Input error placeholder={"Something's wrong"} />
      <Input error placeholder={"Something's wrong"} />
    </Group>
    <Group>
      <Input disabled placeholder={"Disabled"} />
      <Input disabled placeholder={"Disabled"} />
    </Group>
    <Group>
      <Input readonly placeholder={"Readonly"} />
      <Input readonly placeholder={"Readonly"} />
    </Group>
    """
  end
end
