defmodule MoonWeb.Examples.Parts.ModalExample.WithForm2 do
  use Moon.StatefulComponent

  alias Moon.Design.Tabs
  alias Moon.Design.Form
  alias Moon.Design.Form.{Field, Input, Dropdown, Checkbox}
  alias Moon.Parts.{Wizard, Modal}

  defmodule Flow do
    use Ecto.Schema
    import Ecto.Changeset

    @primary_key false

    @required_fields [:flow_name, :merchant_name, :provider_name]

    embedded_schema do
      field(:flow_name, :string)
      field(:merchant_name, :string)
      field(:provider_name, :string)
      field(:verification_types, {:array, :string})
    end

    def changeset(params) do
      changeset(%__MODULE__{}, params)
    end

    def changeset(form, params) do
      form
      |> cast(params, @required_fields)
    end
  end

  def render(assigns) do
    ~F"""
    <div class={unless @show, do: "hidden"}>
      {#if @show}
        <Modal id="modal_wizard" on_close="on_modal_close" class="p-1 bg-bulma">
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
                <Form for={@form} is_horizontal change="on_form_change" target={@myself}>
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
      {/if}
    </div>
    """
  end

  def mount(socket) do
    Moon.Parts.Modal.open("modal_wizard")

    steps = list_flow_steps()

    merchant_names = [%{key: "Merchant1", value: "Marchant1"}]

    verification_types = list_verification_types()

    socket
    |> assign(:steps, steps)
    |> assign(:merchant_names, merchant_names)
    |> assign(:provider_names, [])
    |> assign(:get_merchants_response, [%{name: "Merchant1"}])
    |> assign(:verification_types, verification_types)
    |> assign(:form, Flow.changeset(%{}))

    {:ok, socket}
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
    Modal.open("modal_wizard")

    flow_name = get_in(params, ["flow", "flow_name"])
    form = Flow.changeset(socket.assigns.form, %{flow_name: flow_name})

    socket =
      socket
      |> assign(:form, form)

    {:noreply, socket}
  end

  def handle_event("on_form_change", %{"_target" => ["flow", "merchant_name"]} = params, socket) do
    Modal.open("modal_wizard")

    merchant_name = get_in(params, ["flow", "merchant_name"])
    provider_names = list_provider_names(socket.assigns.get_merchants_response, merchant_name)
    form = Flow.changeset(socket.assigns.form, %{merchant_name: merchant_name})

    socket =
      socket
      |> assign(:form, form)
      |> assign(:provider_names, provider_names)

    {:noreply, socket}
  end

  def handle_event("on_form_change", %{"_target" => ["flow", "provider_name"]} = params, socket) do
    Modal.open("modal_wizard")

    provider_name = get_in(params, ["flow", "provider_name"])
    form = Flow.changeset(socket.assigns.form, %{provider_name: provider_name})

    socket =
      socket
      |> assign(:form, form)

    {:noreply, socket}
  end

  def handle_event(
        "on_form_change",
        %{"_target" => ["flow", "verification_types"]} = params,
        socket
      ) do
    Modal.open("modal_wizard")

    verification_types = get_in(params, ["flow", "verification_types"])
    form = Flow.changeset(socket.assigns.form, %{verification_types: verification_types})

    socket =
      socket
      |> assign(:form, form)

    {:noreply, socket}
  end

  defp list_provider_names(get_merchants_response, merchant_name) do
    merchant =
      get_merchants_response
      |> Enum.find(fn merchant -> merchant.name == merchant_name end)

    merchant.providers
    |> Enum.map(fn provider -> %{key: provider["name"], value: provider["name"]} end)
  end

  defp error_response(_socket) do
    # Handle error
  end
end
