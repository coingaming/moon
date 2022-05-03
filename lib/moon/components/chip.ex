defmodule Moon.Components.Chip do
  @moduledoc false

  use Moon.StatelessComponent

  alias Moon.Components.Button

  slot default
  prop id, :string
  prop class, :string
  prop left_icon, :string
  prop right_icon, :string
  prop on_click, :event
  prop value, :string
  prop active, :boolean, default: false
  prop active_class, :string, default: "text-bulma-100 bg-goku-120"
  prop inactive_class, :string, default: "text-trunks-100 bg-gohan-100"
  prop testid, :string

  def render(assigns) do
    ~F"""
    <Button
      id={@id}
      class={"hover:text-bulma-100 font-semibold #{@class} #{active_btn_class(@active, @active_class, @inactive_class)}"}
      left_icon={@left_icon}
      right_icon={@right_icon}
      on_click={@on_click}
      value={@value}
      testid={@testid}
      variant="none"
    ><#slot /></Button>
    """
  end

  def active_btn_class(true, active_class, _), do: active_class
  def active_btn_class(false, _, inactive_class), do: inactive_class
end
