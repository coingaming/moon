defmodule MoonWeb.Pages.Design.TabsPage do
  @moduledoc false

  require Logger
  use MoonWeb, :live_view

  alias MoonWeb.Components.Anatomy
  alias MoonWeb.Components.Page
  alias MoonWeb.Components.ComponentPageDescription
  alias MoonWeb.Components.PropsTable
  alias MoonWeb.Components.ExamplesList
  alias MoonWeb.Examples.Design.TabsExample
  alias Moon.Design.Tabs

  data(breadcrumbs, :any,
    default: [
      %{
        to: "/components",
        name: "Components"
      },
      %{
        to: "/components/v2/tabs",
        name: "Tabs"
      }
    ]
  )

  data(tab_id, :integer, default: 1)

  def render(assigns) do
    ~F"""
    <Page {=@theme_name} {=@active_page} {=@breadcrumbs} {=@direction}>
      <ComponentPageDescription
        title="Tabs"
        is_aria_support
        is_rtl_support
        image="facing/components/tabs.png"
      >
        <p>Tabs to allow users to navigate easily between views within the same context.</p>
        <p>
          Each tab should contain content that is distinct from other tabs in a
          set for example, tabs can present different sections of news,
          different genres of music, or different themes of documents.
        </p>
      </ComponentPageDescription>

      <Tabs id="anatomy-tabs" class="justify-between gap-6">
        <h2 class="text-moon-24 font-medium">Anatomy</h2>
        <Tabs.List tab_titles={["Long syntax", "Short syntax"]} class="w-auto" />
        <Tabs.Panels>
          <Tabs.Panel><Anatomy title={false}>{component_anatomy(:long)}</Anatomy></Tabs.Panel>
          <Tabs.Panel><Anatomy title={false}>{component_anatomy(:short)}</Anatomy></Tabs.Panel>
        </Tabs.Panels>
      </Tabs>

      <ExamplesList examples={[
        TabsExample.Default,
        TabsExample.WithPills,
        TabsExample.WithSegments,
        TabsExample.Sizes,
        TabsExample.CustomSelected,
        TabsExample.Wizard
      ]} />

      <PropsTable module={Moon.Design.Tabs} />
      <PropsTable module={Moon.Design.Tabs.List} />
      <PropsTable module={Moon.Design.Tabs.Link} />
      <PropsTable module={Moon.Design.Tabs.Pill} />
      <PropsTable module={Moon.Design.Tabs.Segment} />
      <PropsTable module={Moon.Design.Tabs.Step} />
      <PropsTable module={Moon.Design.Tabs.Tab} />
      <PropsTable module={Moon.Design.Tabs.Panels} />
      <PropsTable module={Moon.Design.Tabs.Panel} />
    </Page>
    """
  end

  def component_anatomy(:long) do
    """
    <Tabs>
      <Tabs.List>
        <Tabs.Tab>...</Tabs.Tab>
        <Tabs.Tab>...</Tabs.Tab>
        <Tabs.Tab>...</Tabs.Tab>
      </Tabs.List>
      <Tabs.Panels>
        <Tabs.Panel>...</Tabs.Panel>
        <Tabs.Panel>...</Tabs.Panel>
        <Tabs.Panel>...</Tabs.Panel>
      </Tabs.Panels>
    </Tabs>
    """
  end

  def component_anatomy(:short) do
    """
    <Tabs>
      <Tabs.List tab_titles={...}/>
      <Tabs.Panels>
        <Tabs.Panel>...</Tabs.Panel>
        <Tabs.Panel>...</Tabs.Panel>
        <Tabs.Panel>...</Tabs.Panel>
      </Tabs.Panels>
    </Tabs>
    """
  end
end
