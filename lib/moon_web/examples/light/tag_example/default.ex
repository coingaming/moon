defmodule MoonWeb.Examples.Light.TagExample.Default do
  @moduledoc false
  use Moon.Light.LiveComponent
  use MoonWeb, :example

  def render(assigns) do
    ~H"""
    <div class="w-full">
      <.tag>Default</.tag>
    </div>
    """
  end

  def code() do
  end
end
