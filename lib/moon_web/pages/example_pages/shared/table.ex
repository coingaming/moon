defmodule MoonWeb.Pages.ExamplePages.Shared.Table do
  use Moon.StatelessComponent

  alias Moon.Assets.Logos.LogoBitcasinoShort
  alias Moon.Assets.Logos.LogoSportsbetShort
  alias Moon.Assets.Logos.LogoSlotsShort
  alias Moon.Assets.Logos.LogoAposta10Short
  alias Moon.Autolayouts.LeftToRight

  prop columns, :list          # [%{ field: :id, label: 'Id' }...]
  prop items, :list            # [%{ id: 12, name: 'pavan', brand: 'aposta10' }...]

  prop on_select, :event
  prop active_item_id, :any    # integer | string

  def render(assigns) do
    fields = assigns.columns
      |> Enum.map(&({Map.get(&1, :field), Map.get(&1, :type)}))

    ~F"""
    <table class="border-t border-goku-40">
      <thead>
        <tr class="divide-x divide-goku-40">
          {#for column <- @columns}
            <th class="px-6 py-4 text-left text-sm text-trunks-100 font-normal">
              {column.label}
            </th>
          {/for}
        </tr>
      </thead>
      <tbody>
        {#for {item, ind} <- @items |> Enum.with_index()}
          <tr {...get_row_attrs(item, ind, assigns)}>
            {#for {field, type} <- fields}
              <td class="px-6 py-4 whitespace-nowrap">
                {render_content(item[field], type, assigns)}
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
    is_active = "#{item.id}" == "#{assigns.active_item_id}"
    bg_color = if rem(ind, 2) != 0, do: "bg-gohan-100", else: "bg-goku-100"

    case {assigns.on_select, is_active} do
      {nil, _} -> %{
        class: "divide-x divide-goku-40 #{bg_color}"
      }

      {e, false} -> %{
        class: "cursor-pointer rounded hover:bg-goku-100 divide-x divide-goku-40 #{bg_color}",
        "phx-click": "#{e.name}:#{item.id}",
        "phx-target": e.target
      }

      {e, true} -> %{
        class: "cursor-pointer rounded bg-gohan-100 divide-x divide-goku-40",
        "phx-click": "#{e.name}:#{item.id}",
        "phx-target": e.target
      }
    end
  end

  # NOTE: assigns is required for ~F sigil to work
  defp render_content(value, type, assigns) do
    case type do
      :date ->
        ~F"""
        {value |> Timex.format!("%b %d, %Y", :strftime)}
        """

      :brand ->
        ~F"""
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
        """

      _ ->
        ~F"""
        {value}
        """
    end
  end
end
