defmodule Moon.Components.TableV2 do
  @moduledoc false

  use Moon.StatelessComponent

  alias Elixir.Timex.Format.DateTime.Formatters.Relative

  alias Moon.Assets.Icons.IconArrowLDown
  alias Moon.Assets.Icons.IconArrowLUp
  alias Moon.Assets.Logos.LogoAposta10Short
  alias Moon.Assets.Logos.LogoBitcasinoShort
  alias Moon.Assets.Logos.LogoSlotsShort
  alias Moon.Assets.Logos.LogoSportsbetShort
  alias Moon.Autolayouts.LeftToRight

  # [
  #   %{ field: :atom, [:atom, ...]
  #    , label: string
  #    , type: :brand | :date | :money_amount | :text | nil
  #    , sortable: true | false | nil
  #    }
  # , ...]
  prop columns, :list, required: true
  # [%{ id: integer | string, ...}, ...]
  prop items, :list, required: true

  # :event | nil
  prop on_sort, :event, default: nil
  # {:atom | [:atom, ...] | nil, :asc | :desc | nil}
  prop sort_by, :tuple

  # :event | nil
  prop on_select, :event, default: nil
  # integer | string
  prop active_item_id, :any

  slot active_item_popover

  def render(assigns) do
    fields =
      assigns.columns
      |> Enum.map(&{Map.get(&1, :field), Map.get(&1, :type)})

    ~F"""
    <table class="min-w-full text-sm border-collapse border-t border-goku-40 overflow-scroll">
      <thead>
        <tr>
          <!-- This is used to render overlay on top of a row -->
          <th class="w-0" />
          {#for column <- @columns}
            <th class="border-r last:border-r-0 border-goku-40">
              {render_column(column, assigns)}
            </th>
          {/for}
        </tr>
      </thead>
      <tbody>
        {#for {item, ind} <- @items |> Enum.with_index()}
          <tr {...get_row_attrs(item, ind, assigns)}>
            <!-- This is used to render overlay on top of a row -->
            <td>
              {#if is_active_row?(item, assigns.active_item_id)}
                <div class="absolute inset-0 rounded border-2 border-tap-100">
                  <div class="inline-block transform -translate-y-full pb-2">
                    <slot name="active_item_popover" />
                  </div>
                </div>
              {#elseif is_nil(assigns.active_item_id)}
                <div class="absolute inset-0 rounded group-hover:border-2 group-hover:border-tap-100" />
              {/if}
            </td>
            {#for {field, type} <- fields}
              <td class="border-r last:border-r-0 border-goku-40">
                {render_field(get_value(item, field), type, assigns)}
              </td>
            {/for}
          </tr>
        {/for}
      </tbody>
    </table>
    """
  end

  # TODO: Investigate this further
  #   For some reason, setting :on-click via this method is throwing
  #   an error, ex: %{ ":on-click": ${e | name: "#{e.name}:#{item.id}"}}.
  #   so directly setting phx-click and phx-target manually here
  defp get_row_attrs(item, ind, assigns) do
    bg_color = if rem(ind, 2) == 0, do: "bg-gohan-100", else: "bg-goku-100"
    base_classes = "relative group"

    if assigns.on_select == nil do
      %{class: "#{base_classes} #{bg_color}"}
    else
      %{
        class: "#{base_classes} #{bg_color} cursor-pointer",
        "phx-click": "#{assigns.on_select.name}:#{item.id}",
        "phx-target": assigns.on_select.target
      }
    end
  end

  defp render_column(col, assigns) do
    align_left = Map.get(col, :type) != :money_amount

    ~F"""
    <div class={
      "w-64 px-1 py-2 text-trunks-100 text-sm font-normal",
      "text-left": align_left,
      "text-right": not align_left
    }>
      {#case {@on_sort |> is_truthy?(), Map.get(col, :sortable) |> is_truthy?()}}
        {#match {true, true}}
          <div
            :on-click={on_click_column(col.field, @on_sort)}
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
        {#match _}
          <div class="inline-block justify-start items-center p-2 cursor-default">
            {col.label}
          </div>
      {/case}
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
          <div class="text-sm text-trunks-100">
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

  defp is_active_row?(item, active_item_id) do
    "#{item.id}" == "#{active_item_id}"
  end

  defp on_click_column(col_field, on_sort) do
    field_str =
      case col_field do
        [_ | _] -> col_field |> Enum.map(&Atom.to_string(&1)) |> Enum.join("+")
        _ -> Atom.to_string(col_field)
      end

    %{on_sort | name: "#{on_sort.name}:#{field_str}"}
  end

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
