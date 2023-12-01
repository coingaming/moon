defmodule Moon.Parts.Sidebar.MenuLink do
  @moduledoc false

  use Moon.StatelessComponent

  alias Moon.Design.MenuItem

  defstruct key: "", page: "", icon: "", children: []

  @doc "Id attribute for DOM element"
  prop(id, :string)
  @doc "Data-testid attribute for DOM element"
  prop(testid, :string)
  @doc "Additional Tailwind classes"
  prop(class, :css_class)
  @doc "Route to redirect to"
  prop(route, :any)
  prop(value, :any)
  @doc "Additional attributes set for the tag a"
  prop(attrs, :map, default: %{})
  @doc "Active page"
  prop(active_page, :string, from_context: :active_page)
  @doc "Some additional classes will be added to indicate is active"
  prop(is_active, :boolean, default: false)
  @doc "Add this as is_selected value and also work for underlying checkbox/radio"
  prop(is_selected, :boolean, default: false)

  @doc "Default slot"
  slot(default)

  def render(assigns) do
    ~F"""
    <MenuItem
      as="a"
      class={merge([
        [
          "text-bulma justify-start hover:bg-gohan rounded-full h-12",
          "bg-bulma text-goku": @active_page == @route || @is_selected
        ],
        @class
      ])}
      attrs={Map.merge(
        %{
          "data-phx-link": "redirect",
          "data-phx-link-state": "push",
          route: @route
        },
        @attrs
      )}
      is_active={@active_page == @route}
      href={@route}
      {=@id}
      {=@testid}
      {=@is_selected}
      {=@value}
    >
      <#slot />
    </MenuItem>
    """
  end

  def active_page_contains(active_page, route) do
    String.contains?(to_string(active_page), to_string(route))
  end
end
