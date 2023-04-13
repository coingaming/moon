defmodule Moon.Design.Pagination do
  @moduledoc false

  use Moon.StatelessComponent

  @doc "id attribute for DOM element"
  prop(id, :string)
  @doc "data-testid attribute for DOM element"
  prop(testid, :string)
  @doc "additional Tailwind classes"
  prop(class, :css_class)

  @doc "Inner content of the component"
  slot(previous_button, required: true)

  @doc "Inner content of the component"
  slot(pages, required: true)

  @doc "Inner content of the component"
  slot(next_button, required: true)

  def render(assigns) do
    ~F"""
    <nav
    class={merge(["flex gap-1 items-center justify-center w-full h-10 text-sm flex-grow", @class
    ])}
    aria-label="pagination"
  >
  <#slot {@previous_button}  />
  <#slot {@pages}/>
  <#slot {@next_button}/>
  </nav>


    """
  end
end
