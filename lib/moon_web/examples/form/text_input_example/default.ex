defmodule MoonWeb.Examples.Form.TextInputExample.Default do
  @moduledoc false

  use Moon.StatelessComponent

  use MoonWeb, :example

  alias Moon.Design.Form.TextInput

  def render(assigns) do
    ~F"""
    <TextInput field={:username} />
    """
  end

  def code() do
    """
    alias Moon.Design.Form.TextInput

    ...

    <TextInput field={:username} />
    """
  end
end
