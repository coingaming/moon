defmodule MoonWeb.Examples.Design.TabsExample.Wizard do
  @moduledoc false

  use Moon.StatefulComponent
  use MoonWeb, :example

  alias Moon.Design.Tabs
  alias Moon.Design.Button

  alias Moon.Parts.Wizard

  import MoonWeb.Helpers.Lorem

  data(completed, :integer, default: 0)
  data(selected, :integer, default: 0)

  def render(assigns) do
    ~F"""
    <div class="relative w-full">
      <Tabs id="tabs-wizzard" class="flex-row mb-10 flex-nowrap">
        <Tabs.List
          class="flex flex-col overflow-hidden items-start w-1/3 mt-10 px-6"
          selected={@selected}
        >
          <Wizard.Step>First Step</Wizard.Step>
          <Wizard.Step>Second Step</Wizard.Step>
          <Wizard.Step>Third Step</Wizard.Step>
        </Tabs.List>
        <Tabs.Panels class="p-4 w-3/4 align-baseline" selected={@selected}>
          <Tabs.Panel>{lorem()}</Tabs.Panel>
          <Tabs.Panel>{ipsum()}</Tabs.Panel>
          <Tabs.Panel>{dolor()}</Tabs.Panel>
          <Tabs.Panel>All steps completed!</Tabs.Panel>
        </Tabs.Panels>
      </Tabs>
      <div class="absolute w-full flex justify-end bottom-0 gap-2">
        <Button
          on_click="prev_page"
          variant="ghost"
          values={selected: @selected, completed: @completed}
          disabled={@selected == 0}
        >Previous</Button>
        <Button
          :if={@selected <= 2}
          on_click="next_page"
          values={selected: @selected, completed: @completed}
        >Next</Button>
        <Button :if={@completed > 2 && @selected > 2}>Save</Button>
      </div>
    </div>
    """
  end

  def handle_event("next_page", %{"selected" => selected, "completed" => completed}, socket) do
    tab_count = 3

    selected =
      if String.to_integer(selected) >= tab_count,
        do: String.to_integer(selected),
        else: String.to_integer(selected) + 1

    completed =
      if String.to_integer(completed) >= tab_count,
        do: String.to_integer(completed),
        else: String.to_integer(completed) + 1

    {:noreply, assign(socket, completed: completed, selected: selected)}
  end

  def handle_event("prev_page", %{"selected" => selected}, socket) do
    selected = String.to_integer(selected) - 1
    {:noreply, assign(socket, selected: selected)}
  end

  def code() do
    """
    alias Moon.Design.Tabs
    alias Moon.Design.Button

    alias Moon.Parts.Wizard

    import MoonWeb.Helpers.Lorem

    data(completed, :integer, default: 0)
    data(selected, :integer, default: 0)

    def render(assigns) do
      ~F\"""
      <div class="relative w-full">
        <Tabs id="tabs-wizzard" class="flex-row mb-10">
          <Tabs.List
            class="flex flex-col overflow-hidden items-start w-1/3 mt-10 px-6"
            selected={@selected}
          >
            <Wizard.Step>First Step</Wizard.Step>
            <Wizard.Step>Second Step</Wizard.Step>
            <Wizard.Step>Third Step</Wizard.Step>
          </Tabs.List>
          <Tabs.Panels class="p-4 w-3/4 align-baseline" selected={@selected}>
            <Tabs.Panel>{lorem()}</Tabs.Panel>
            <Tabs.Panel>{ipsum()}</Tabs.Panel>
            <Tabs.Panel>{dolor()}</Tabs.Panel>
            <Tabs.Panel>All steps completed!</Tabs.Panel>
          </Tabs.Panels>
        </Tabs>
        <div class="absolute w-full flex justify-end bottom-0 gap-2">
          <Button
            on_click="prev_page"
            variant="ghost"
            values={selected: @selected, completed: @completed}
            disabled={@selected == 0}
          >Previous</Button>
          <Button
            :if={@selected <= 2}
            on_click="next_page"
            values={selected: @selected, completed: @completed}
          >Next</Button>
          <Button :if={@completed > 2 && @selected > 2}>Save</Button>
        </div>
      </div>
      \"""
    end

    def handle_event("next_page", %{"selected" => selected, "completed" => completed}, socket) do
      tab_count = 3

      selected =
        if String.to_integer(selected) >= tab_count,
          do: String.to_integer(selected),
          else: String.to_integer(selected) + 1

      completed =
        if String.to_integer(completed) >= tab_count,
          do: String.to_integer(completed),
          else: String.to_integer(completed) + 1

      {:noreply, assign(socket, completed: completed, selected: selected)}
    end

    def handle_event("prev_page", %{"selected" => selected}, socket) do
      selected = String.to_integer(selected) - 1
      {:noreply, assign(socket, selected: selected)}
    end
    """
  end
end
