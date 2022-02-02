defmodule Moon.Components.IconButton do
  @moduledoc false

  use MoonWeb, :stateless_component

  alias Moon.Icon

  prop id, :string, default: nil
  prop icon_name, :string, required: true
  prop icon_size, :string, default: "1rem"
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
      {=@id}
      class={"h-#{@height} w-#{@width} rounded flex items-center justify-center hover:text-bulma-100 #{@text_color} hover:#{@hover_bg_color} #{@class}"}
      title={@title}
      :on-click={@click}
      {...phx_val_tag(@value_name, @value)}
    >
      <Icon name={@icon_name} font_size={@icon_size} />
    </button>
    """
  end

  def phx_val_tag(nil, _), do: []

  def phx_val_tag(name, value) do
    # credo:disable-for-next-line Credo.Check.Warning.UnsafeToAtom
    key = String.to_atom("phx-value-#{name}")
    [{key, value}]
  end
end
