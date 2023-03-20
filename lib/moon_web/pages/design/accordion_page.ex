defmodule MoonWeb.Pages.Design.AccordionPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias MoonWeb.Components.Anatomy
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
      <ComponentPageDescription title="Accordion" is_aria_support is_rtl_support>
        <p>
          An accordion is a vertical stack of interactive headings used to toggle the display of further information;
          each item can be 'collapsed' with just a short label visible or 'expanded' to show the full content.
        </p>
      </ComponentPageDescription>

      <Anatomy>{component_anatomy()}</Anatomy>

      <ExampleAndCode title="Default" id="example-00">
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

      <ExampleAndCode title="One item open at a time and Disabled" id="example-01">
        <:example>
          <Accordion id="accordion-01" single_open>
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

      <ExampleAndCode title="Content outside" id="example-content-outside">
        <:example>
          <Accordion id="accordion-02" is_content_outside>
            <Accordion.Header>Lorem</Accordion.Header>
            <Accordion.Content>{lorem()}</Accordion.Content>
            <Accordion.Header>Ipsum</Accordion.Header>
            <Accordion.Content>{ipsum()}</Accordion.Content>
          </Accordion>
        </:example>
        <:code>{get_example_3_code()}</:code>
      </ExampleAndCode>

      <ExampleAndCode title="With divider" id="example-divider">
        <:example>
          <Accordion id="accordion-03" single_open>
            <Accordion.Header class="border-b">Lorem</Accordion.Header>
            <Accordion.Content>{lorem()}</Accordion.Content>
          </Accordion>
        </:example>
        <:code>{get_example_4_code()}</:code>
      </ExampleAndCode>

      <ExampleAndCode title="Sizes" id="example-sizes">
        <:example>
          {#for size <- ~w(xl lg md sm)}
            <Accordion id={"accordion-sizes-#{size}"} item_size={size}>
              <Accordion.Header>Size is {size}</Accordion.Header>
              <Accordion.Content>{lorem()}</Accordion.Content>
            </Accordion>
          {/for}
        </:example>
        <:code>{get_example_5_code()}</:code>
      </ExampleAndCode>

      <ExampleAndCode title="Sizes content outside" id="example-sizes-outside">
        <:example>
          {#for size <- ~w(xl lg md sm)}
            <Accordion id={"accordion-out-sizes-#{size}"} item_size={size} is_content_outside>
              <Accordion.Header>Size is {size}</Accordion.Header>
              <Accordion.Content>{lorem()}</Accordion.Content>
            </Accordion>
          {/for}
        </:example>
        <:code>{get_example_6_code()}</:code>
      </ExampleAndCode>

      <ExampleAndCode title="Custom backgounds" id="example-custom-bg">
        <:example>
          <Accordion id="accordion-bg-in">
            <Accordion.Header class="bg-beerus">Content inside</Accordion.Header>
            <Accordion.Content class="bg-beerus">{lorem()}</Accordion.Content>
          </Accordion>
          <Accordion id="accordion-bg-out" is_content_outside>
            <Accordion.Header class="bg-beerus">Content outside</Accordion.Header>
            <Accordion.Content>{lorem()}</Accordion.Content>
          </Accordion>
        </:example>
        <:code>{get_example_7_code()}</:code>
      </ExampleAndCode>

      <ExampleAndCode title="On change event" id="example-on-change">
        <:example>
          <Accordion id="accordion-on-ch" on_change="accordioned" {=@expanded}>
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

    <Accordion id="accordion-sample" single_open>
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

    <Accordion id="accordion-sample" is_content_outside>
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

    <Accordion id="accordion-sample" single_open>
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
      <Accordion id="accordion-sample" item_size={size}>
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
      <Accordion id="accordion-sample" item_size={size} is_content_outside>
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

    <Accordion id="accordion-sample">
      <Accordion.Header class="bg-beerus">Content inside</Accordion.Header>
      <Accordion.Content class="bg-beerus">{lorem()}</Accordion.Content>
    </Accordion>
    <Accordion id="accordion-sample" is_content_outside>
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
      <Accordion id="accordion-sample" on_change="accordioned" {=@expanded}>
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

  def component_anatomy do
    """
    <Accordion>
      <Accordion.Header>...</Accordion.Header>
      <Accordion.Content>...</Accordion.Content>
      <Accordion.Header>...</Accordion.Header>
      <Accordion.Content>...</Accordion.Content>
      <Accordion.Header>...</Accordion.Header>
      <Accordion.Content>...</Accordion.Content>
    </Accordion>
    """
  end
end
