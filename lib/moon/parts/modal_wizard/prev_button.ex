defmodule Moon.Parts.ModalWizard.PrevButton do
  @moduledoc false

  use Moon.StatelessComponent, slot: "prev_button"

  alias Moon.Parts.Button

  use Moon.Design.Button.Properties

  def render(assigns) do
    ~F"""
    <Button.White
      {=@id}
      {=@testid}
      {=@value}
      {=@values}
      {=@on_click}
      {=@disabled}
      class={merge(["min-w-[7.5rem] z-10", @class])}
    ><#slot /></Button.White>
    """
  end
end
