defmodule Moon.Components.DropdownMenuButton do
  @moduledoc false

  use Moon.StatelessComponent
  alias Moon.Components.Popover

  prop(id, :string, required: true)
  prop(class, :string)
  prop(title, :string)
  prop(height, :integer, default: 10)
  prop(width, :integer, default: 10)
  prop(text_color, :string, default: "text-trunks")
  prop(hover_bg_color, :string, default: "bg-gohan-120")
  prop(placement, :string, default: "bottom-end")
  prop(show, :boolean, default: false)
  prop(on_toggle, :event, required: true)
  prop(testid, :string)

  slot(default)
  slot(menu)

  def render(assigns) do
    ~F"""
    <Popover {=@id} {=@show} on_close={@on_toggle} {=@placement}>
      <button
        class={"h-#{@height} w-#{@width} rounded flex items-center justify-center text-trunks hover:text-bulma #{@text_color} hover:#{@hover_bg_color} #{@class}"}
        title={@title}
        :on-click={@on_toggle}
        data-testid={"#{@testid}-button"}
      >
        <#slot />
      </button>

      <:content>
        <#slot {@menu} />
      </:content>
    </Popover>
    """
  end
end
