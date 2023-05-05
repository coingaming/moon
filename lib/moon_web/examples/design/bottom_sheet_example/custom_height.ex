defmodule MoonWeb.Examples.Design.BottomSheetExample.CustomHeight do
  @moduledoc false

  use Moon.StatefulComponent
  use MoonWeb, :example

  alias Moon.Design.Button
  alias Moon.Design.BottomSheet

  alias Moon.Design.Table
  alias Moon.Design.Table.Column
  alias Moon.Components.Renderers.Datetime

  data(models, :list,
    default:
      Enum.map(1..5, fn x ->
        %{
          id: x,
          first_name: "First Name #{x}",
          last_name: "Last Name #{x}",
          status: "Status #{x}",
          created_at: DateTime.add(DateTime.utc_now(), -3600 + x)
        }
      end)
  )

  def render(assigns) do
    ~F"""
    <div>
      <Button on_click="set_open">Initialize uncloaking</Button>
      <BottomSheet id="custom_height_bottom_sheet">
        <BottomSheet.Backdrop />
        <BottomSheet.Panel class="h-[77%]">
          <BottomSheet.Header class="border-b-2 border-beerus">
            <BottomSheet.DragHandle />
            <h3 class="text-moon-18 text-bulma font-medium text-center pt-4">
              I am gonna show you some data whether you like it or not!</h3>
          </BottomSheet.Header>
          <div class="p-2 bg-goku mt-2">
            <Table items={model <- @models} selected={nil}>
              <Column name="id" label="ID">
                {model.id}
              </Column>
              <Column name="first_name" label="First Name">
                {model.first_name}
              </Column>
              <Column name="last_name" label="Last Name">
                {model.last_name}
              </Column>
              <Column name="status" label="Status">
                {model.status}
              </Column>
              <Column name="created_at" label="Created at" class="hidden sm:table-cell">
                <Datetime value={model.created_at} />
              </Column>
            </Table>
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

  def code() do
    """
    alias Moon.Design.Button
    alias Moon.Design.BottomSheet

    alias Moon.Design.Table
    alias Moon.Design.Table.Column
    alias Moon.Components.Renderers.Datetime

    data(models, :list,
      default:
        Enum.map(1..5, fn x ->
          %{
            id: x,
            first_name: "First Name #\{x}",
            last_name: "Last Name #\{x}",
            status: "Status #\{x}",
            created_at: DateTime.add(DateTime.utc_now(), -3600 + x)
          }
        end)
    )

    def render(assigns) do
      ~F\"""
      <div>
        <Button on_click="set_open">Initialize uncloaking</Button>
        <BottomSheet id="custom_height_bottom_sheet">
          <BottomSheet.Backdrop />
          <BottomSheet.Panel class="h-[77%]">
            <BottomSheet.Header class="border-b-2 border-beerus">
              <BottomSheet.DragHandle />
              <h3 class="text-moon-18 text-bulma font-medium text-center pt-4">
                I am gonna show you some data whether you like it or not!</h3>
            </BottomSheet.Header>
            <div class="p-2 bg-goku mt-2">
              <Table items={model <- @models} selected={nil}>
                <Column name="id" label="ID">
                  {model.id}
                </Column>
                <Column name="first_name" label="First Name">
                  {model.first_name}
                </Column>
                <Column name="last_name" label="Last Name">
                  {model.last_name}
                </Column>
                <Column name="status" label="Status">
                  {model.status}
                </Column>
                <Column name="created_at" label="Created at" class="hidden sm:table-cell">
                  <Datetime value={model.created_at} />
                </Column>
              </Table>
            </div>
            <div class="p-2">
              <Button on_click="set_close" variant="ghost" full_width>
                I don't wanna see this
              </Button>
            </div>
          </BottomSheet.Panel>
        </BottomSheet>
      </div>
      \"""
    end

    def handle_event("set_open", _, socket) do
      BottomSheet.open("custom_height_bottom_sheet")
      {:noreply, socket}
    end

    def handle_event("set_close", _, socket) do
      BottomSheet.close("custom_height_bottom_sheet")
      {:noreply, socket}
    end
    """
  end
end
