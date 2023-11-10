defmodule MoonWeb.Examples.Design.Form.AuthCodeExample.HintMessage do
  @moduledoc false

  use Moon.StatelessComponent
  use MoonWeb, :example

  alias Moon.Design.Form.AuthCode
  alias Moon.Icon

  def render(assigns) do
    ~F"""
    <div class="flex items-center flex-col">
      <AuthCode>
        <AuthCode.Input />
        <AuthCode.Hint>Hint message</AuthCode.Hint>
      </AuthCode>
    </div>
    <div class="flex items-center flex-col">
      <AuthCode>
        <AuthCode.Input />
        <AuthCode.Hint>
          <Icon name="generic_info" />
          Hint message with icon
        </AuthCode.Hint>
      </AuthCode>
    </div>
    """
  end

  def code() do
    """
    alias Moon.Design.Form.AuthCode
    alias Moon.Icon

    ...

    <div class="flex items-center flex-col">
      <AuthCode>
        <AuthCode.Input />
        <AuthCode.Hint>Hint message</AuthCode.Hint>
      </AuthCode>
    </div>
    <div class="flex items-center flex-col">
      <AuthCode>
        <AuthCode.Input />
        <AuthCode.Hint>
          <Icon name="generic_info" />
          Hint message with icon
        </AuthCode.Hint>
      </AuthCode>
    </div>
    """
  end
end
