defmodule MoonWeb.Examples.Design.Form.TextAreaExample.Default do
  @moduledoc false

  use Moon.StatelessComponent

  use MoonWeb, :example

  def render(assigns) do
    ~F"""
    <Moon.Design.Form.TextArea />
    """
  end

  def code() do
    """
    <Moon.Design.Form.TextArea />
    """
  end
end
