defmodule Moon.ComponentsV2.Table do
  @moduledoc false

  use Moon.StatefulComponent

  alias Elixir.Timex.Format.DateTime.Formatters.Relative

  alias Moon.Assets.Icons.IconArrowLDown
  alias Moon.Assets.Icons.IconArrowLUp
  alias Moon.Assets.Icons.IconChevronLeftRounded
  alias Moon.Assets.Icons.IconChevronRightRounded
  alias Moon.Assets.Icons.IconRefresh
  alias Moon.Assets.Icons.IconRow
  alias Moon.Assets.Logos.LogoAposta10Short
  alias Moon.Assets.Logos.LogoBitcasinoShort
  alias Moon.Assets.Logos.LogoSlotsShort
  alias Moon.Assets.Logos.LogoSportsbetShort
  alias Moon.Autolayouts.LeftToRight
  alias Moon.Components.Divider

  # list(%{
  #   field: atom() | list(atom()),
  #   label: <<_::size>>,
  #   type: :brand | :date | :money_amount | :text | nil,
  #   sortable: true | false | nil
  # })
  prop columns, :list, required: true

  # list(%{
  #   id: integer() | <<_::size>>,
  #   ...
  # })
  prop items, :list, required: true

  # {atom() | list(atom) | nil, :asc | :desc | nil}
  prop sort_by, :tuple, default: {nil, nil}

  # integer() | <<_::size>> | nil
  prop active_item_id, :any

  # Pagination data
  prop page, :number, required: true
  prop page_count, :number, required: true
  prop total_count, :number, required: true

  slot active_item_popover

  def render(assigns) do
    fields =
      assigns.columns
      |> Enum.map(&{Map.get(&1, :field), Map.get(&1, :type)})

    on_next_page = %{name: "goto_next_page", target: assigns.myself}
    on_prev_page = %{name: "goto_prev_page", target: assigns.myself}
    on_select = %{name: "select_item", target: assigns.myself}
    on_sort = %{name: "sort_items", target: assigns.myself}

    ~F"""
    <div>
      <Divider class="mt-2" />
      <div class="h-14 max-w-full flex justify-between items-center">
        <LeftToRight>
          {"#{1 + @page_count * (@page - 1)}-#{@page_count * @page} of #{@total_count}"}
          <IconRefresh font_size="1.2rem" class="ml-2" />
        </LeftToRight>

        <LeftToRight>
          <IconChevronLeftRounded font_size="1.2rem" class="mr-2" click={on_prev_page} />
          <IconChevronRightRounded font_size="1.2rem" click={on_next_page} />
          <Divider orientation="vertical" class="mx-4" />
          <IconRow font_size="1.2rem" class="mr-4" />
        </LeftToRight>
      </div>
      <div class="w-full overflow-x-scroll">
        <table class="text-sm border-collapse border-t border-beerus-100">
          <thead>
            <tr>
              <!-- This is used to render overlay on top of a row -->
              <th class="w-0" />
              {#for column <- @columns}
                <th class="border-r last:border-r-0 border-beerus-100">
                  {render_column(column, on_sort, assigns)}
                </th>
              {/for}
            </tr>
          </thead>
          <tbody>
            {#for {item, ind} <- @items |> Enum.with_index()}
              <tr {...get_row_attrs(item, ind, on_select)}>
                <!-- This is used to render overlay on top of a row -->
                <td>
                  {#if "#{item.id}" == "#{assigns.active_item_id}"}
                    <div class="absolute inset-0 rounded border border-piccolo-100">
                      <div class="inline-block transform -translate-y-full pb-2">
                        <slot name="active_item_popover" />
                      </div>
                    </div>
                  {#elseif is_nil(assigns.active_item_id)}
                    <div class="absolute inset-0 rounded group-hover:border group-hover:border-piccolo-100" />
                  {/if}
                </td>
                {#for {field, type} <- fields}
                  <td class="border-r last:border-r-0 border-beerus-100">
                    {render_field(get_value(item, field), type, assigns)}
                  </td>
                {/for}
              </tr>
            {/for}
          </tbody>
        </table>
      </div>
    </div>
    """
  end

  #
  # Helpers for render
  #
  defp get_row_attrs(item, ind, on_select) do
    bg_color = if rem(ind, 2) == 0, do: "bg-goku-100", else: "bg-gohan-100"
    base_classes = "relative group"

    %{
      class: "#{base_classes} #{bg_color} cursor-pointer",
      "phx-click": "#{on_select.name}:#{item.id}",
      "phx-target": on_select.target
    }
  end

  defp render_column(col, on_sort, assigns) do
    field_str =
      case col.field do
        [_ | _] -> col.field |> Enum.map(&Atom.to_string(&1)) |> Enum.join("+")
        _ -> col.field |> Atom.to_string()
      end

    align_left = Map.get(col, :type) != :money_amount

    on_click_column = %{on_sort | name: "#{on_sort.name}:#{field_str}"}

    ~F"""
    <div class={
      "w-64 px-1 py-2 text-trunks-100 text-xs font-normal",
      "text-left": align_left,
      "text-right": not align_left
    }>
      {#if Map.get(col, :sortable) |> is_truthy?()}
        <div
          :on-click={on_click_column}
          class={
            "inline-flex items-center px-3 py-2 hover:bg-goku-80 rounded select-none cursor-pointer",
            "flex-row-reverse": not align_left
          }
        >
          <div class="text-xs font-normal mr-2">{col.label}</div>
          {#case column_sort_order(col.field, @sort_by)}
            {#match :asc}
              <IconArrowLDown font_size="1.2rem" />
            {#match :desc}
              <IconArrowLUp font_size="1.2rem" />
            {#match nil}
              <IconArrowLUp font_size="1.2rem" class="invisible" />
          {/case}
        </div>
      {#else}
        <div class="inline-block justify-start items-center p-2 cursor-default">
          {col.label}
        </div>
      {/if}
    </div>
    """
  end

  defp render_field(value, type, assigns) do
    base_classes = "min-w-64 max-w-full px-4 py-4.5"

    case type do
      :brand ->
        ~F"""
        <div class={"#{base_classes}"}>
          <LeftToRight class="flex items-center">
            {#case value}
              {#match "Bitcasino"}
                <LogoBitcasinoShort font_size="1rem" />
              {#match "Sportsbet"}
                <LogoSportsbetShort font_size="1rem" />
              {#match "Slots"}
                <LogoSlotsShort font_size="1rem" />
              {#match "Aposta10"}
                <LogoAposta10Short font_size="1rem" />
            {/case}
            {value}
          </LeftToRight>
        </div>
        """

      :datetime_relative ->
        ~F"""
        <div class="flex flex-col justify-around h-full min-w-64 max-w-full px-4">
          <div class="leading-6">
            {value |> Timex.format!("%b %d, %Y, %H:%M:%S", :strftime)}
          </div>
          <div class="text-xs text-trunks-100">
            {value |> Relative.format!("{relative}")}
          </div>
        </div>
        """

      :datetime ->
        ~F"""
        <div class={"#{base_classes} truncate"}>
          {value |> Timex.format!("%b %d, %Y, %H:%M:%S", :strftime)}
        </div>
        """

      :date ->
        ~F"""
        <div class={"#{base_classes} truncate"}>
          {value |> Timex.format!("%b %d, %Y", :strftime)}
        </div>
        """

      :money_amount ->
        ~F"""
        <div class={"#{base_classes} text-right truncate"}>
          {value}
        </div>
        """

      _ ->
        ~F"""
        <div class={"#{base_classes} truncate"}>
          {value}
        </div>
        """
    end
  end

  #
  # Event Handlers
  #
  def handle_event("goto_prev_page", _, socket = %{assigns: %{id: id, page: page}}) do
    self() |> send({:table, {id, :paginate, if(page > 1, do: page - 1, else: page)}})
    {:noreply, socket}
  end

  def handle_event("goto_next_page", _, socket = %{assigns: %{id: id, page: page}}) do
    self() |> send({:table, {id, :paginate, page + 1}})
    {:noreply, socket}
  end

  def handle_event(event, _, socket) do
    %{id: id} = socket.assigns

    case String.split(event, ":") do
      ["select_item", id_str] ->
        item = socket.assigns.items |> Enum.find(nil, &("#{&1.id}" == id_str))

        if item != nil, do: self() |> send({:table, {id, :select, item}})
        {:noreply, socket}

      ["sort_items", field_str] ->
        field =
          field_str
          |> String.split("+")
          |> atomize_strings

        sort_by =
          case socket.assigns.sort_by do
            {^field, :asc} -> {field, :desc}
            {^field, :desc} -> {field, :asc}
            _ -> {field, :asc}
          end

        self() |> send({:table, {id, :sort, sort_by}})
        {:noreply, socket}

      _ ->
        {:noreply, socket}
    end
  end

  defp atomize_strings(strs) do
    case strs do
      [str] -> String.to_existing_atom(str)
      [_ | _] -> strs |> Enum.map(&String.to_existing_atom(&1))
      _ -> nil
    end
  end

  #
  # Helpers
  #
  defp column_sort_order(col_field, {sort_field, sort_order}) do
    is_match =
      case {col_field, sort_field} do
        {[_ | _], [_ | _]} -> col_field == sort_field
        {x, [y]} -> x == y
        {[x], y} -> x == y
        _ -> col_field == sort_field
      end

    if is_match, do: sort_order, else: nil
  end

  defp get_value(nil, _), do: nil

  defp get_value(m, key) do
    case key do
      [k] -> m |> Map.get(k)
      [k | ks] -> get_value(m, k) |> get_value(ks)
      _ -> m |> Map.get(key)
    end
  end

  defp is_truthy?(x) do
    x != nil && x != false
  end
end
