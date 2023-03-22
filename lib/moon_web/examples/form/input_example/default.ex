defmodule MoonWeb.Examples.Form.InputExample.Default do
  @moduledoc false

  use Moon.StatelessComponent

  use MoonWeb, :example

  alias Moon.Design.Form.Input

  def render(assigns) do
    ~F"""
    <Input field={:username} />
    """
  end

  def code() do
    """
    alias Moon.Design.Form.Input

    ...

    <Input field={:username} />
    """
  end
end
