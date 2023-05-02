defmodule MoonWeb.Pages.Design.AccordionPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias MoonWeb.Components.Anatomy
  alias MoonWeb.Components.ComponentPageDescription
  alias MoonWeb.Components.PropsTable
  alias MoonWeb.Components.Page
  alias MoonWeb.Components.ExamplesList
  alias MoonWeb.Examples.Design.AccordionExample

  data(breadcrumbs, :any,
    default: [
      %{
        to: "/components",
        name: "Components"
      },
      %{
        to: "/components/v2/accordion",
        name: "Accordion"
      }
    ]
  )

  def render(assigns) do
    ~F"""
    <Page {=@theme_name} {=@active_page} {=@breadcrumbs} {=@direction}>
      <ComponentPageDescription
        title="Accordion"
        is_aria_support
        is_rtl_support
        image="facing/components/accordion.png"
      >
        <p>
          An accordion is a vertical stack of interactive headings used to toggle the display of further information;
          each item can be 'collapsed' with just a short label visible or 'expanded' to show the full content.
        </p>
      </ComponentPageDescription>

      <Anatomy>{component_anatomy()}</Anatomy>

      <ExamplesList examples={[
        AccordionExample.Default,
        AccordionExample.OpenByDefault,
        AccordionExample.SingleOpen,
        AccordionExample.DisabledItem,
        AccordionExample.ContentOutside,
        AccordionExample.Sizes,
        AccordionExample.OnChangeEvent
      ]} />

      <PropsTable
        title="Accordion props"
        data={[
          %{
            :name => 'header',
            :type => 'slot',
            :required => 'Yes',
            :default => '-',
            :description => 'Header of accordion item, see Accordion.Header'
          },
          %{
            :name => 'class',
            :type => 'css_class',
            :required => 'No',
            :default => '-',
            :description => 'CSS class to be applied'
          },
          %{
            :name => 'item_size',
            :type => 'sm | md | lg | xl',
            :required => 'No',
            :default => 'md',
            :description => 'Size of the item, header mostly'
          },
          %{
            :name => 'is_single_open',
            :type => 'boolean',
            :required => 'No',
            :default => 'false',
            :description => 'Close other items if true'
          },
          %{
            :name => 'has_content_outside',
            :type => 'boolean',
            :required => 'No',
            :default => 'false',
            :description => 'Content looks outside'
          },
          %{
            :name => 'value',
            :type => 'string | list',
            :required => 'No',
            :default => '[]',
            :description => 'Value (List of values) items to be open'
          },
          %{
            :name => 'on_change',
            :type => 'event',
            :required => 'No',
            :default => '-',
            :description => 'Handler for open/close of the item'
          }
        ]}
      />
      <PropsTable
        title="Accordion.Item props"
        data={[
          %{
            :name => 'class',
            :type => 'css_class',
            :required => 'No',
            :default => '-',
            :description => 'CSS class to be applied'
          },
          %{
            :name => 'disabled',
            :type => 'boolean',
            :required => 'No',
            :default => 'false',
            :description => 'Disabling accordion item'
          },
          %{
            :name => 'has_content_outside',
            :type => 'boolean',
            :required => 'No',
            :default => 'false',
            :description => 'Content looks outside'
          },
          %{
            :name => 'value',
            :type => 'string',
            :required => 'No',
            :default => '0-started index of item in sequence',
            :description => 'Value of item, see Accordion\'s value'
          }
        ]}
      />

      <PropsTable
        title="Accordion.Header props"
        data={[
          %{
            :name => 'class',
            :type => 'css_class',
            :required => 'No',
            :default => '-',
            :description => 'CSS class to be applied'
          },
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
        ]}
      />
    </Page>
    """
  end

  defp component_anatomy do
    """
    <Accordion>
      <Accordion.Item>
        <Accordion.Header>...</Accordion.Header>
        <Accordion.Content>...</Accordion.Content>
      </Accordion.Item>
      <Accordion.Item>
        <Accordion.Header>...</Accordion.Header>
        <Accordion.Content>...</Accordion.Content>
      </Accordion.Item>
      <Accordion.Item>
        <Accordion.Header>...</Accordion.Header>
        <Accordion.Content>...</Accordion.Content>
      </Accordion.Item>
    </Accordion>
    """
  end
end
