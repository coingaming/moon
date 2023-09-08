defmodule MoonWeb.Examples.Design.Form.AuthCodeExample.CustomLength do
  @moduledoc false

  use Moon.StatelessComponent
  use MoonWeb, :example

  alias Moon.Design.Form.AuthCode

  def render(assigns) do
    ~F"""
    <AuthCode length={4}>
      <AuthCode.Input />
    </AuthCode>
    """
  end

  def code() do
    """
    alias Moon.Design.Form.AuthCode

    ...

    <AuthCode length={4}>
      <AuthCode.Input />
    </AuthCode>
    """
  end
end
