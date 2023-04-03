defmodule MoonWeb.Examples.Form.TextareaExample.DisabledAndErrorr do
  @moduledoc false

  use Moon.StatelessComponent

  use MoonWeb, :example

  alias Moon.Design.Form.Textarea

  def render(assigns) do
    ~F"""
    <Textarea disabled placeholder="Disabled" />
    <Textarea error placeholder="Error" />
    """
  end

  def code() do
    """
    alias Moon.Design.Form.Textarea

    ...

    <Textarea disabled placeholder="Disabled" />
    <Textarea error placeholder="Error" />
    """
  end
end
