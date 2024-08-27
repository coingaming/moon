defmodule MoonWeb.Examples.Design.Form.AuthCodeExample.DifferentGaps do
  @moduledoc false

  use Moon.StatelessComponent
  use MoonWeb, :example

  alias Moon.Design.Form.AuthCode

  def render(assigns) do
    ~F"""
    <div class="flex flex-col items-center gap-4">
      <AuthCode id="different-gaps-authcode-1">
        <AuthCode.Input />
      </AuthCode>
      <AuthCode class="gap-4" id="different-gaps-authcode-2">
        <AuthCode.Input />
      </AuthCode>
    </div>
    """
  end

  def code() do
    """
    alias Moon.Design.Form.AuthCode

    ...

    <div class="flex flex-col items-center gap-4">
      <AuthCode>
        <AuthCode.Input />
      </AuthCode>
      <AuthCode class="gap-4">
        <AuthCode.Input />
      </AuthCode>
    </div>
    """
  end
end
