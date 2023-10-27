defmodule Moon.Parts.ModalWizard.CloseButton do
  @moduledoc false

  use Moon.StatelessComponent, slot: "close_button"

  alias Moon.Parts.IconButton

  @doc "Additional Tailwind classes"
  prop(class, :css_class)
  @doc "Data-testid attribute for DOM element"
  prop(testid, :string)
  @doc "Id of the component"
  prop(id, :string)
  @doc "On click event"
  prop(on_click, :event, required: true)
  @doc "Default slot"
  slot(default)

  def render(assigns) do
    ~F"""
    <div {=@id} data-testid={@testid} class={merge(["flex justify-end pt-4 pe-4", @class])}>
      <IconButton.White icon="controls_close_small" class="z-10" {=@on_click} />
    </div>
    """
  end
end
