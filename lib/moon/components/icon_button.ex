defmodule Moon.Components.IconButton do
  use MoonWeb, :stateless_component

  alias Moon.Assets.Icon

  prop icon_name, :string, required: true
  prop class, :string
  prop title, :string
  prop height, :integer, default: 10
  prop width, :integer, default: 10
  prop text_color, :string, default: "text-trunks-100"
  prop hover_bg_color, :string, default: "bg-hit-120"
  prop click, :event
  prop value_name, :string
  prop value, :any

  def render(assigns) do
    ~F"""
    <button
      class={"h-#{@height} w-#{@width} rounded flex items-center justify-center hover:text-bulma-100 #{@text_color} hover:#{@hover_bg_color} #{@class}"}
      title={@title}
      :on-click={@click}
      :attrs={phx_val_tag(@value_name, @value)}
    >
      <Icon name={@icon_name} />
    </button>
    """
  end

  def phx_val_tag(nil, _), do: []
  def phx_val_tag(name, value), do: [{:"phx-value-#{name}", value}]
end
