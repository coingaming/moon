defmodule MoonWeb.Examples.Form.TextInputExample.Disabled do
  @moduledoc false

  use Moon.StatelessComponent

  use MoonWeb, :example

  alias Moon.Design.Form.TextInput

  def render(assigns) do
    ~F"""
    <div class="flex flex-col lg:flex-row justify-around items-end w-full gap-2">
      <TextInput disabled placeholder="Disabled input" />
      <TextInput readonly placeholder="Read-only input" />
    </div>
    """
  end

  def code() do
    """
    alias Moon.Design.Form.TextInput

    ...

    <div class="flex flex-col lg:flex-row justify-around items-end w-full gap-2">
      <TextInput disabled placeholder="Disabled input" />
      <TextInput readonly placeholder="Read-only input" />
    </div>
    """
  end
end
