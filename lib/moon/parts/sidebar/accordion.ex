defmodule Moon.Parts.Sidebar.Accordion do
  @moduledoc false

  use Moon.StatelessComponent

  alias Moon.Design.Accordion
  alias Moon.Icon

  @doc "Id attribute for DOM element"
  prop(id, :string)
  @doc "Data-testid attribute for DOM element"
  prop(testid, :string)
  @doc "Accordion header"
  prop(accordion_header, :any)
  @doc "Value (List of values) items to be open"
  prop(value, :any, default: [])
  @doc "Additional Tailwind classes"
  prop(class, :css_class)
  @doc "Additional Tailwind classes"
  prop(header_class, :css_class)
  @doc "Additional Tailwind classes"
  prop(content_class, :css_class)
  @doc "Accordion header icon"
  prop(accordion_header_icon, :string)
  @doc "Default slot"
  slot(default)

  def render(assigns) do
    ~F"""
    <Accordion {=@id} {=@testid} {=@value} {=@class}>
      <Accordion.Item has_content_outside>
        <Accordion.Header class={merge(["font-normal hover:bg-gohan rounded-moon-s-xx rounded-full p-3 gap-3 h-12", @header_class])}>
          <Icon
            class="w-6 h-6"
            name={@accordion_header_icon}
            :if={@accordion_header_icon && @accordion_header_icon != nil}
          />
          {@accordion_header}
        </Accordion.Header>
        <Accordion.Content>
          <div class={merge(["flex-grow flex flex-col gap-1 ps-9", @content_class])}>
            <#slot />
          </div>
        </Accordion.Content>
      </Accordion.Item>
    </Accordion>
    """
  end
end
