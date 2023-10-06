defmodule Moon.Parts.Sidebar.Menu do
  @moduledoc false

  use Moon.StatelessComponent, slot: "menu"

  @doc "Id attribute for DOM element"
  prop(id, :string)
  @doc "Data-testid attribute for DOM element"
  prop(testid, :string)
  @doc "Additional Tailwind classes"
  prop(class, :css_class)
  @doc "If is slim sidebar"
  prop(is_slim, :boolean, from_context: :is_slim)
  @doc "Default slot"
  slot(default)

  def render(assigns) do
    ~F"""
    <div
      class={merge([
        ["flex flex-col gap-2", "gap-4": @is_slim],
        @class
      ])}
      {=@id}
      data-testid={@testid}
    >
      <#slot />
    </div>
    """
  end
end
