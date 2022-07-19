defmodule MoonWeb.Components.IconsBlock do
  @moduledoc false

  use Moon.StatelessComponent

  slot default

  def render(assigns) do
    ~F"""
    <div class="flex flex-row flex-wrap gap-4 bg-goku-100 p-4 text-moon-14 rounded-moon-s-sm">
      <#slot />
    </div>
    """
  end
end
