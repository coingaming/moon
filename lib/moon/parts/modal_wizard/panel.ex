defmodule Moon.Parts.ModalWizard.Panel do
  @moduledoc false

  use Moon.StatelessComponent, slot: "panel"

  alias Moon.Design.Modal

  @doc "Additional Tailwind classes"
  prop(class, :css_class)
  @doc "Data-testid attribute for DOM element"
  prop(testid, :string)
  @doc "Id of the component"
  prop(id, :string)
  @doc "Default slot"
  slot(default)

  def render(assigns) do
    ~F"""
    <Modal.Panel class={merge([
      "max-w-[68.5rem] min-h-[43.5rem] rounded-[1.25rem] bg-goku theme-moon-dark flex relative",
      @class
    ])}><#slot /></Modal.Panel>
    """
  end
end
