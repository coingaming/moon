defmodule Moon.Components.PaginationButton do
  @moduledoc false

  use Moon.StatelessComponent
  alias Moon.Components.Button

  prop(size, :string, required: true)
  prop(page_number, :integer, required: true)
  prop(current_page_number, :integer, required: true)
  prop(label, :string)
  prop(variant, :string)
  prop(disabled, :boolean, default: false)
  prop(class, :string)
  prop(on_click, :event)

  def render(assigns) do
    ~F"""
    <Button
      size={@size}
      variant={if @page_number == @current_page_number, do: "primary", else: @variant}
      class={"mx-2 font-semibold transition-none rounded-moon-s-sm #{@class}"}
      on_click={@on_click}
      value_name="page"
      value={@page_number}
      disabled={@disabled}
    >{@label || @page_number}</Button>
    """
  end
end

defmodule Moon.Components.Pagination do
  @moduledoc false

  use Moon.StatelessComponent
  alias Moon.Components.PaginationButton

  prop(current_page_number, :integer, required: true)
  prop(total_pages, :integer, required: true)
  prop(range_before, :integer, default: 1)
  prop(range_after, :integer, default: 1)
  prop(size, :string, values: ["xsmall", "small", "medium", "large"], default: "xsmall")
  prop(previous_button_label, :string, default: "Previous")
  prop(next_button_label, :string, default: "Next")
  prop(on_change, :event)

  def render(assigns) do
    ~F"""
    <div class="flex flex-wrap items-center justify-center">
      <div class="mb-4 w-full lg:w-auto">
        <PaginationButton
          size={@size}
          page_number={@current_page_number - 1}
          label={@previous_button_label}
          current_page_number={@current_page_number}
          disabled={@current_page_number <= 1}
          class="block mx-auto"
          on_click={@on_change}
        />
      </div>

      <div class="flex grow items-center justify-center mb-4">
        <PaginationButton
          size={@size}
          page_number={1}
          current_page_number={@current_page_number}
          variant="tertiary"
          on_click={@on_change}
        />

        <div :if={@current_page_number - @range_before > 2} class="mx-2">…</div>

        <PaginationButton
          :if={@total_pages > 2}
          :for={page <- page_range(@current_page_number, @range_before, @range_after, @total_pages)}
          size={@size}
          page_number={page}
          current_page_number={@current_page_number}
          variant="tertiary"
          on_click={@on_change}
        />

        <div :if={@current_page_number + @range_after < @total_pages - 1} class="mx-2">…</div>

        <PaginationButton
          :if={@total_pages > 1}
          size={@size}
          page_number={@total_pages}
          current_page_number={@current_page_number}
          variant="tertiary"
          on_click={@on_change}
        />
      </div>

      <div class="mb-4 w-full lg:w-auto">
        <PaginationButton
          size={@size}
          page_number={@current_page_number + 1}
          label={@next_button_label}
          current_page_number={@current_page_number}
          disabled={@current_page_number >= @total_pages}
          class="block mx-auto"
          on_click={@on_change}
        />
      </div>
    </div>
    """
  end

  def page_range(current_page, range_before, range_after, total_pages) do
    min_page = max(2, current_page - range_before)
    max_page = min(current_page + range_after, total_pages - 1)

    min_page..max_page
  end
end
