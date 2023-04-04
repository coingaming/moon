defmodule MoonWeb.Examples.Design.BottomSheetExample.CustomHeight do
  @moduledoc false

  use Moon.StatefulComponent
  use MoonWeb, :example

  alias Moon.Design.Button
  alias Moon.Design.BottomSheet

  alias Moon.Design.Table
  alias Moon.Components.Table.Column
  alias Moon.Components.Renderers.Datetime

  def render(assigns) do
    ~F"""
    <div>
      <Button on_click="set_open">Initialize uncloaking</Button>
      <BottomSheet id="custom_height_bottom_sheet">
        <BottomSheet.Backdrop />
        <BottomSheet.Panel class="h-[77%]">
          <BottomSheet.Draghandle>
            <BottomSheet.Title class="text-center">
              I am gonna show you some data whether you like it or not!
            </BottomSheet.Title>
          </BottomSheet.Draghandle>
          <div class="p-2">
            <!--<Table items={model <- @models_5} selected={nil}>
              <Column name="id" label="ID">
                {model.id}
              </Column>
              <Column name="name" label="Name">
                {model.name}
              </Column>
              <Column name="created_at" label="Created at">
                <Datetime value={model.created_at} />
              </Column>
            </Table>-->
          </div>
          <div class="p-2">
            <Button on_click="set_close" variant="ghost" full_width>
              I don't wanna see this
            </Button>
          </div>
        </BottomSheet.Panel>
      </BottomSheet>
    </div>
    """
  end

  def handle_event("set_open", _, socket) do
    BottomSheet.open("custom_height_bottom_sheet")
    {:noreply, socket}
  end

  def handle_event("set_close", _, socket) do
    BottomSheet.close("custom_height_bottom_sheet")
    {:noreply, socket}
  end

  def handle_params(_params, uri, socket) do
    {:noreply, assign(socket, uri: uri)}
  end

  def mount(_params, _session, socket) do
    now = DateTime.utc_now()

    all_models =
      Enum.map(1..100, fn x ->
        %{id: x, name: "Name #{x}", created_at: DateTime.add(now, -3600 + x)}
      end)

    socket =
      assign(socket,
        all_models: all_models,
        models_5: all_models |> Enum.slice(0, 5),
        limit: 10,
        offset: 0,
        selected: []
      )
      |> refresh_models()

    {:ok, socket}
  end

  def refresh_models(socket) do
    %{
      limit: limit,
      offset: offset,
      all_models: all_models
    } = socket.assigns

    models =
      all_models
      |> Enum.slice(offset..(offset + limit - 1))

    assign(socket, models: models)
  end

  def code() do
    """

    """
  end
end
