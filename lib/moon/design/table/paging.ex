defmodule Moon.Design.Table.Paging do
  @moduledoc false

  use Moon.StatelessComponent

  alias Moon.Icons.ControlsChevronLeft
  alias Moon.Icons.ControlsChevronRight

  prop(paging_info, :any, default: %{visible_count: 0, total_count: 0})
  prop(paging_click, :event)
  prop(limit, :integer, default: 10)
  prop(offset, :integer, default: 0)

  def render(assigns) do
    ~F"""
    <div class="w-full flex">
      <div class="flex-1"><span class="font-bold">{@offset + 1}-{@offset + @paging_info.visible_count}</span> of {@paging_info.total_count}</div>
      <div class="flex-1 text-right">
        <span
          class="cursor-pointer"
          :on-click={@paging_click}
          :values={offset: @offset - @limit}
          data-testid="previous-page"
        ><ControlsChevronLeft /></span>
        <span
          class="cursor-pointer"
          :on-click={@paging_click}
          :values={offset: @offset + @limit}
          data-testid="next-page"
        ><ControlsChevronRight /></span>
      </div>
    </div>
    """
  end
end
