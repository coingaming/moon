defmodule MoonWeb.Examples.Form.TextInputExample.Types do
  @moduledoc false

  use Moon.StatelessComponent
  use MoonWeb, :example
  alias Moon.Design.Form.TextInput

  prop(types, :string,
    default: [
      ["date", "datetime-local", "email"],
      ["number", "password", "search"],
      ["tel", "time", "url"]
    ]
  )

  def render(assigns) do
    ~F"""
    <div class="flex flex-col w-full gap-2">
      {#for type_line <- @types}
        <div class="flex flex-col lg:flex-row justify-around items-end w-full gap-2">
          {#for type <- type_line}
            <TextInput {=type} placeholder={"Placeholder for #{type}"} />
          {/for}
        </div>
      {/for}
    </div>
    """
  end

  def code() do
    """

    """
  end
end
