defmodule Moon.Parts.ModalWizard.NextButton do
  @moduledoc false

  use Moon.StatelessComponent, slot: "next_button"

  alias Moon.Parts.Button

  use Moon.Design.Button.Properties

  def render(assigns) do
    ~F"""
    <Button
      {=@id}
      {=@testid}
      {=@value}
      {=@values}
      {=@on_click}
      {=@disabled}
      class={merge(["min-w-[7.5rem] z-10", @class])}
    ><#slot /></Button>
    """
  end
end
