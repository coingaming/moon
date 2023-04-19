defmodule Moon.Design.Pagination do
  @moduledoc false

  use Moon.StatelessComponent

  @doc "Id attribute for DOM element"
  prop(id, :string)

  @doc "Data-testid attribute for DOM element"
  prop(testid, :string)

  @doc "Additional Tailwind classes"
  prop(class, :css_class)

  @doc "Previous button of Pagination component, see Pagination.PrevButton"
  slot(prev_button, required: true)

  @doc "Pages of Pagination component, see Pagination.Pages"
  slot(pages, required: true)

  @doc "Next button of Pagination component, see Pagination.NextButton"
  slot(next_button, required: true)

  @doc "The value of current page"
  prop(value, :integer, default: 1)

  @doc "The number of pages"
  prop(total_pages, :integer, required: true)

  @doc "The function to call when page is updated"
  prop(on_change, :event, required: true)

  @doc "Disabled state for the prev/next button when were reached the first/last page."
  prop(disabled, :boolean)

  def render(assigns) do
    ~F"""
    <div
      {=@id}
      class={merge(["flex justify-center items-center w-full select-none", @class])}
      data-testid={@testid}
    >
      <#slot
        {@prev_button}
        context_put={
          on_change: @on_change,
          value: @value - 1,
          disabled: @value <= 1
        }
      />
      <#slot
        {@pages}
        context_put={
          on_change: @on_change,
          total_pages: @total_pages,
          value: @value
        }
      />
      <#slot
        {@next_button}
        context_put={
          on_change: @on_change,
          value: @value + 1,
          disabled: @value >= @total_pages
        }
      />
    </div>
    """
  end
end
