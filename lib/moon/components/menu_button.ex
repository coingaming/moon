defmodule Moon.Components.MenuButton do
  use MoonWeb, :stateless_component

  slot default
  prop class, :string
  prop title, :string
  prop height, :integer, default: 10
  prop width, :integer, default: 10
  prop text_color, :string, default: "text-trunks-100"
  prop hover_bg_color, :string, default: "bg-goku-80"

  def render(assigns) do
    ~F"""
    <div
      class={"h-#{@height} w-#{@width} rounded flex items-center justify-center cursor-pointer text-trunks-100 hover:text-bulma-100 #{@text_color} hover:#{@hover_bg_color} #{@class}"}
      title={@title}
    >
      <#slot />
    </div>
    """
  end
end
