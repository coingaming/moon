defmodule MoonWeb.Pages.ExamplePages.Helpers do
  def toggle_selected_item(all_items, selected_items, toggle_item_value) do
    item_in_all = Enum.find(all_items, &(&1.value == toggle_item_value))
    item_in_selected = Enum.find(selected_items, &(&1.value == toggle_item_value))

    case {item_in_all, item_in_selected} do
      {nil, nil} -> selected_items
      {item, nil} -> [item | selected_items]
      {_, item} -> List.delete(selected_items, item)
    end
  end

  def search_by_labels(all_items, search_text) do
    search_text = String.upcase(search_text)

    all_items
    |> Enum.filter(&String.contains?(String.upcase(&1.label), search_text))
  end

  def format_filter_count(count) do
    if count > 0 do
      "• #{count}"
    else
      "• All"
    end
  end

  @spec to_integer(String.t() | integer(), any()) :: any()
  def to_integer(int, _default) when is_integer(int), do: int

  def to_integer(str, default) do
    String.to_integer(str)
  rescue
    ArgumentError ->
      default
  end
end
