defmodule MoonWeb.Examples.Design.<%= name %>Example.Default do
  @moduledoc false

  use Moon.StatelessComponent
  use MoonWeb, :example

  alias Moon.Design.<%= name %>

  def render(assigns) do
    ~F"""
    <<%= short %> />
    """
  end

  def code() do
    """

    """
  end
end
