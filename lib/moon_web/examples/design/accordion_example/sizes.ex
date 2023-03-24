defmodule MoonWeb.Examples.Design.AccordionExample.Sizes do
  @moduledoc false

  use Moon.StatelessComponent
  use MoonWeb, :example

  alias Moon.Design.Accordion
  import MoonWeb.Helpers.Lorem

  def render(assigns) do
    ~F"""
    {#for size <- ~w(xl lg md sm)}
      <Accordion id={"accordion-sizes-#{size}"} item_size={size}>
        <Accordion.Item>
          <Accordion.Header>Size {size}</Accordion.Header>
          <Accordion.Content>{lorem()}</Accordion.Content>
        </Accordion.Item>
      </Accordion>
    {/for}
    """
  end

  def code() do
    """
    alias Moon.Design.Accordion
    import MoonWeb.Helpers.Lorem

    ...

    {#for size <- ~w(xl lg md sm)}
      <Accordion id={"accordion-sizes-\#{size}"} item_size={size}>
        <Accordion.Item>
          <Accordion.Header>Size {size}</Accordion.Header>
          <Accordion.Content>{lorem()}</Accordion.Content>
        </Accordion.Item>
      </Accordion>
    {/for}
    """
  end
end
