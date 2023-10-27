defmodule Moon.Parts.ModalWizard.Description do
  @moduledoc false

  use Moon.StatelessComponent, slot: "description"

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
    <p
      {=@id}
      data-testid={@testid}
      class={merge(["text-moon-14 text-bulma hidden lg:inline", @class])}
    ><#slot /></p>
    """
  end
end
