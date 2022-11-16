defmodule MoonWeb.Components.LargeLogo do
  @moduledoc false

  use Moon.StatelessComponent

  prop(click, :event)
  prop(class, :string)

  def render(assigns) do
    ~F"""
    <svg class={"moon-logo #{@class} #{@click && "cursor-pointer"}"} :on-click={@click}>
      <use href="/moon/assets/svgs/moon_web/large_logo.svg#item" />
    </svg>
    """
  end
end
