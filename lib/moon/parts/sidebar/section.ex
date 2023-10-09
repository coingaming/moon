defmodule Moon.Parts.Sidebar.Section do
  @moduledoc false

  use Moon.StatelessComponent
  alias Moon.Parts.Sidebar
  alias Moon.Icon

  defstruct title: "", links: []

  @doc "Id attribute for DOM element"
  prop(id, :string)
  @doc "Data-testid attribute for DOM element"
  prop(testid, :string)
  @doc "Additional Tailwind classes"
  prop(class, :css_class)
  @doc "If is slim sidebar"
  prop(is_slim, :boolean, from_context: :is_slim)
  @doc "List of links to be rendered when no default slot is given"
  prop(links, :list, default: [])
  @doc "Section title to be rendered when no default slot is given"
  prop(title, :string)
  @doc "Default slot"
  slot(default)

  def render(assigns) do
    ~F"""
    <div
      class={merge([
        ["flex flex-col gap-2 h-full", "gap-4": @is_slim],
        @class
      ])}
      {=@id}
      data-testid={@testid}
    >
      <#slot>
        <Sidebar.SectionTitle :if={@title}>{@title}</Sidebar.SectionTitle>
        {#for link <- @links}
          {#if link[:children] && link[:children] != []}
            <Sidebar.Accordion id={"sidebar-#{link[:key]}"} accordion_header={link[:key]}>
              {#for child_menu_item <- link[:children]}
                <Sidebar.MenuLink route={child_menu_item[:page]}>{child_menu_item[:key]}</Sidebar.MenuLink>
              {/for}
            </Sidebar.Accordion>
          {#else}
            <Sidebar.MenuLink route={link[:page]}>
              <Icon class="w-6 h-6" name={link[:icon]} :if={link[:icon] && link[:icon] != ""} />
              {link[:key]}
            </Sidebar.MenuLink>
          {/if}
        {/for}
      </#slot>
    </div>
    """
  end
end
