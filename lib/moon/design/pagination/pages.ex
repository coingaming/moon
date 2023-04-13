defmodule Moon.Design.Pagination.Pages do
  @moduledoc false

  use Moon.StatelessComponent, slot: "pages"

  @doc "id attribute for DOM element"
  prop(id, :string)
  @doc "data-testid attribute for DOM element"
  prop(testid, :string)
  @doc "additional Tailwind classes"
  prop(class, :css_class)

  @doc "Inner content of the component"
  slot(default, required: true)

  def render(assigns) do
    ~F"""
    <a
    class={merge(["flex items-center justify-center cursor-pointer w-8 h-8 rounded-moon-s-sm focus:outline-none", @class
    ])}
    >
    PAGE NUMBER
    </a>
    """
  end
end
