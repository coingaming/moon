defmodule MoonWeb.Examples.Design.Form.AuthCodeExample.Default do
  @moduledoc false

  use Moon.StatelessComponent
  use MoonWeb, :example

  alias Moon.Design.Form.AuthCode

  def render(assigns) do
    ~F"""
    <AuthCode id="default-authcode">
      <AuthCode.Input />
    </AuthCode>
    """
  end

  def code() do
    """
    alias Moon.Design.Form.AuthCode

    ...

    <AuthCode>
      <AuthCode.Input />
    </AuthCode>
    """
  end
end
