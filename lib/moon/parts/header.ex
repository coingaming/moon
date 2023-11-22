defmodule Moon.Parts.Header do
  @moduledoc false

  use Moon.StatelessComponent

  # TODO: remove "light_theme" prop when theme class merge is fixed

  @doc "Id for DOM element"
  prop(id, :string)
  @doc "Data-testid attribute for DOM element"
  prop(testid, :string)
  @doc "Additional Tailwind classes"
  prop(class, :css_class)
  @doc "Light theme"
  prop(light_theme, :boolean, default: false)
  @doc "Default slot for header content"
  slot(default)

  def render(assigns) do
    ~F"""
    <header
      {=@id}
      data-testid={@testid}
      class={merge([
        [
          "w-full sticky top-0 bg-goku px-4 pb-6 pt-[5.5rem] lg:p-8 min-h-[5rem]",
          "theme-moon-dark": !@light_theme,
          "theme-moon-light": @light_theme
        ],
        @class
      ])}
    >
      <#slot />
    </header>
    """
  end
end
