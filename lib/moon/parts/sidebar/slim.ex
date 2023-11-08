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
  prop(slim_top_class, :css_class)
  @doc "Additional Tailwind classes"
  prop(slim_bottom_class, :css_class)
  @doc "List of links to be rendered when no default slot is given"
  prop(links, :list, default: [])
  @doc "aria-label HTTP attribute for nav"
  prop(aria_label, :string, default: "Sidebar Slim")
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
      aria-label={@aria_label}
      class={merge([
        "w-[4.5rem]",
        "flex flex-col gap-6 px-3 lg:overflow-visible overflow-y-scroll",
        "h-full gap-4 justify-between",
        @class
      ])}
    >
      <div class={merge(["flex flex-col gap-4", @slim_top_class])}>
        <#slot {@logo} />
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
    </nav>
    """
  end
end
