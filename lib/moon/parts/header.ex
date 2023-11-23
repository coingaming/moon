defmodule Moon.Parts.Header do
  @moduledoc false

  use Moon.StatelessComponent

  @doc "Id for DOM element"
  prop(id, :string)
  @doc "Data-testid attribute for DOM element"
  prop(testid, :string)
  @doc "Additional Tailwind classes"
  prop(class, :css_class)
  @doc "Default slot for header content"
  slot(default)

  def render(assigns) do
    ~F"""
    <header
      {=@id}
      data-testid={@testid}
      class={merge([
        "w-full sticky top-0 bg-goku px-4 pb-6 pt-[5.5rem] lg:p-8 min-h-[5rem] theme-moon-dark",
        @class
      ])}
    >
      <#slot />
    </header>
    """
  end
end
