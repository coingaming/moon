defmodule Moon.Components.DropdownMenuButton do
  use MoonWeb, :stateless_component
  alias Moon.Components.PopoverV2

  prop class, :string
  prop title, :string
  prop height, :integer, default: 10
  prop width, :integer, default: 10
  prop text_color, :string, default: "text-trunks-100"
  prop hover_bg_color, :string, default: "bg-goku-120"
  prop placement, :string, default: "bottom-left"
  prop show, :boolean, default: false
  prop on_toggle, :event, required: true

  slot default
  slot menu

  def render(assigns) do
    ~F"""
    <PopoverV2 {=@show} on_close={@on_toggle} {=@placement}>
      <button
        class={"h-#{@height} w-#{@width} rounded flex items-center justify-center text-trunks-100 hover:text-bulma-100 #{@text_color} hover:#{@hover_bg_color} #{@class}"}
        title={@title}
        :on-click={@on_toggle}
      >
        <#slot />
      </button>

      <:content>
        <#slot name="menu" />
      </:content>
    </PopoverV2>
    """
  end
end
