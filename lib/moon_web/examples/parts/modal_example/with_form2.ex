defmodule MoonWeb.Examples.Parts.ModalExample.WithForm2 do
  use Moon.StatefulComponent

  alias Moon.Design.Tabs
  alias Moon.Design.Form
  alias Moon.Design.Form.{Field, Input, Dropdown, Checkbox}
  alias Moon.Parts.{Wizard, Modal}
  alias Moon.Design.Button

  alias MoonWeb.Schema.Flow

  prop(is_open, :boolean, default: false)
  data(changeset, :any, default: Flow.changeset(%{}))

  def render(assigns) do
    form_id = "#{assigns.id}-form"

    ~F"""
    <div>
      <Button on_click="set_open">Open</Button>
      <Modal id="modal_form" on_close="set_close" {=@is_open} class="p-1 bg-bulma">
        <Wizard id="tabs-wizard" {=@steps}>
          <:description>
            <div class="py-8 flex flex-col gap-4 w-full">
              <h3 class="text-moon-24 text-bulma font-grotesk">Create new flow</h3>
              <p class="text-moon-14 text-bulma hidden lg:inline">
                Set up a new KYC flow.
              </p>
            </div>
          </:description>
          <Wizard.Panels>
            <Tabs.Panel>
              <Form
                id={form_id}
                is_horizontal
                change="on_form_change"
                for={@changeset}
                target={@myself}
                submit="apply"
              >
                <Field class="flex justify-between" field={:flow_name} label="Flow name">
                  <Input size="lg" />
                </Field>
                <Field class="flex justify-between" field={:merchant_name} label="Merchant name">
                  <Dropdown id="merchant_dropdown" size="lg" options={@merchant_names} prompt="Select merchant" />
                </Field>
                <Field class="flex justify-between" field={:provider_name} label="Provider name">
                  <Dropdown id="provider_dropdown" size="lg" options={@provider_names} prompt="Select provider" />
                </Field>
                <Field class="flex justify-between" field={:verification_types} label="Verification types">
                  <Checkbox
                    :for={verification_type <- @verification_types}
                    label={verification_type.key}
                    hidden_input={false}
                    checked_value={verification_type.value}
                    is_multiple
                  />
                </Field>
              </Form>
            </Tabs.Panel>
            <Tabs.Panel />
          </Wizard.Panels>
          <Wizard.Buttons />
        </Wizard>
      </Modal>
    </div>
    """
  end

  def handle_event("set_open", _, socket) do
    Modal.open("modal_form")
    {:noreply, assign(socket, is_open: true)}
  end

  def handle_event("set_close", _, socket) do
    Modal.close("modal_form")
    {:noreply, assign(socket, is_open: false)}
  end

  def mount(socket) do
    steps = list_flow_steps()

    merchant_names = [
      %{key: "Merchant1", value: "Merchant1"},
      %{key: "Merchant2", value: "Merchant2"}
    ]

    verification_types = list_verification_types()

    {:ok,
     socket
     |> assign(:steps, steps)
     |> assign(:merchant_names, merchant_names)
     |> assign(:provider_names, [])
     |> assign(:get_merchants_response, [
       %{name: "Merchant1", providers: [%{name: "Provider1"}]},
       %{name: "Merchant2", providers: [%{name: "Provider"}]}
     ])
     |> assign(:verification_types, verification_types)
     |> assign(:form, Flow.changeset(%{}))}
  end

  defp list_flow_steps() do
    [
      %{
        title: "General",
        text: "Basic information about the flow."
      },
      %{
        title: "Details",
        text: "We require some additional information based on the provider you choose."
      }
    ]
  end

  defp list_verification_types() do
    [
      %{
        key: "ID",
        value: "id"
      },
      %{
        key: "Selfie",
        value: "selfie"
      },
      %{
        key: "POA",
        value: "poa"
      },
      %{
        key: "Liveness",
        value: "liveness"
      }
    ]
  end

  def handle_event("on_form_change", %{"_target" => ["flow", "flow_name"]} = params, socket) do
    # Modal.open("modal_form")

    flow_name = get_in(params, ["flow", "flow_name"])
    form = Flow.changeset(socket.assigns.form, %{flow_name: flow_name})

    socket =
      socket
      |> assign(:form, form)

    {:noreply, socket}
  end

  def handle_event("on_form_change", %{"_target" => ["flow", "merchant_name"]} = params, socket) do
    # Modal.open("modal_form")

    merchant_name = get_in(params, ["flow", "merchant_name"])
    provider_names = list_provider_names(socket.assigns.get_merchants_response, merchant_name)
    form = Flow.changeset(socket.assigns.form, %{merchant_name: merchant_name})

    socket =
      socket
      |> assign(:form, form)
      |> assign(:provider_names, provider_names)
      |> assign(is_open: true)

    {:noreply, socket}
  end

  def handle_event("on_form_change", %{"_target" => ["flow", "provider_name"]} = params, socket) do
    # Modal.open("modal_form")

    provider_name = get_in(params, ["flow", "provider_name"])
    form = Flow.changeset(socket.assigns.form, %{provider_name: provider_name})

    socket =
      socket
      |> assign(:form, form)
      |> assign(is_open: true)

    {:noreply, socket}
  end

  def handle_event(
        "on_form_change",
        %{"_target" => ["flow", "verification_types"]} = params,
        socket
      ) do
    # Modal.open("modal_form")

    verification_types = get_in(params, ["flow", "verification_types"])
    form = Flow.changeset(socket.assigns.form, %{verification_types: verification_types})

    socket =
      socket
      |> assign(:form, form)
      |> assign(is_open: true)

    {:noreply, socket}
  end

  defp list_provider_names(get_merchants_response, merchant_name) do
    merchant =
      get_merchants_response
      |> Enum.find(fn merchant -> merchant.name == merchant_name end)

    merchant.providers
    |> Enum.map(fn provider -> %{key: provider["name"], value: provider["name"]} end)
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
