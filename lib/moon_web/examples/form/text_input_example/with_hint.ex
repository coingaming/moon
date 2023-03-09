defmodule MoonWeb.Examples.Form.TextInputExample.WithHint do
  @moduledoc false

  use Moon.StatelessComponent

  use MoonWeb, :example

  alias Moon.Design.Form.TextInput
  alias Moon.Design.Form.Field

  def render(assigns) do
    ~F"""
    <div class="flex flex-col lg:flex-row justify-around items-end w-full gap-2">
      {#for size <- ~w(sm md lg xl)}
        <Field hint={"Hint for #{size}"} field={:gender}>
          <TextInput {=size} field={:gender} placeholder={"Placeholder for #{size}"} />
        </Field>
      {/for}
    </div>
    """
  end

  def code() do
    """

    """
  end
end
