defmodule Moon.Parts.ModalWizard do
  @moduledoc false

  use Moon.StatefulComponent

  alias Moon.Components.Lego.Title
  alias Moon.Design.Modal

  alias Moon.Design.Tabs
  alias Moon.Design.Button

  alias Moon.Parts.Button

  import MoonWeb.Helpers.Lorem

  data(completed, :integer, default: 0)
  data(selected, :integer, default: 0)

  def render(assigns) do
    ~F"""
    <div>
      <Modal {=@id}>
        <Modal.Backdrop />
        <Modal.Panel class="max-w-[68.5rem] min-h-[43.5rem] rounded-[1.25rem] bg-goku theme-moon-dark flex relative">
          <div class="pt-8 px-6 flex flex-col gap-4 w-1/3 max-w-[22.75rem]">
            <h3 class="text-moon-24 text-bulma font-grotesk">Title
            </h3>
            <p class="text-moon-14 text-bulma hidden lg:inline">In order to make you available and match you with the right opportunities we need some additional information first.</p>
          </div>
          <div class="theme-moon-light bg-goku text-bulma rounded-2xl w-2/3 max-w-[45.5rem] min-h-[43rem] m-1 absolute bottom-0 end-0">
            <div class="absolute w-full p-8 flex justify-between bottom-0">
              <Button.White class="min-w-[7.5rem]" on_click="close" >Cancel</Button.White>
              <div class="flex flex-col lg:flex-row gap-2">
                <Button.White
                  class="min-w-[7.5rem]"
                  on_click="prev_page"
                  value={@selected - 1}
                  disabled={@selected == 0}
                >Previous</Button.White>
                <Button
                  class="min-w-[7.5rem]"
                  on_click="next_page"
                  value={@selected + 1}
                  disabled={@completed == 3}
                >Next</Button>
              </div>
            </div>
          </div>

          <div class="absolute h-[36rem]">
            <Tabs id="tabs-wizzard" class="flex-row">
              <Tabs.List
                class="flex-col overflow-hidden items-left w-[19.5rem] mt-[11.5rem] mx-6"
                tab_module={Tabs.Step}
                selected={@selected}
              >
                <Tabs.Step class="pb-[7.3rem] text-bulma" is_completed={@completed > 0}>First Step</Tabs.Step>
                <Tabs.Step class="pb-[7.3rem] text-bulma" is_completed={@completed > 1}>Second Step</Tabs.Step>
                <Tabs.Step class="pb-[7.3rem] text-bulma" is_completed={@completed > 2}>Third Step</Tabs.Step>
              </Tabs.List>
              <Tabs.Panels class="mx-6 my-10 w-[41.5rem] h-[33.5rem]" selected={@selected}>
                <Tabs.Panel>{lorem()}</Tabs.Panel>
                <Tabs.Panel>{ipsum()}</Tabs.Panel>
                <Tabs.Panel>{dolor()}</Tabs.Panel>
              </Tabs.Panels>
            </Tabs>
          </div>
        </Modal.Panel>
      </Modal>
    </div>
    """
  end

  def handle_event("next_page", params = %{"value" => tabindex}, socket) do
    dbg(params)

    {:noreply,
     assign(socket, completed: String.to_integer(tabindex), selected: String.to_integer(tabindex))}
  end

  def handle_event("prev_page", %{"value" => tabindex}, socket) do
    {:noreply,
     assign(socket, completed: String.to_integer(tabindex), selected: String.to_integer(tabindex))}
  end
end
