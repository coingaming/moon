defmodule Moon.Parts.Sidebar.Slim do
  @moduledoc false

  use Moon.StatelessComponent

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
  @doc "List of links to be rendered when no default slot is given"
  prop(links, :list, default: [])
  @doc "Default slot, menu"
  slot(default)
  @doc "Bottom slot, footer"
  slot(bottom)
  @doc "Logo slot"
  slot(logo)

  def render(assigns) do
    ~F"""
    <nav
      {=@id}
      data-testid={@testid}
      aria-label="Sidebar"
      class={merge([
        "w-[4.5rem]",
        "h-screen pt-6 pb-5 flex flex-col gap-6 px-3 lg:overflow-visible overflow-y-scroll",
        "flex flex-col h-full gap-4",
        @class
      ])}
    >
      <#slot {@logo} />
      <div class={merge(["flex flex-col h-full justify-between", @slim_class])}>
        <div class={merge(["flex flex-col gap-4", @slim_top_class])}>
          <#slot>
            <Sidebar.SlimMenuLink
              :for={link <- @links}
              route={link[:page]}
              icon_name={link[:icon]}
              tooltip_text={link[:key]}
            />
          </#slot>
        </div>
        <div class={merge(["flex flex-col gap-4 items-center", @slim_bottom_class])}>
          <#slot {@bottom} />
        </div>
      </div>
    </nav>
    """
  end
end
