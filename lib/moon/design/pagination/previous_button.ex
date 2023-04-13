defmodule Moon.Design.Pagination.PreviousButton do
  @moduledoc false

  use Moon.StatelessComponent, slot: "previous_button"

  @doc "id attribute for DOM element"
  prop(id, :string)
  @doc "data-testid attribute for DOM element"
  prop(testid, :string)
  @doc "additional Tailwind classes"
  prop(class, :css_class)

  @doc "Inner content of the component"
  slot(default, required: true)

  @doc ""
  prop(paging_info, :any, default: %{visible_count: 0, total_count: 0})

  @doc ""
  prop(paging_click, :event)

  @doc ""
  prop(limit, :integer, default: 10)

  @doc ""
  prop(offset, :integer, default: 0)

  def render(assigns) do
    ~F"""
    <button
    class={merge(["moon-disabled:cursor-not-allowed moon-disabled:opacity-30", @class
    ])}
    :if={@offset >= @limit}
    :on-click={@paging_click}
    :values={offset: @offset - @limit}
    data-testid="previous-page">
    <#slot />
    </button>
    """
  end
end
