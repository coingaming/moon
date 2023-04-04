defmodule Moon.Design.Form.Radio.Indicator do
  @moduledoc false

  use Moon.StatelessComponent

  alias Moon.Components.Lego.Radio

  prop(class, :css_class)
  prop(id, :string)
  prop(testid, :string)
  prop(is_selected, :boolean, from_context: :is_selected)

  def render(assigns) do
    ~F"""
    <Radio {=@id} {=@testid} {=@class} {=@is_selected} />
    """
  end
end
