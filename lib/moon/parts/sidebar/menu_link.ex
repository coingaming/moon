defmodule Moon.Parts.Sidebar.MenuLink do
  @moduledoc false

  use Moon.StatelessComponent

  alias Moon.Design.MenuItem

  @doc "Id attribute for DOM element"
  prop(id, :string)
  @doc "Data-testid attribute for DOM element"
  prop(testid, :string)
  @doc "Additional Tailwind classes"
  prop(class, :css_class)
  @doc "Route to redirect to"
  prop(route, :any)
  @doc "Default slot"
  slot(default)
  @doc "Active page"
  data(active_page, :string, from_context: :active_page)

  def render(assigns) do
    ~F"""
    <MenuItem
      as="a"
      class={merge([
        [
          "text-bulma justify-start hover:bg-gohan rounded-moon-i-xx rounded-full p-3 gap-3 h-12",
          "bg-gohan": @active_page == @route
        ],
        @class
      ])}
      attrs={
        "data-phx-link": "redirect",
        "data-phx-link-state": "push"
      }
      is_active={@active_page == @route}
      href={@route}
      {=@id}
      {=@testid}
    >
      <#slot />
    </MenuItem>
    """
  end
end
