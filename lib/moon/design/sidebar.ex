defmodule Moon.Design.Sidebar do
  use Moon.StatefulComponent

  alias Moon.Design.Drawer
  data(is_open, :boolean, default: true) # TODO this is copy from MoonWeb but seems hacky
  prop(toggle_is_collapsed, :event)
  prop(is_collapsed, :boolean, default: true)
  slot(top)
  slot(menu)
  slot(bottom)

  def render(assigns) do
    ~F"""
    <div>
      <Drawer lg_persists id={@id <> "-drawer"} class={"lg:flex lg:start-0 lg:inset-y-0 lg:z-50", "lg:w-[280px]": !@is_collapsed}>
        <Drawer.Backdrop class="lg:hidden" />
        <Drawer.Panel position="start" class={"h-screen bg-gohan shadow-moon-none w-auto sidebar-panel", "w-[280px]": !@is_collapsed}>
          <div :on-click={@toggle_is_collapsed} class="rounded-full shadow-md absolute -right-3 top-6 bg-inherit w-6 h-6 cursor-pointer sidebar-panel-chevron">
            <div class="grid place-content-center	w-6 h-6">
              <Moon.Icon name="controls-chevron-left" class={"rotate-180": @is_collapsed} />
            </div>
          </div>
          <nav aria-label="Sidebar" class="flex flex-col flex-grow gap-6">
            <div class="grow-0 pt-6 pl-4 pr-4">
              <div class="flex gap-2">
                <#slot {@top, is_collapsed: @is_collapsed} />
              </div>
            </div>
            <div class="grow overflow-y-auto">
              <#slot {@menu, is_collapsed: @is_collapsed} />
            </div>
            <div class="grow-0 absolute left-0 bottom-0 right-0 p-4 bg-inherit">
              <#slot {@bottom, is_collapsed: @is_collapsed} />
            </div>
          </nav>
        </Drawer.Panel>
      </Drawer>
    </div>
    """
  end
end
