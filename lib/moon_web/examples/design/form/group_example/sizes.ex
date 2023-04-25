defmodule MoonWeb.Examples.Design.Form.GroupExample.Sizes do
  @moduledoc false

  use Moon.StatelessComponent
  use MoonWeb, :example

  alias Moon.Design.Form.Group
  alias Moon.Design.Form.Input

  def render(assigns) do
    ~F"""
    {#for size <- ~w(sm md lg)}
      <Group>
        <Input {=size} placeholder={"Size #{size}"} />
        <Input {=size} placeholder={"Size #{size}"} />
      </Group>
    {/for}
    """
  end

  def code() do
    """
    alias Moon.Design.Form.Group
    alias Moon.Design.Form.Input

    def render(assigns) do
      ~F\"""
      {#for size <- ~w(sm md lg)}
        <Group>
          <Input {=size} placeholder={"Size \#{size}"} />
          <Input {=size} placeholder={"Size \#{size}"} />
        </Group>
      {/for}
      \"""
    end
    """
  end
end
