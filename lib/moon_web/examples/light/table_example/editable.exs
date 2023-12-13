defmodule MoonWeb.Examples.Light.TableExample.Editable do
  @moduledoc false
  use Moon.Light.LiveComponent
  use MoonWeb, :example

  import Elixir.Moon.Light.Table

  attr(:models, :list,
    default:
      Enum.map(1..5, fn x ->
        %{id: x, name: "Name #{x}", created_at: DateTime.add(DateTime.utc_now(), -3600 + x)}
      end)
  )

  def render(assigns) do
    ~H"""
    <.table items={@models} selected={nil}>
      <:cols :let={model} name="id" label="ID">
        <.input value={model.id} />
      </:cols>
      <:cols :let={model} name="name" label="First Name">
        <.input value={model.name} />
      </:cols>
      <:cols :let={model} name="created_at" label="Created at">
        <.input value={Timex.format!(model.created_at, "%b %d, %Y, %H:%M:%S", :strftime)} />
      </:cols>
    </.table>
    """
  end
end
