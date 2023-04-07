defmodule MoonWeb.Examples.Form.TextAreaExample.DisabledAndErrorr do
  @moduledoc false

  use Moon.StatelessComponent

  use MoonWeb, :example

  alias Moon.Design.Form.TextArea

  def render(assigns) do
    ~F"""
    <TextArea disabled placeholder="Disabled" />
    <TextArea error placeholder="Error" />
    """
  end

  def code() do
    """
    alias Moon.Design.Form.TextArea

    ...

    <TextArea disabled placeholder="Disabled" />
    <TextArea error placeholder="Error" />
    """
  end
end
