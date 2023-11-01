defmodule MoonWeb.Examples.Design.BottomSheetExample.Custom do
  @moduledoc false

  use Ecto.Schema
  import Ecto.Changeset
  import MoonWeb.Gettext, only: [gettext: 1]

  embedded_schema do
    field(:date_from, :date)
    field(:date_to, :date)
  end

  @required_params ~w(date_from date_to)a

  def create_changeset(params) do
    %__MODULE__{}
    |> cast(params, @required_params)
    |> validate_required(@required_params, message: gettext("can't be blank"))
    |> validate_range()
  end

  defp validate_range(changeset) do
    date_from = get_field(changeset, :date_from)
    date_to = get_field(changeset, :date_to)

    cond do
      is_nil(date_from) or is_nil(date_to) ->
        changeset

      Timex.compare(date_from, date_to) == 1 ->
        add_error(
          changeset,
          :date_to,
          gettext("lower bound must be less than upper bound or equal")
        )

      true ->
        changeset
    end
  end
end

defmodule MoonWeb.Examples.Design.BottomSheetExample.CustomBottomSheet do
  @moduledoc false

  use Moon.StatefulComponent
  use MoonWeb, :example

  alias Moon.Autolayouts.TopToDown
  alias Moon.Design.BottomSheet
  alias Moon.Design.Button
  alias Moon.Design.Form

  alias MoonWeb.Examples.Design.BottomSheetExample.Custom

  prop(is_open, :boolean, default: false)
  data(changeset, :any)

  def render(assigns) do
    form_id = "#{assigns.id}-form"

    ~F"""
    <div>
      <Button on_click="open">Open</Button>
      <BottomSheet id="custom-date-selector" {=@is_open} class="z-50 overflow-auto" size="md">
        <BottomSheet.Panel class="h-fit divide-y">
          <BottomSheet.Header>
            <BottomSheet.DragHandle />
            <div id={"#{@id}-header"} class="flex flex-row items-center gap-4 p-2">
              <Button.IconButton
                id={"#{@id}-header-button"}
                class="bg-none"
                icon="controls_chevron_left_small"
                variant="none"
                on_click="close"
                target={form_id}
              />
              <div class="grow pe-10 text-center font-semibold text-moon-16">
                {"Custom date range"}
              </div>
            </div>
          </BottomSheet.Header>
          <TopToDown gap="gap-4" class="px-6 pt-4 pb-4">
            <Form id={form_id} for={@changeset} change="update_selected" target={@myself} submit="apply">
              <TopToDown gap="gap-4">
                <Form.Field label="label.start-date" field={:date_from} class="flex flex-col gap-2">
                  <Form.Input size="lg" type="date" class="text-trunks" />
                </Form.Field>
                <Form.Field label="label.end-date" field={:date_to} class="flex flex-col gap-2">
                  <Form.Input size="lg" type="date" class="text-trunks" />
                </Form.Field>
              </TopToDown>
            </Form>
            <Button
              id={"#{form_id}-confirm"}
              type="submit"
              class="rounded-full rounded-moon-s-xx"
              on_click="apply"
            >Apply</Button>
          </TopToDown>
        </BottomSheet.Panel>
        <BottomSheet.Backdrop />
      </BottomSheet>
    </div>
    """
  end

  def mount(socket) do
    changeset = Custom.create_changeset(%{})
    socket = assign(socket, changeset: changeset)

    {:ok, socket}
  end

  def handle_event("close", _params, socket) do
    Moon.Design.BottomSheet.close("custom-date-selector")
    {:noreply, assign(socket, is_open: false)}
  end

  def handle_event("open", _params, socket) do
    Moon.Design.BottomSheet.open("custom-date-selector")
    {:noreply, assign(socket, is_open: true)}
  end

  def handle_event("update_selected", %{"custom" => params}, socket) do
    changeset = Custom.create_changeset(params)

    {:noreply, assign(socket, changeset: changeset)}
  end

  def handle_event("apply", _params, socket) do
    changeset = Map.merge(socket.assigns.changeset, %{action: :insert})

    socket =
      if changeset.valid? do
        params = %{value: "custom", dates: Ecto.Changeset.apply_changes(changeset)}
        send(self(), {:updated_date_filter, params})
        assign(socket, is_open: false)
      else
        assign(socket, is_open: true, changeset: changeset)
      end

    {:noreply, socket}
  end
end
