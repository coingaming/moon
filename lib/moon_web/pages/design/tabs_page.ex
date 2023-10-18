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
        TabsExample.Wizzard,
        TabsExample.Default,
        TabsExample.WithPills,
        TabsExample.WithSegments,
        TabsExample.Sizes,
        TabsExample.CustomSelected
      ]} />

      <PropsTable
        title="Moon.Design.Tabs.{Tab, Pill, Segment} properties"
        data={[
          %{
            :name => 'default',
            :type => 'slot ',
            :required => 'Yes',
            :default => '-',
            :description => 'Content inside the tab'
          },
          %{
            :name => 'class',
            :type => 'css_class',
            :required => 'No',
            :default => '-',
            :description => 'additional css classes for the tab'
          },
          %{
            :name => 'disabled',
            :type => 'boolean',
            :required => 'No',
            :default => 'false',
            :description => 'Is tab disabled'
          }
        ]}
      />

      <PropsTable
        title="Moon.Design.Tabs properties"
        data={[
          %{
            :name => 'default',
            :type => 'slot ',
            :required => 'Yes',
            :default => '-',
            :description => 'Content near tablist'
          },
          %{
            :name => 'class',
            :type => 'css_class',
            :required => 'No',
            :default => '-',
            :description => 'additional css classes for the tab'
          },
          %{
            :name => 'on_change',
            :type => 'event',
            :required => 'No',
            :default => '-',
            :description => 'Event to happen when non-disabled tab is clicked'
          },
          %{
            :name => 'selected',
            :type => 'integer',
            :required => 'No',
            :default => '0',
            :description => 'Index of the selected tab'
          }
        ]}
      />

      <PropsTable
        title="Moon.Design.Tabs.List properties"
        data={[
          %{
            :name => 'class',
            :type => 'css_class',
            :required => 'No',
            :default => '-',
            :description => 'Additional css classes for the tablist'
          },
          %{
            :name => 'size',
            :type => 'sm | md',
            :required => 'No',
            :default => 'md',
            :description => 'Size of tabs'
          },
          %{
            :name => 'tab_titles',
            :type => 'list',
            :required => 'No',
            :default => '[]',
            :description =>
              'List of tab titles. THe are rendered with tab_module. Only if no slot tabs assigned'
          },
          %{
            :name => 'tab_module',
            :type => 'atom',
            :required => 'No',
            :default => 'Moon.Design.Tabs.Tab',
            :description => 'Module for rendering tabs from tab_titles'
          }
        ]}
      />
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
