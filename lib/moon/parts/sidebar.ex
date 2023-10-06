defmodule Moon.Parts.Sidebar do
  @moduledoc false

  use Moon.StatelessComponent

  alias Moon.Design.Drawer

  @doc "Variant of the sidebar"
  prop(variant, :string,
    values: ["generic", "slim", "wide"],
    default: "generic"
  )

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
  @doc "Logo slot"
  slot(logo)
  @doc "Menu slot"
  slot(menu)
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
        class={merge([
          [
            "bg-goku shadow-none border-e",
            "w-[22.5rem]": @variant in ["generic"],
            "w-[4.5rem]": @variant in ["slim"],
            "w-[27.5rem]": @variant in ["wide"]
          ],
          @panel_class
        ])}
      >
        <nav
          aria-label="Sidebar"
          class={merge(["h-screen px-4 pt-6 pb-20 flex flex-col gap-6 overflow-y-scroll"]), @menu_class}
        >
          <#slot
            {@logo}
            context_put={
              is_slim: @variant in ["slim"]
            }
          />
          <#slot
            {@menu}
            context_put={
              is_slim: @variant in ["slim"]
            }
          />
          <#slot />
        </nav>
      </Drawer.Panel>
    </Drawer>
    """
  end
end
