defmodule MoonWeb.Examples.Design.AccordionExample.ContentOutside do
  @moduledoc false

  use Moon.StatelessComponent
  use MoonWeb, :example

  alias Moon.Design.Accordion
  import MoonWeb.Helpers.Lorem

  def render(assigns) do
    ~F"""
    <Accordion id="outside-accordion">
      <Accordion.Item has_content_outside>
        <Accordion.Header>Content outside</Accordion.Header>
        <Accordion.Content>{lorem()}</Accordion.Content>
      </Accordion.Item>
      <Accordion.Item>
        <Accordion.Header>Content inside</Accordion.Header>
        <Accordion.Content>{ipsum()}</Accordion.Content>
      </Accordion.Item>
      <Accordion.Item>
        <Accordion.Header class="border-b" title="With divider" />
        <Accordion.Content class="pt-2">{dolor()}</Accordion.Content>
      </Accordion.Item>
    </Accordion>
    """
  end

  def code() do
    """
    alias Moon.Design.Accordion
    import MoonWeb.Helpers.Lorem

    ...

    <Accordion id="outside-accordion">
      <Accordion.Item has_content_outside>
        <Accordion.Header>Content outside</Accordion.Header>
        <Accordion.Content>{lorem()}</Accordion.Content>
      </Accordion.Item>
      <Accordion.Item>
        <Accordion.Header>Content inside</Accordion.Header>
        <Accordion.Content>{ipsum()}</Accordion.Content>
      </Accordion.Item>
      <Accordion.Item>
        <Accordion.Header class="border-b" title="With divider"/>
        <Accordion.Content class="pt-2">{dolor()}</Accordion.Content>
      </Accordion.Item>
    </Accordion>
    """
  end
end
