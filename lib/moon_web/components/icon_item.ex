defmodule MoonWeb.Components.IconItem do
  @moduledoc false

  use Moon.StatelessComponent

  alias Moon.Icon

  prop name, :string

  def render(assigns) do
    ~F"""
    <div class="cursor-pointer rounded-moon-i-sm transition-colors hover:bg-piccolo-100/[.12] text-trunks-100 hover:text-piccolo-100">
      <Icon name={@name} font_size="2rem" />
    </div>
    """
  end
end
