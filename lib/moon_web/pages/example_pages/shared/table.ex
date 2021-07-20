defmodule MoonWeb.Pages.ExamplePages.Shared.Table do
  use Moon.StatelessComponent

  alias Moon.Assets.Logos.LogoBitcasinoShort
  alias Moon.Assets.Logos.LogoSportsbetShort
  alias Moon.Assets.Logos.LogoSlotsShort
  alias Moon.Assets.Logos.LogoAposta10Short
  alias Moon.Autolayouts.LeftToRight

  prop columns, :list, required: true # [%{ field: atom, label: string, type: nil | :brand | :date }, ...]
  prop items, :list, required: true   # [%{ id: integer | string, ...}, ...]

  prop on_select, :event
  prop active_item_id, :any # integer | string

  def render(assigns) do
    fields = assigns.columns
      |> Enum.map(&({Map.get(&1, :field), Map.get(&1, :type)}))

    ~F"""
    <table class="min-w-full border-collapse border-t border-goku-40 overflow-scroll">
      <thead>
        <tr>
          <!-- This is used to render overlay on top of a row -->
          <th class="w-0"/>
          {#for column <- @columns}
            <th class="w-64 p-4 text-left text-sm text-trunks-100 font-normal border-r last:border-r-0 border-goku-40">
              {column.label}
            </th>
          {/for}
        </tr>
      </thead>
      <tbody>
        {#for {item, ind} <- @items |> Enum.with_index()}
          <tr {...get_row_attrs(item, ind, assigns)}>
            <!-- This is used to render overlay on top of a row -->
            <td>
              {#if is_active(item, assigns.active_item_id)}
                <div class="absolute inset-0 z-10 rounded border-2 border-tap-100"/>
              {#elseif is_nil(assigns.active_item_id)}
                <div class="absolute inset-0 z-10 rounded group-hover:border-2 group-hover:border-tap-100"/>
              {/if}
            </td>
            {#for {field, type} <- fields}
              <td class="border-r last:border-r-0 border-goku-40">
                {render_field(item[field], type, assigns)}
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

    case {assigns.on_select, is_active(item, assigns.active_item_id)} do
      {nil, _} -> %{
        class: "#{base_classes} #{bg_color}"
      }

      {e, false} -> %{
        class: "#{base_classes} cursor-pointer #{bg_color}",
        "phx-click": "#{e.name}:#{item.id}",
        "phx-target": e.target
      }

      {e, true} -> %{
        class: "#{base_classes} cursor-pointer bg-gohan-100",
        "phx-click": "#{e.name}:#{item.id}",
        "phx-target": e.target
      }
    end
  end

  # NOTE: assigns is required for ~F sigil to work
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

      :date ->
        ~F"""
        <div class={"#{base_classes} truncate"}>
          {value |> Timex.format!("%b %d, %Y", :strftime)}
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

  defp is_active(item, active_item_id) do
    "#{item.id}" == "#{active_item_id}"
  end
end
