defmodule Moon.Parts.Sidebar do
  @moduledoc false

  use Moon.StatelessComponent

  alias Moon.Design.Drawer

  @doc "Id attribute for DOM element"
  prop(id, :string, required: true)
  @doc "Data-testid attribute for DOM element"
  prop(testid, :string)
  @doc "Additional Tailwind classes"
  prop(class, :css_class)
  @doc "Additional Tailwind classes"
  prop(backdrop_class, :css_class)
  @doc "Additional Tailwind classes"
  prop(panel_class, :css_class)
  @doc "Default slot"
  slot(default)

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
        class={merge(["h-screen pt-6 pb-5 flex flex-row gap-6", "bg-goku shadow-none w-auto", @panel_class])}
      >
        <#slot />
      </Drawer.Panel>
    </Drawer>
    """
  end
end
