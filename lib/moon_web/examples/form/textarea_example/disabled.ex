defmodule MoonWeb.Examples.Form.TextareaExample.Disabled do
  @moduledoc false

  use Moon.StatelessComponent

  use MoonWeb, :example

  alias Moon.Design.Form.Textarea

  def render(assigns) do
    ~F"""
    <Textarea disabled placeholder="Disabled" />
    """
  end

  def code() do
    """
    alias Moon.Design.Form.Textarea

    ...

    <Textarea disabled placeholder="Disabled" />
    """
  end
end
