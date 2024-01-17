defmodule Moon.Parts.Table.Paging do
  @moduledoc false

  use Moon.StatelessComponent

  prop(paging_info, :any, default: %{visible_count: 0, total_count: 0})
  prop(paging_click, :event)
  prop(limit, :integer, default: 10)
  prop(offset, :integer, default: 0)

  defdelegate render(assigns), to: Moon.Design.Table.Paging
end
