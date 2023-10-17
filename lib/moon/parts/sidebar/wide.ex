defmodule Moon.Parts.Sidebar.Wide do
  @moduledoc false

  use Moon.StatelessComponent

  alias Moon.Design.Drawer
  alias Moon.Parts.Sidebar

  @doc "Id attribute for DOM element"
  prop(id, :string)
  @doc "Data-testid attribute for DOM element"
  prop(testid, :string)
  @doc "Additional Tailwind classes"
  prop(class, :css_class)
  @doc "Additional Tailwind classes"
  prop(backdrop_class, :css_class)
  @doc "Additional Tailwind classes"
  prop(panel_class, :css_class)
  @doc "Additional Tailwind classes"
  prop(menu_class, :css_class)
  @doc "Additional Tailwind classes"
  prop(slim_nav_class, :css_class)
  @doc "Additional Tailwind classes"
  prop(slim_class, :css_class)
  @doc "Additional Tailwind classes"
  prop(slim_top_class, :css_class)
  @doc "Additional Tailwind classes"
  prop(slim_bottom_class, :css_class)
  @doc "Additional Tailwind classes"
  prop(generic_class, :css_class)
  @doc "List of links to be rendered when no default slot is given"
  prop(slim_links, :list, default: [])
  @doc "List of sections to be redered when no default slot is given"
  prop(sections, :list, default: [])

  @doc "Logo slot"
  slot(logo)
  @doc "Bottom slot, footer"
  slot(slim_top)
  @doc "Bottom slot, footer"
  slot(slim_bottom)
  @doc "Logo slot"
  slot(generic)

  def render(assigns) do
    ~F"""
    <Drawer
      {=@id}
      lg_persists
      class={merge(["lg:flex lg:start-0 lg:inset-y-0 lg:z-50 inset-auto theme-moon-dark", @class])}
      {=@testid}
    >
      <Drawer.Backdrop class={merge(["lg:hidden", @backdrop_class])} />
      <Drawer.Panel
        position="start"
        class={merge([
          [
            "bg-goku shadow-none",
            "w-[22rem] lg:w-[27.5rem]"
          ],
          @panel_class
        ])}
      >
        <nav aria-label="Sidebar" class={merge(["h-full flex flex-row", @menu_class])}>
          <div class={[
            merge([
              "flex flex-col w-[4.5rem] border-e h-full h-screen pt-6 pb-5 gap-6 px-3 lg:overflow-visible overflow-y-scroll border-beerus",
              @slim_nav_class
            ]),
            "border-e"
          ]}>
            <#slot {@logo} />
            <div class={merge(["flex flex-col h-full justify-between", @slim_class])}>
              <div class={merge(["flex flex-col gap-4", @slim_top_class])}>
                <#slot {@slim_top}>
                  <Sidebar.SlimMenuLink
                    :for={link <- @slim_links}
                    route={link[:page]}
                    icon_name={link[:icon]}
                    tooltip_text={link[:key]}
                  />
                </#slot>
              </div>
              <div class={merge(["flex flex-col gap-4 items-center", @slim_bottom_class])}>
                <#slot {@slim_bottom} />
              </div>
            </div>
          </div>
          <div class={merge([
            "flex flex-col h-full w-full h-screen pt-6 pb-5 lg:pb-20 gap-6 px-4 overflow-y-scroll",
            @generic_class
          ])}>
            <#slot {@generic}>
              <Sidebar.Section :for={section <- @sections} title={section[:title]} links={section[:links]} />
            </#slot>
          </div>
        </nav>
      </Drawer.Panel>
    </Drawer>
    """
  end
end
