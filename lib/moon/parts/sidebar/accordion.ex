defmodule Moon.Parts.Sidebar.Accordion do
  @moduledoc false

  use Moon.StatelessComponent

  alias Moon.Design.Accordion

  @doc "Id attribute for DOM element"
  prop(id, :string)
  @doc "Data-testid attribute for DOM element"
  prop(testid, :string)
  @doc "Route to redirect to"
  prop(accordion_header, :any)
  @doc "Value (List of values) items to be open"
  prop(value, :any, default: [])
  @doc "Additional Tailwind classes"
  prop(class, :css_class)
  @doc "Additional Tailwind classes"
  prop(header_class, :css_class)
  @doc "Additional Tailwind classes"
  prop(content_class, :css_class)
  @doc "Default slot"
  slot(default)

  def render(assigns) do
    ~F"""
    <Accordion {=@id} {=@testid} {=@value} {=@class}>
      <Accordion.Item has_content_outside>
        <Accordion.Header class={merge(["font-normal hover:bg-gohan rounded-moon-s-xx rounded-full p-3 gap-3 h-12", @header_class])}>{@accordion_header}</Accordion.Header>
        <Accordion.Content>
          <div class={merge(["flex-grow flex flex-col gap-1 ps-9 pe-3", @content_class])}>
            <#slot />
          </div>
        </Accordion.Content>
      </Accordion.Item>
    </Accordion>
    """
  end
end
