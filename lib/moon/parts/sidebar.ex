defmodule Moon.Parts.Sidebar do
  @moduledoc false

  use Moon.StatelessComponent

  # TODO: remove "light_theme" prop when theme class merge is fixed

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
  @doc "Light theme"
  prop(light_theme, :boolean, default: false)
  @doc "Default slot - for menus"
  slot(default)
  @doc "Button slot - for button in the bottom"
  slot(button)

  def render(assigns) do
    ~F"""
    <Drawer
      {=@id}
      lg_persists
      class={merge([
        [
          "lg:flex lg:start-0 lg:inset-y-0 lg:z-50 inset-auto",
          "theme-moon-dark": !@light_theme,
          "theme-moon-light": @light_theme
        ],
        @class
      ])}
      {=@testid}
    >
      <Drawer.Backdrop class={merge(["lg:hidden", @backdrop_class])} />
      <Drawer.Panel
        position="start"
        class={merge([
          "h-screen flex flex-row",
          "bg-goku shadow-none w-auto rounded-moon-s-lg",
          "rounded-none",
          "divide-x divide-beerus",
          @panel_class
        ])}
      >
        <#slot />
      </Drawer.Panel>
    </Drawer>
    <#slot {@button} />
    """
  end
end
