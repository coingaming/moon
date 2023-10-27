defmodule MoonWeb.Examples.Parts.ModalExample.Wizard do
  @moduledoc false

  use Moon.StatefulComponent
  use MoonWeb, :example

  alias Moon.Parts.{Wizard, Modal}
  alias Moon.Design.{Tabs, Button}

  import MoonWeb.Helpers.Lorem

  data(selected, :integer, default: 0)

  data(steps, :list,
    default: [
      %{
        title: "General",
        text:
          "In order to make you available and match you with the right opportunities we need some additional information."
      },
      %{
        title: "Configuration",
        text:
          "In order to make you available and match you with the right opportunities we need some additional information."
      },
      %{
        title: "Permissions",
        text:
          "In order to make you available and match you with the right opportunities we need some additional information."
      }
    ]
  )

  def render(assigns) do
    ~F"""
    <div>
      <Button on_click="set_open">Open modal</Button>

      <Modal id="modal_wizard" on_close="set_close" class="p-1 bg-bulma">
        <Wizard id="tabs-wizzard" {=@steps}>
          <:description>
            <div class="py-8 flex flex-col gap-4 w-full">
              <h3 class="text-moon-24 text-bulma font-grotesk">Create new flow</h3>
              <p class="text-moon-14 text-bulma hidden lg:inline">
                In order to make you available and match you with the right opportunities we need some additional information first.
              </p>
            </div>
          </:description>
          <Wizard.Panels>
            <Tabs.Panel>{lorem()}</Tabs.Panel>
            <Tabs.Panel>{ipsum()}</Tabs.Panel>
            <Tabs.Panel>{dolor()}</Tabs.Panel>
          </Wizard.Panels>
          <Wizard.Buttons on_save="set_close" on_cancel="set_close" />
        </Wizard>
      </Modal>
    </div>
    """
  end

  def handle_event("set_open", _, socket) do
    Modal.open("modal_wizard")
    {:noreply, socket}
  end

  def handle_event("set_close", _, socket) do
    Modal.close("modal_wizard")
    {:noreply, socket}
  end

  def code() do
    """
    """
  end
end
