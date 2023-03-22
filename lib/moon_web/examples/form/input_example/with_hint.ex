defmodule MoonWeb.Examples.Form.InputExample.WithHint do
  @moduledoc false

  use Moon.StatelessComponent

  use MoonWeb, :example

  alias Moon.Design.Form.Input
  alias Moon.Design.Form.Field

  def render(assigns) do
    ~F"""
    <div class="flex flex-col lg:flex-row justify-around items-end w-full gap-2">
      {#for size <- ~w(sm md lg)}
        <Field hint={"Hint for #{size}"} field={:gender}>
          <Input {=size} field={:gender} placeholder={"Placeholder for #{size}"} />
        </Field>
      {/for}
    </div>
    """
  end

  def code() do
    """
    alias Moon.Design.Form.Input
    alias Moon.Design.Form.Field

    ...

    <div class="flex flex-col lg:flex-row justify-around items-end w-full gap-2">
      {#for size <- ~w(sm md lg)}
        <Field hint={"Hint for \#{size}"} field={:gender}>
          <Input {=size} field={:gender} placeholder={"Placeholder for \#{size}"} />
        </Field>
      {/for}
    </div>
    """
  end
end
