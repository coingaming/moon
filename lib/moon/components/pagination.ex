defmodule Moon.Components.PaginationButton do
  use Moon.StatelessComponent
  alias Moon.Components.Button

  prop size, :string, required: true
  prop variant, :string
  prop page_number, :integer, required: true
  prop current_page_number, :integer, required: true
  prop on_click, :event

  def render(assigns) do
    ~H"""
    <Button
      size={{ @size }}
      variant={{ if @page_number == @current_page_number, do: "primary", else: @variant }}
      class={{ "mx-2 font-semibold rounded-lg" }}
      on_click={{ @on_click }}
      value={{ @page_number }}
    >{{ @page_number }}</Button>
    """
  end
end

defmodule Moon.Components.Pagination do
  use Moon.StatelessComponent
  alias Moon.Components.PaginationButton
  alias Moon.Components.Button

  prop size, :string, values: ["xsmall", "small", "medium", "large"], default: "xsmall"
  prop variant, :string, values: ["primary", "secondary", "tertiary", "highlight", "default"]
  prop current_page_number, :integer, required: true
  prop total_pages, :integer, required: true
  prop range_before, :integer, default: 2
  prop range_after, :integer, default: 2
  prop margin_pages_displayed, :integer, default: 1
  prop previous_button_label, :string, default: "Previous"
  prop next_button_label, :string, default: "Next"
  prop on_change, :event
  prop target, :string

  def render(assigns) do
    ~H"""
    <div class="flex flex-wrap items-center justify-between">
      <div class="flex-none">
        <Button
          size={{ @size }}
          class=""
          disabled={{ @current_page_number <= 1 }}
          on_click={{ @on_change }}
          value={{ @current_page_number - 1 }}
        >
          {{ @previous_button_label }}
        </Button>
      </div>
      <div class="flex-grow flex items-center justify-center">
        <PaginationButton
          size={{ @size }}
          page_number={{ 1 }}
          current_page_number={{ @current_page_number }}
          variant="tertiary"
          on_click={{ @on_change }}
        />

        <div :if={{ @current_page_number - @range_before > 2 }} class="mx-2">…</div>

        <PaginationButton
          :for={{ page <- page_range(@current_page_number, @range_before, @range_after, @total_pages) }}
          size={{ @size }}
          page_number={{ page }}
          current_page_number={{ @current_page_number }}
          variant="tertiary"
          on_click={{ @on_change }}
        />

        <div :if={{ @current_page_number + @range_after < @total_pages - 1 }} class="mx-2">…</div>

        <PaginationButton
          size={{ @size }}
          page_number={{ @total_pages }}
          current_page_number={{ @current_page_number }}
          variant="tertiary"
          on_click={{ @on_change }}
        />
      </div>

      <div class="flex-none">
        <Button
          size={{ @size }}
          class=""
          disabled={{ @current_page_number >= @total_pages }}
          on_click={{ @on_change }}
          value={{ @current_page_number + 1 }}
        >
          {{ @next_button_label }}
        </Button>
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
