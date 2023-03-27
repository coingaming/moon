defmodule MoonWeb.Examples.Design.AccordionExample.Default do
  @moduledoc false

  use Moon.StatelessComponent
  use MoonWeb, :example

  alias Moon.Design.Accordion
  import MoonWeb.Helpers.Lorem

  def render(assigns) do
    ~F"""
    <Accordion id="simple-accordion">
      <Accordion.Item>
        <Accordion.Header title="Lorem" />
        <Accordion.Content>{lorem()}</Accordion.Content>
      </Accordion.Item>
      <Accordion.Item>
        <Accordion.Header class="bg-beerus">Beerus bg</Accordion.Header>
        <Accordion.Content class="bg-beerus">{ipsum()}</Accordion.Content>
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

    <Accordion id="simple-accordion">
      <Accordion.Item>
        <Accordion.Header title="Lorem"/>
        <Accordion.Content>{lorem()}</Accordion.Content>
      </Accordion.Item>
      <Accordion.Item>
        <Accordion.Header class="bg-beerus">Beerus bg</Accordion.Header>
        <Accordion.Content class="bg-beerus">{ipsum()}</Accordion.Content>
      </Accordion.Item>
      <Accordion.Item>
        <Accordion.Header>Dolor</Accordion.Header>
        <Accordion.Content>{dolor()}</Accordion.Content>
      </Accordion.Item>
    </Accordion>
    """
  end
end
