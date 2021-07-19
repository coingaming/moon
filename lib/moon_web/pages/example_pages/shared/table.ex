defmodule MoonWeb.Pages.ExamplePages.Shared.Table do
  use Moon.StatelessComponent

  prop columns, :list          # [%{ field: :id, label: 'Id' }...]
  prop items, :list            # [%{ id: 12, name: 'pavan', brand: 'aposta10' }...]

  prop on_select, :event
  prop active_item_id, :any    # integer | string

  def render(assigns) do
    fields = assigns.columns |> Enum.map(&(&1.field))

    ~F"""
    <table class="table-auto moon-table">
      <thead>
        {#for column <- @columns}
          <th>{column.label}</th>
        {/for}
      </thead>
      <tbody>
        {#for {item, ind} <- @items |> Enum.with_index()}
          <tr {...get_row_attrs(item, ind, assigns)}>
            {#for field <- fields}
              <td>{item[field]}</td>
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
    bg_color = "#{rem(ind, 2) != 0 && "bg-gohan-100"}"

    case {assigns.on_select, is_active} do
      {nil, _} -> %{
        class: bg_color
      }

      {e, false} -> %{
        class: "cursor-pointer rounded hover:bg-beerus-100 #{bg_color}",
        "phx-click": "#{e.name}:#{item.id}",
        "phx-target": e.target
      }

      {e, true} -> %{
        class: "cursor-pointer rounded border border-hit-120 bg-beerus-100 border-collapse",
        "phx-click": "#{e.name}:#{item.id}",
        "phx-target": e.target
      }
    end
  end
end
