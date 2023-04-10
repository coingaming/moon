defmodule MoonWeb.Examples.Design.Form.GroupExample.Default do
  @moduledoc false

  use Moon.StatelessComponent
  use MoonWeb, :example

  alias Moon.Design.Form.Group

  def render(assigns) do
    ~F"""
    <Group />
    """
  end

  def code() do
    """

    """
  end
end
