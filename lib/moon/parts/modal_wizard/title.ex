defmodule Moon.Parts.ModalWizard.Title do
  @moduledoc false

  use Moon.StatelessComponent, slot: "title"

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
    <h3 {=@id} data-testid={@testid} class={merge(["text-moon-24 text-bulma font-grotesk", @class])}><#slot />
    </h3>
    """
  end
end
