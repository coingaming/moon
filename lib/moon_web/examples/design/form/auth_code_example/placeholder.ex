defmodule MoonWeb.Examples.Design.Form.AuthCodeExample.Placeholder do
  @moduledoc false

  use Moon.StatelessComponent
  use MoonWeb, :example

  alias Moon.Design.Form.AuthCode

  def render(assigns) do
    ~F"""
    <AuthCode placeholder="123456">
      <AuthCode.Input />
    </AuthCode>
    """
  end

  def code() do
    """
    alias Moon.Design.Form.AuthCode

    ...

    <AuthCode placeholder="123456">
      <AuthCode.Input />
    </AuthCode>
    """
  end
end
