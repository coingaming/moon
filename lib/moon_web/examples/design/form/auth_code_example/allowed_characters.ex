defmodule MoonWeb.Examples.Design.Form.AuthCodeExample.AllowedCharacters do
  @moduledoc false

  use Moon.StatelessComponent
  use MoonWeb, :example

  alias Moon.Design.Form.AuthCode

  def render(assigns) do
    ~F"""
    <AuthCode allowed_characters="numeric">
      <AuthCode.Input />
    </AuthCode>
    """
  end

  def code() do
    """
    alias Moon.Design.Form.AuthCode

    ...

    <AuthCode allowed_characters="numeric">
      <AuthCode.Input />
    </AuthCode>
    """
  end
end
