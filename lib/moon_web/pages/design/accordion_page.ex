defmodule MoonWeb.Pages.Design.AccordionPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias Moon.Design.Accordion
  alias MoonWeb.Components.ExampleAndCode
  alias MoonWeb.Components.ComponentPageDescription
  alias MoonWeb.Components.PropsTable
  alias MoonWeb.Components.Page

  import MoonWeb.Helpers.Lorem

  data(breadcrumbs, :any,
    default: [
      %{
        to: "#",
        name: "Components v2"
      },
      %{
        to: "/components/v2/accordion",
        name: "Accordion"
      }
    ]
  )

  data(header_props, :list,
    default: [
      %{
        :name => 'disabled',
        :type => 'boolean',
        :required => 'No',
        :default => 'false',
        :description => 'Disabling accordion item'
      },
      %{
        :name => 'size',
        :type => 'sm | md | lg | xl',
        :required => 'No',
        :default => 'md',
        :description => 'Size of the item'
      }
    ]
  )

  data(accordion_props, :list,
    default: [
      %{
        :name => 'header',
        :type => 'slot',
        :required => 'Yes',
        :default => '-',
        :description => 'Header of accordion item, see Accordion.Header'
      },
      %{
        :name => 'content',
        :type => 'slot',
        :required => 'Yes',
        :default => '-',
        :description => 'Content of accordion item, see Accordion.Content'
      },
      %{
        :name => 'item_size',
        :type => 'sm | md | lg | xl',
        :required => 'No',
        :default => 'md',
        :description => 'Size of the item, header mostly'
      },
      %{
        :name => 'single_open',
        :type => 'boolean',
        :required => 'No',
        :default => 'false',
        :description => 'Close other items if set'
      },
      %{
        :name => 'expanded',
        :type => 'list',
        :required => 'No',
        :default => '[]',
        :description => 'List of items to be expanded'
      },
      %{
        :name => 'on_change',
        :type => 'event',
        :required => 'No',
        :default => '-',
        :description => 'Handler for open/close of the item'
      }
    ]
  )

  data(expanded, :list, default: [])

  def handle_event("accordioned", %{"value" => index}, socket) do
    index = String.to_integer(index)
    list = socket.assigns[:expanded]
    {:noreply, assign(socket, expanded: (!Enum.member?(list, index) && [index]) || [])}
  end

  def render(assigns) do
    ~F"""
    <Page {=@theme_name} {=@active_page} {=@breadcrumbs} {=@direction}>
      <ComponentPageDescription title="Accordion" is_aria_support is_rtl_support is_in_progress>
        <p>
          An accordion is a vertical stack of interactive headings used to toggle the display of further information;
          each item can be 'collapsed' with just a short label visible or 'expanded' to show the full content.
        </p>
      </ComponentPageDescription>

      <ExampleAndCode title="Default" id="accordion-1">
        <:example>
          <Accordion id="accordion-default">
            <Accordion.Header>Lorem</Accordion.Header>
            <Accordion.Content>{lorem()}</Accordion.Content>
            <Accordion.Header>Ipsum</Accordion.Header>
            <Accordion.Content>{ipsum()}</Accordion.Content>
            <Accordion.Header>Dolor</Accordion.Header>
            <Accordion.Content>{dolor()}</Accordion.Content>
          </Accordion>
        </:example>
        <:code>{get_example_1_code()}</:code>
      </ExampleAndCode>

      <ExampleAndCode title="One item open at a time and Disabled" {...rndid()}>
        <:example>
          <Accordion {...rndid()} single_open>
            <Accordion.Header>Lorem</Accordion.Header>
            <Accordion.Content>{lorem()}</Accordion.Content>
            <Accordion.Header disabled>Disabled</Accordion.Header>
            <Accordion.Content>{ipsum()}</Accordion.Content>
            <Accordion.Header>Dolor</Accordion.Header>
            <Accordion.Content>{dolor()}</Accordion.Content>
          </Accordion>
        </:example>
        <:code>{get_example_2_code()}</:code>
      </ExampleAndCode>

      <ExampleAndCode title="Content outside" {...rndid()}>
        <:example>
          <Accordion {...rndid()} is_content_outside>
            <Accordion.Header>Lorem</Accordion.Header>
            <Accordion.Content>{lorem()}</Accordion.Content>
            <Accordion.Header>Ipsum</Accordion.Header>
            <Accordion.Content>{ipsum()}</Accordion.Content>
          </Accordion>
        </:example>
        <:code>{get_example_3_code()}</:code>
      </ExampleAndCode>

      <ExampleAndCode title="With divider" {...rndid()}>
        <:example>
          <Accordion {...rndid()} single_open>
            <Accordion.Header class="border-b">Lorem</Accordion.Header>
            <Accordion.Content>{lorem()}</Accordion.Content>
          </Accordion>
        </:example>
        <:code>{get_example_4_code()}</:code>
      </ExampleAndCode>

      <ExampleAndCode title="Sizes" {...rndid()}>
        <:example>
          {#for size <- ~w(xl lg md sm)}
            <Accordion {...rndid()} item_size={size}>
              <Accordion.Header>Size is {size}</Accordion.Header>
              <Accordion.Content>{lorem()}</Accordion.Content>
            </Accordion>
          {/for}
        </:example>
        <:code>{get_example_5_code()}</:code>
      </ExampleAndCode>

      <ExampleAndCode title="Sizes content outside" {...rndid()}>
        <:example>
          {#for size <- ~w(xl lg md sm)}
            <Accordion {...rndid()} item_size={size} is_content_outside>
              <Accordion.Header>Size is {size}</Accordion.Header>
              <Accordion.Content>{lorem()}</Accordion.Content>
            </Accordion>
          {/for}
        </:example>
        <:code>{get_example_6_code()}</:code>
      </ExampleAndCode>

      <ExampleAndCode title="Custom backgounds" {...rndid()}>
        <:example>
          <Accordion {...rndid()}>
            <Accordion.Header class="bg-beerus">Content inside</Accordion.Header>
            <Accordion.Content class="bg-beerus">{lorem()}</Accordion.Content>
          </Accordion>
          <Accordion {...rndid()} is_content_outside>
            <Accordion.Header class="bg-beerus">Content outside</Accordion.Header>
            <Accordion.Content>{lorem()}</Accordion.Content>
          </Accordion>
        </:example>
        <:code>{get_example_7_code()}</:code>
      </ExampleAndCode>

      <ExampleAndCode title="On change event" {...rndid()}>
        <:example>
          <Accordion {...rndid()} on_change="accordioned" {=@expanded}>
            <Accordion.Header>Lorem</Accordion.Header>
            <Accordion.Content>{lorem()}</Accordion.Content>
            <Accordion.Header>Ipsum</Accordion.Header>
            <Accordion.Content>{ipsum()}</Accordion.Content>
            <Accordion.Header>Dolor</Accordion.Header>
            <Accordion.Content>{dolor()}</Accordion.Content>
          </Accordion>
        </:example>
        <:code>{get_example_8_code()}</:code>
        <:state>
          @expanded = {inspect(@expanded)}
          # if you set "on_change" - you have to handle open/closed states by yourself
        </:state>
      </ExampleAndCode>

      <PropsTable title="Accordion props" data={@accordion_props} />
      <PropsTable title="Accordion.Hrader props" data={@header_props} />
    </Page>
    """
  end

  defp get_example_1_code() do
    """
    alias Moon.Design.Accordion
    ...

    <Accordion id="accordion-default">
      <Accordion.Header>Lorem</Accordion.Header>
      <Accordion.Content>{lorem()}</Accordion.Content>
      <Accordion.Header>Ipsum</Accordion.Header>
      <Accordion.Content>{ipsum()}</Accordion.Content>
      <Accordion.Header>Dolor</Accordion.Header>
      <Accordion.Content>{dolor()}</Accordion.Content>
    </Accordion>
    """
  end

  defp get_example_2_code() do
    """
    alias Moon.Design.Accordion
    ...

    <Accordion {...rndid()} single_open>
      <Accordion.Header>Lorem</Accordion.Header>
      <Accordion.Content>{lorem()}</Accordion.Content>
      <Accordion.Header disabled>Disabled</Accordion.Header>
      <Accordion.Content>{ipsum()}</Accordion.Content>
      <Accordion.Header>Dolor</Accordion.Header>
      <Accordion.Content>{dolor()}</Accordion.Content>
    </Accordion>
    """
  end

  defp get_example_3_code() do
    """
    alias Moon.Design.Accordion
    ...

    <Accordion {...rndid()} is_content_outside>
      <Accordion.Header>Lorem</Accordion.Header>
      <Accordion.Content>{lorem()}</Accordion.Content>
      <Accordion.Header>Ipsum</Accordion.Header>
      <Accordion.Content>{ipsum()}</Accordion.Content>
    </Accordion>
    """
  end

  defp get_example_4_code() do
    """
    alias Moon.Design.Accordion
    ...

    <Accordion {...rndid()} single_open>
      <Accordion.Header class="border-b">Lorem</Accordion.Header>
      <Accordion.Content>{lorem()}</Accordion.Content>
    </Accordion>
    """
  end

  defp get_example_5_code() do
    """
    alias Moon.Design.Accordion
    ...

    {#for size <- ~w(xl lg md sm)}
      <Accordion {...rndid()} item_size={size}>
        <Accordion.Header>Size is {size}</Accordion.Header>
        <Accordion.Content>{lorem()}</Accordion.Content>
      </Accordion>
    {/for}
    """
  end

  defp get_example_6_code() do
    """
    alias Moon.Design.Accordion
    ...

    {#for size <- ~w(xl lg md sm)}
      <Accordion {...rndid()} item_size={size} is_content_outside>
        <Accordion.Header>Size is {size}</Accordion.Header>
        <Accordion.Content>{lorem()}</Accordion.Content>
      </Accordion>
    {/for}
    """
  end

  defp get_example_7_code() do
    """
    alias Moon.Design.Accordion
    ...

    <Accordion {...rndid()}>
      <Accordion.Header class="bg-beerus">Content inside</Accordion.Header>
      <Accordion.Content class="bg-beerus">{lorem()}</Accordion.Content>
    </Accordion>
    <Accordion {...rndid()} is_content_outside>
      <Accordion.Header class="bg-beerus">Content outside</Accordion.Header>
      <Accordion.Content>{lorem()}</Accordion.Content>
    </Accordion>
    """
  end

  defp get_example_8_code() do
    """
    alias Moon.Design.Accordion
    ...

    data(expanded, :list, default: [])

    def handle_event("accordioned", %{"value" => index}, socket) do
      index = String.to_integer(index)
      list = socket.assigns[:expanded]
      {:noreply, assign(socket, expanded: (!Enum.member?(list, index) && [index]) || [])}
    end

    def render(assigns) do
      ~F\"""
      <Accordion {...rndid()} on_change="accordioned" {=@expanded}>
        <Accordion.Header>Lorem</Accordion.Header>
        <Accordion.Content>{lorem()}</Accordion.Content>
        <Accordion.Header>Ipsum</Accordion.Header>
        <Accordion.Content>{ipsum()}</Accordion.Content>
        <Accordion.Header>Dolor</Accordion.Header>
        <Accordion.Content>{dolor()}</Accordion.Content>
      </Accordion>
      \"""
    end
    """
  end
end
