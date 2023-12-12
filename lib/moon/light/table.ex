defmodule Moon.Light.Table do
  @moduledoc false

  use Moon.Light.Component

  defmodule Helper do
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

  @doc "Input styled to use inside the tables"
  attr(:testid, :string, doc: "Data-testid attribute for html tag", default: nil)
  attr(:id, :string, doc: "Id attribute for html tag", default: nil)
  attr(:class, :any, doc: "Additional CSS classes for the html tag", default: nil)
  attr(:placeholder, :string, doc: "Text to be shown when no value given", default: nil)
  attr(:value, :string, doc: "Value to be shown", default: nil)
  attr(:disabled, :boolean, doc: "If the item should be marked as disabled", default: nil)
  attr(:side_values, :any, default: %{}, doc: "Additional values to be passed")
  attr(:opts, :any, default: %{}, doc: "Keyword | Map of additional attributes for the input")
  attr(:on_change, Event, doc: "On change event for the input", default: nil)
  attr(:on_keyup, Event, doc: "On keyup event for the input", default: nil)
  attr(:on_focus, Event, doc: "On focus event for the input", default: nil)
  attr(:on_blur, Event, doc: "On blur event for the input", default: nil)

  def input(assigns) do
    ~H"""
    <input
      value={@value}
      id={@id}
      placeholder={@placeholder}
      data-testid={@testid}
      disabled={@disabled}
      autocomplete="off"
      class={
        merge([
          "block w-full max-w-full py-0 px-1 m-0 appearance-none text-bulma transition-shadow box-border relative z-[2]",
          "bg-transparent hover:bg-heles focus:shadow-input-cell-focus focus:outline-none focus:bg-heles",
          "focus-visible::shadow-input-cell-focus focus-visible::outline-none focus-visible::bg-heles rounded-moon-i-xs",
          "rtl:[&:not([disabled])]:[&:not([readonly])]:[&:not([readonly])]:hover:rounded-moon-i-xs",
          "rtl:[&:not([disabled])]:[&:not([readonly])]:focus:rounded-moon-i-xs rtl:invalid:rounded-moon-i-xs",
          "ltr:[&:not([disabled])]:[&:not([readonly])]:hover:rounded-moon-i-xs ltr:[&:not([disabled])]:[&:not([readonly])]:focus:rounded-moon-i-xs",
          "ltr:invalid:rounded-moon-i-xs before:box-border after:box-border placeholder:text-trunks placeholder:opacity-100",
          "placeholder:transition-opacity placeholder:delay-75 read-only:outline-0 read-only:border-none",
          "read-only:cursor-not-allowed read-only:hover:shadow-input read-only:focus:shadow-input",
          "read-only:focus-visible:shadow-input input-dt-shared invalid:shadow-input-err invalid:hover:shadow-input-err",
          "invalid:focus:shadow-input-err invalid:focus-visible:shadow-input-err",
          @class
        ])
      }
      phx-target={[@on_change, @on_keyup, @on_focus, @on_blur] |> get_target()}
      phx-change={@on_change && @on_change.name}
      phx-keyup={@on_keyup && @on_keyup.name}
      phx-focus={@on_focus && @on_focus.name}
      phx-blur={@on_blur && @on_blur.name}
      {@opts}
      {data_values(@side_values)}
    />
    """
  end

  defp get_target(events) do
    event = events |> Enum.find(&(!!&1))
    event && event.target
  end
end
