defmodule MoonWeb.Examples.Form.TextInputExample.Sizes do
  @moduledoc false

  use Moon.StatelessComponent

  use MoonWeb, :example

  alias Moon.Design.Form.TextInput

  def render(assigns) do
    ~F"""
    <div class="flex flex-col lg:flex-row justify-around items-end w-full gap-2">
      {#for size <- ~w(sm md lg xl)}
        <TextInput {=size} placeholder={"Placeholder for #{size}"} />
      {/for}
    </div>
    """
  end

  def code() do
    """
    alias Moon.Design.Form.TextInput

    ...

    <div class="flex flex-col lg:flex-row justify-around items-end w-full gap-2">
      {#for size <- ~w(sm md lg xl)}
        <TextInput {=size} placeholder={"Placeholder for \#{size}"} />
      {/for}
    </div>
    """
  end
end
