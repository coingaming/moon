defmodule Moon.Components.Chip do
  use Moon.StatelessComponent

  alias Moon.Components.Button

  slot(default)
  prop class, :string
  prop left_icon, :string
  prop right_icon, :string
  prop on_click, :event
  prop value, :string
  prop active, :boolean, default: false

  def render(assigns) do
    ~F"""
    {asset_import @socket, "js/tailwind"}

    <Button
      class={"hover:text-bulma-100 #{@class} #{active_btn_class(@active)}"}
      left_icon={@left_icon}
      right_icon={@right_icon}
      on_click={@on_click}
      value={@value}
      rounded
    ><#slot /></Button>
    """
  end

  def active_btn_class(true), do: "text-bulma-100 bg-goku-80"
  def active_btn_class(false), do: "text-trunks-100 bg-gohan-100"
end
