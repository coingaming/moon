defmodule Moon.Light.Table do
  @moduledoc "Some helper functions used in <.table /> component"

  import Moon.Helpers.MakeList, only: [add_index_as: 1]

  def sort_items(items, sort) do
    import Enum, only: [reverse: 1, reduce: 3, sort_by: 3]

    reverse(sort)
    |> reduce(items, fn {field, sort_dir}, list ->
      sort_by(
        list,
        & &1[field],
        &if sort_dir == "ASC" do
          &1 < &2
        else
          &1 > &2
        end
      )
    end)
  end

  def toggle_sort_dir(sort_dir) do
    if "#{sort_dir}" == "ASC" do
      "DESC"
    else
      "ASC"
    end
  end

  def is_selected_item(item, selected) do
    item[:is_selected] || is_selected(item[:id], selected)
  end

  def is_selected(id, selected) when is_list(selected) do
    "#{id}" in selected
  end

  def is_selected(id, selected) do
    "#{id}" == "#{selected}"
  end

  def inter_cell_border() do
    "after:content-[\"\"] after:absolute after:w-px after:bg-beerus " <>
      "after:h-3/5 after:bottom-[20%] after:right-0 after:translate-x-[-50%] relative"
  end

  def text_size_classes(row_size) do
    case row_size do
      "xs" -> "text-moon-12 py-1 px-2"
      "sm" -> "text-moon-14 py-1 px-3"
      "md" -> "text-moon-14 py-2 px-3"
      "lg" -> "text-moon-14 py-3 px-3"
      "xl" -> "text-moon-14 py-4 px-3"
      "2xl" -> "text-moon-14 py-5 px-3"
    end
  end

  def stream_data(%{items: stream = %Phoenix.LiveView.LiveStream{}}) do
    stream
  end

  def stream_data(%{items: items, sort: sort}) when is_list(items) do
    items |> add_index_as() |> sort_items(sort) |> Enum.with_index(&{&2, &1})
  end

  def dom_id(id, _) when is_binary(id) do
    id
  end

  def dom_id(id, id2) do
    "#{id2}-row-#{id}"
  end
end
