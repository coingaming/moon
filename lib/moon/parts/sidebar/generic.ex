defmodule Moon.Parts.Sidebar.Generic do
  @moduledoc false

  use Moon.StatelessComponent

  alias Moon.Parts.Sidebar

  @doc "Id attribute for DOM element"
  prop(id, :string)
  @doc "Data-testid attribute for DOM element"
  prop(testid, :string)
  @doc "Additional Tailwind classes"
  prop(class, :css_class)
  @doc "List of sections to be redered when no default slot is given"
  prop(sections, :list, default: [])
  @doc "aria-label HTTP attribute for nav"
  prop(aria_label, :string, default: "Sidebar Generic")
  @doc "Logo slot"
  slot(logo)
  @doc "Default slot"
  slot(default)

  def render(assigns) do
    ~F"""
    <nav
      {=@id}
      data-testid={@testid}
      aria-label={@aria_label}
      class={merge([
        ["w-[22.5rem]", "h-screen pt-6 pb-5 flex flex-col px-4 overflow-y-scroll not-first:px-5 gap-6"],
        @class
      ])}
    >
      <#slot {@logo} />
      <#slot>
        <Sidebar.Section :for={section <- @sections} title={section[:title]} links={section[:links]} />
      </#slot>
    </nav>
    """
  end
end
