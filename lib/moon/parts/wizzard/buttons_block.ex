defmodule Moon.Parts.Wizard.ButtonsBlock do
  @moduledoc false

  use Moon.StatelessComponent

  @doc "Id attribute for DOM element"
  prop(id, :string)
  @doc "Additional Tailwind classes for external container"
  prop(class, :css_class)
  @doc "Additional Tailwind classes for internal container"
  prop(testid, :string)

  @doc "Additional buttons etc."
  slot(default)

  def render(assigns) do
    ~F"""
    <div
      {=@id}
      data-testid={@testid}
      class={merge(["w-full flex justify-start gap-2 border-t border-beerus py-8", @class])}
    >
      <#slot />
    </div>
    """
  end
end
