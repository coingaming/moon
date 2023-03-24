defmodule MoonWeb.Examples.Design.AccordionExample.DisabledItem do
  @moduledoc false

  use Moon.StatelessComponent
  use MoonWeb, :example

  alias Moon.Design.Accordion
  import MoonWeb.Helpers.Lorem

  def render(assigns) do
    ~F"""
    <Accordion id="disabled-accordion">
      <Accordion.Item>
        <Accordion.Header>Lorem</Accordion.Header>
        <Accordion.Content>{lorem()}</Accordion.Content>
      </Accordion.Item>
      <Accordion.Item disabled>
        <Accordion.Header>Disabled</Accordion.Header>
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

    <Accordion id="disabled-accordion">
      <Accordion.Item>
        <Accordion.Header>Lorem</Accordion.Header>
        <Accordion.Content>{lorem()}</Accordion.Content>
      </Accordion.Item>
      <Accordion.Item disabled>
        <Accordion.Header>Disabled</Accordion.Header>
        <Accordion.Content>{ipsum()}</Accordion.Content>
      </Accordion.Item>
      <Accordion.Item>
        <Accordion.Header>Dolor</Accordion.Header>
        <Accordion.Content>{dolor()}</Accordion.Content>
      </Accordion.Item>
    </Accordion>
    """
  end
end
