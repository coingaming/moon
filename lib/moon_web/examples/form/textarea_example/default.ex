defmodule MoonWeb.Examples.Form.TextareaExample.Default do
  @moduledoc false

  use Moon.StatelessComponent

  use MoonWeb, :example

  alias Moon.Design.Form.Textarea

  def render(assigns) do
    ~F"""
    <Textarea />
    """
  end

  def code() do
    """
    alias Moon.Design.Form.Textarea

    ...

    <Textarea />
    """
  end
end
