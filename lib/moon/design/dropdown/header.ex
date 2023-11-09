defmodule Moon.Design.Dropdown.Header do
  @moduledoc "Optional dropdown header"

  use Moon.StatelessComponent, slot: "header"

  @doc "Data-testid attribute for HTML tag"
  prop(testid, :string)
  @doc "Id attribute for HTML tag"
  prop(id, :string)
  @doc "Additional Taiilwind classes"
  prop(class, :css_class)

  @doc "Inner content of the component"
  slot(default)

  def render(assigns) do
    ~F"""
    <div
      data-testid={@testid}
      {=@id}
      class={merge(["h-12 px-4 py-3 text-moon-16 font-medium text-bulma border-b border-beerus", @class])}
    >
      <#slot />
    </div>
    """
  end
end
