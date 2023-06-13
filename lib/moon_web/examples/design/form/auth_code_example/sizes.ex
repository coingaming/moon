defmodule MoonWeb.Examples.Design.Form.AuthCodeExample.Sizes do
  @moduledoc false

  use Moon.StatelessComponent
  use MoonWeb, :example

  alias Moon.Design.Form.AuthCode

  def render(assigns) do
    ~F"""
    <div class="flex flex-col gap-4">
      {#for size <- ~w(sm md lg xl)}
        <AuthCode {=size} placeholder="123456" id={"size_#{size}"}>
          <AuthCode.Input />
        </AuthCode>
      {/for}
    </div>
    """
  end

  def code() do
    """
    alias Moon.Design.Form.AuthCode

    ...

    <div class="flex flex-col gap-4">
      {#for size <- ~w(sm md lg xl)}
        <AuthCode {=size} placeholder="123456" id={"size_#\{size}"}>
          <AuthCode.Input />
        </AuthCode>
      {/for}
    </div>
    """
  end
end
