defmodule Moon.Parts.Sidebar do
  @moduledoc false

  use Moon.StatelessComponent

  alias Moon.Design.Drawer
  alias __MODULE__

  @doc "Id attribute for DOM element"
  prop(id, :string)
  @doc "Data-testid attribute for DOM element"
  prop(testid, :string)
  @doc "Active page"
  prop(active_page, :module)
  @doc "Additional Tailwind classes"
  prop(class, :css_class)
  @doc "Additional Tailwind classes"
  prop(backdrop_class, :css_class)
  @doc "Additional Tailwind classes"
  prop(panel_class, :css_class)
  @doc "Additional Tailwind classes"
  prop(menu_class, :css_class)
  @doc "List of sections to be redered when no default slot is given"
  prop(sections, :list, default: [])
  @doc "Logo slot"
  slot(logo)
  @doc "Default slot"
  slot(default)

  def render(assigns) do
    ~F"""
    <Drawer
      {=@id}
      lg_persists
      class={merge(["lg:flex lg:start-0 lg:inset-y-0 lg:z-50 inset-auto", @class])}
      {=@testid}
    >
      <Drawer.Backdrop class={merge(["lg:hidden", @backdrop_class])} />
      <Drawer.Panel
        position="start"
        class={merge(["bg-goku shadow-none border-e", "w-[22.5rem]", @panel_class])}
      >
        <nav
          aria-label="Sidebar"
          class={merge(["h-screen pt-6 pb-5 lg:pb-20 flex flex-col gap-6 px-4 overflow-y-scroll", @menu_class])}
        >
          <#slot {@logo} />
          <#slot>
            <Sidebar.Section :for={section <- @sections} title={section[:title]} links={section[:links]} />
          </#slot>
        </nav>
      </Drawer.Panel>
    </Drawer>
    """
  end
end
