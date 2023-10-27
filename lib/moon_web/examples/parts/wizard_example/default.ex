defmodule MoonWeb.Examples.Parts.WizardExample.Default do
  @moduledoc false

  use Moon.StatefulComponent
  use MoonWeb, :example

  alias Moon.Parts.Wizard
  alias Moon.Design.Tabs

  import MoonWeb.Helpers.Lorem

  data(selected, :integer, default: 0)
  data(done, :boolean, default: false)

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
    <div class="relative w-full">
      <Wizard id="tabs-wizzard" class={"", "bg-roshi": @done} {=@steps}>
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
