defmodule MoonWeb.Examples.Design.Form.AuthCodeExample.Password do
  @moduledoc false

  use Moon.StatelessComponent
  use MoonWeb, :example

  alias Moon.Design.Form.AuthCode

  def render(assigns) do
    ~F"""
    <AuthCode type="password">
      <AuthCode.Input />
    </AuthCode>
    """
  end

  def code() do
    """
    alias Moon.Design.Form.AuthCode

    ...

    <AuthCode type="password" >
      <AuthCode.Input />
    </AuthCode>
    """
  end
end
