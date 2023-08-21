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

      <PropsTable module={Moon.Design.Accordion} />
      <PropsTable module={Moon.Design.Accordion.Item} />
      <PropsTable module={Moon.Design.Accordion.Header} />
      <PropsTable module={Moon.Design.Accordion.Content} />
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
