defmodule Moon.Design.Pagination.Pages do
  @moduledoc false

  use Moon.StatelessComponent, slot: "pages"

  @doc "Id attribute for DOM element"
  prop(id, :string)

  @doc "Data-testid attribute for DOM element"
  prop(testid, :string)

  @doc "Additional Tailwind classes"
  prop(class, :css_class)

  @doc "Additional Tailwind classes for page buttons"
  prop(button_class, :css_class)

  @doc "Text to render if a one or more pages are truncated."
  prop(truncable_text, :string, default: "...")

  @doc "Additional Tailwind classes for truncable text"
  prop(truncable_text_class, :css_class)

  @doc "Additional Tailwind classes for background color of page buttons in default state"
  prop(default_bg_color, :css_class, default: "bg-transparent focus:bg-jiren hover:bg-jiren")

  @doc "Additional Tailwind classes for background color of page buttons in selected state"
  prop(selected_bg_color, :css_class, default: "bg-piccolo text-goten")

  # internal API
  @doc "Will be got from Pagination in most cases"
  prop(total_pages, :integer, from_context: :total_pages)

  @doc "Will be got from Pagination in most cases"
  prop(on_change, :event, from_context: :on_change)

  @doc "Will be got from Pagination in most cases"
  prop(value, :integer, from_context: :value)

  def generate_paging_button(%{
        total_pages: total_pages,
        value: value,
        truncable_text: truncable_text
      }) do
    if total_pages <= 6 do
      Enum.to_list(1..total_pages)
    else
      page_range = page_range(value, total_pages)

      [
        1,
        page_range.first > 2 && truncable_text,
        Enum.to_list(page_range),
        total_pages - page_range.last > 1 && truncable_text,
        total_pages
      ]
      |> Enum.filter(& &1)
      |> List.flatten()
    end
  end

  def page_range(value, total_pages) do
    range_around_adjusted =
      if value == 1 || value == total_pages do
        2
      else
        1
      end

    min_page = max(2, value - range_around_adjusted)
    max_page = min(value + range_around_adjusted, total_pages - 1)

    min_page..max_page
  end

  def render(assigns) do
    ~F"""
    <nav
      {=@id}
      class={merge(["flex gap-1 items-center justify-center w-full h-10 text-sm flex-grow", @class])}
      aria-label="pagination"
      data-testid={@testid}
    >
      {#for page <- generate_paging_button(assigns)}
        <span
          :if={page == @truncable_text}
          class={merge(["flex justify-center min-w-8", @truncable_text_class])}
        >{@truncable_text}</span>
        <button
          :if={page != @truncable_text}
          class={merge([
            [
              "flex items-center justify-center cursor-pointer w-8 h-8 rounded-moon-s-sm focus:outline-none",
              (page == @value && @selected_bg_color) || @default_bg_color
            ],
            @button_class
          ])}
          :on-click={@on_change}
          value={page}
          aria-label={"page_#{page}"}
          tabindex={0}
        >
          {page}
        </button>
      {/for}
    </nav>
    """
  end
end
