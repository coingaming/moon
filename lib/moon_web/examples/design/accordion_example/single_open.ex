defmodule MoonWeb.Examples.Design.AccordionExample.SingleOpen do
  @moduledoc false

  use Moon.StatelessComponent
  use MoonWeb, :example

  alias Moon.Design.Accordion
  import MoonWeb.Helpers.Lorem

  def render(assigns) do
    ~F"""
    <Accordion id="single-accordion" is_single_open>
      <Accordion.Item>
        <Accordion.Header>Lorem</Accordion.Header>
        <Accordion.Content>{lorem()}</Accordion.Content>
      </Accordion.Item>
      <Accordion.Item>
        <Accordion.Header>Ipsum</Accordion.Header>
        <Accordion.Content>{ipsum()}</Accordion.Content>
      </Accordion.Item>
      <Accordion.Item>
        <Accordion.Header>Dolor</Accordion.Header>
        <Accordion.Content>{dolor()}</Accordion.Content>
      </Accordion.Item>
    </Accordion>
    """
  end

  def code() do
    """
    alias Moon.Design.Accordion
    import MoonWeb.Helpers.Lorem

    ...

    <Accordion id="single-accordion" is_single_open>
      <Accordion.Item>
        <Accordion.Header>Lorem</Accordion.Header>
        <Accordion.Content>#{lorem()}</Accordion.Content>
      </Accordion.Item>
      <Accordion.Item>
        <Accordion.Header>Ipsum</Accordion.Header>
        <Accordion.Content>#{ipsum()}</Accordion.Content>
      </Accordion.Item>
      <Accordion.Item>
        <Accordion.Header>Dolor</Accordion.Header>
        <Accordion.Content>#{dolor()}</Accordion.Content>
      </Accordion.Item>
    </Accordion>
    """
  end
end
