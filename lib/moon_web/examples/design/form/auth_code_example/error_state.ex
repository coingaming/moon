defmodule MoonWeb.Examples.Design.Form.AuthCodeExample.ErrorState do
  @moduledoc false

  use Moon.StatelessComponent
  use MoonWeb, :example

  alias Moon.Design.Form.AuthCode

  def render(assigns) do
    ~F"""
    <AuthCode error id="error_state">
      <AuthCode.Input />
    </AuthCode>
    """
  end

  def code() do
    """
    alias Moon.Design.Form.AuthCode

    ...

    <AuthCode error id="error_state">
      <AuthCode.Input />
    </AuthCode>
    """
  end
end
