defmodule Moon.Components.Table.Paging do
  @moduledoc false

  use Surface.Component

  alias Moon.Icons.ControlsChevronLeft
  alias Moon.Icons.ControlsChevronRight

  prop(paging_info, :any, default: %{visible_count: 0, total_count: 0})
  prop(paging_click, :event)
  prop(limit, :integer, default: 10)
  prop(offset, :integer, default: 0)
  prop(testid, :string, default: "paging")

  def render(assigns) do
    ~F"""
    <div class="w-full flex" data-testid={@testid}>
      <div class="flex-1"><span class="font-bold">{@offset + 1}-{@offset + @paging_info.visible_count}</span> of {@paging_info.total_count}</div>
      <div class="flex-1 text-right">
        <span
          :if={@offset >= @limit}
          class="cursor-pointer"
          :on-click={@paging_click}
          :values={offset: @offset - @limit}
          data-testid="previous-page"
        ><ControlsChevronLeft /></span>
        <span
          :if={@offset + @paging_info.visible_count < @paging_info.total_count}
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
