defmodule Moon.Parts.ModalWizard do
  @moduledoc false

  use Moon.StatefulComponent

  alias Moon.Design.Modal

  alias Moon.Parts.ModalWizard
  alias Moon.Design.Tabs

  import MoonWeb.Helpers.Lorem

  @doc "Title slot"
  slot(title)
  @doc "Description slot"
  slot(description)
  @doc "Close button slot"
  slot(close_button)
  @doc "Cancel button slot"
  slot(cancel_button)
  @doc "Previous button slot"
  slot(prev_button)
  @doc "Next button slot"
  slot(next_button)

  data(completed, :integer, default: 0)
  data(selected, :integer, default: 0)

  def render(assigns) do
    ~F"""
    <div>
      <Modal {=@id}>
        <Modal.Backdrop />
        <ModalWizard.Panel class="max-w-[68.5rem] min-h-[43.5rem] rounded-[1.25rem] bg-goku theme-moon-dark flex relative">
          <div class="pt-8 px-6 flex flex-col gap-4 w-1/3 max-w-[22.75rem]">
            <#slot {@title} />
            <#slot {@description} />
          </div>
          <div class="theme-moon-light bg-goku text-bulma rounded-2xl w-2/3 max-w-[45.5rem] min-h-[43rem] m-1 absolute bottom-0 end-0">
            <#slot {@close_button} />
            <div class="absolute w-full p-8 flex justify-between bottom-0 border-t border-beerus">
              <#slot {@cancel_button} />
              <div class="flex flex-col lg:flex-row gap-2">
                <#slot {@prev_button} />
                <#slot {@next_button} />
              </div>
            </div>
          </div>

          <div class="absolute min-h-[36rem] w-full">
            <Tabs id="tabs-wizzard" class="flex-row">
              <Tabs.List
                class="flex-col overflow-hidden items-left w-1/3 mt-[11.5rem] px-6"
                tab_module={Tabs.Step}
                selected={@selected}
              >
                <Tabs.Step
                  class="pb-[7.3rem]"
                  title_class="gap-2 ml-6 items-start"
                  selected_class="text-roshi"
                  icon_bg_class="bg-goku"
                  is_completed={@completed > 0}
                >
                  <span class="text-moon-14 text-bulma text-medium">First Step</span>
                  <p class="text-moon-14 text-bulma text-start lg:inline hidden">In order to make you available and match you with the right opportunities we need some additional informati.</p>
                </Tabs.Step>
                <Tabs.Step
                  class="pb-[7.3rem]"
                  title_class="gap-2 ml-6 items-start"
                  selected_class="text-roshi"
                  icon_bg_class="bg-goku"
                  is_completed={@completed > 1}
                >Second Step</Tabs.Step>
                <Tabs.Step
                  class="pb-[7.3rem]"
                  title_class="gap-2 ml-6 items-start"
                  selected_class="text-roshi"
                  icon_bg_class="bg-goku"
                  is_completed={@completed > 2}
                >Third Step</Tabs.Step>
              </Tabs.List>
              <Tabs.Panels class="px-6 w-2/3 min-h-[33.5rem]" selected={@selected}>
                <Tabs.Panel>{lorem()}</Tabs.Panel>
                <Tabs.Panel>{ipsum()}</Tabs.Panel>
                <Tabs.Panel>{dolor()}</Tabs.Panel>
              </Tabs.Panels>
            </Tabs>
          </div>
        </ModalWizard.Panel>
      </Modal>
    </div>
    """
  end
end
