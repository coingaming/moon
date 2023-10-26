defmodule MoonWeb.Examples.Parts.WizardExample.Default do
  @moduledoc false

  use Moon.StatefulComponent
  use MoonWeb, :example

  alias Moon.Parts.Wizard
  alias Moon.Design.Tabs

  import MoonWeb.Helpers.Lorem

  data(selected, :integer, default: 0)
  data(done, :boolean, default: false)

  def render(assigns) do
    ~F"""
    <div class="relative w-full">
      <Wizard
        id="tabs-wizzard"
        class={"bg-roshi": @done}
        steps={[
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
        ]}
      >
        <Tabs.Panels class="px-6 w-2/3 min-h-[33.5rem] bg-goku rounded-moon-s-lg">
          <Tabs.Panel>{lorem()}</Tabs.Panel>
          <Tabs.Panel>{ipsum()}</Tabs.Panel>
          <Tabs.Panel>{dolor()}</Tabs.Panel>
        </Tabs.Panels>
        <Wizard.Buttons on_save="mark_done" on_cancel="mark_done" />
      </Wizard>
    </div>
    """
  end

  def handle_event("mark_done", _, socket) do
    {:noreply, assign(socket, done: true)}
  end

  def code() do
    """
    """
  end
end
