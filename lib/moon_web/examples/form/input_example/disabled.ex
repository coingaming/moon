defmodule MoonWeb.Examples.Form.InputExample.Disabled do
  @moduledoc false

  use Moon.StatelessComponent

  use MoonWeb, :example

  alias Moon.Design.Form.Input

  def render(assigns) do
    ~F"""
    <div class="flex flex-col lg:flex-row justify-around items-end w-full gap-2">
      <Input disabled placeholder="Disabled input" />
      <Input readonly placeholder="Read-only input" />
    </div>
    """
  end

  def code() do
    """
    alias Moon.Design.Form.Input

    ...

    <div class="flex flex-col lg:flex-row justify-around items-end w-full gap-2">
      <Input disabled placeholder="Disabled input" />
      <Input readonly placeholder="Read-only input" />
    </div>
    """
  end
end
