defmodule MoonWeb.Pages.Design.TabsPage do
  @moduledoc false

  require Logger
  use MoonWeb, :live_view

  alias Surface.Components.Raw
  alias Moon.Design.Tabs
  alias MoonWeb.Components.ExampleAndCode
  alias MoonWeb.Components.Page
  alias MoonWeb.Components.PageSection
  alias MoonWeb.Components.ComponentPageDescription
  alias MoonWeb.Components.PropsTable
  alias MoonWeb.Components.CodeSnippet

  import MoonWeb.Helpers.Lorem

  data(breadcrumbs, :any,
    default: [
      %{
        to: "#",
        name: "Components v2"
      },
      %{
        to: "/components/v2/tabs",
        name: "Tabs"
      }
    ]
  )

  data(props_info_array_tab, :list,
    default: [
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
    ]
  )

  data(props_info_array_tabs, :list,
    default: [
      %{
        :name => 'tabs',
        :type => 'slot ',
        :required => 'No',
        :default => '-',
        :description => 'List of the tabs. Reffer to Moon.Design.Tabs.Tab module'
      },
      %{
        :name => 'class',
        :type => 'css_class',
        :required => 'No',
        :default => '-',
        :description => 'additional css classes for the tab'
      },
      %{
        :name => 'panels',
        :type => 'slot ',
        :required => 'No',
        :default => '-',
        :description => 'Panels slot. Panel with selected_index is shown'
      },
      %{
        :name => 'on_change',
        :type => 'event',
        :required => 'No',
        :default => '-',
        :description => 'Event to happen when non-disabled tab is clicked'
      },
      %{
        :name => 'selected_index',
        :type => 'integer',
        :required => 'No',
        :default => '0',
        :description => 'Index of the selected tab'
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
    ]
  )

  data(tab_id, :integer, default: 1)

  def anatomy_code() do
    """
    <Tabs selected_index={@tab_id} on_change="clicked_tab">
      <Tabs.Tab>First tab</Tabs.Tab>
      <Tabs.Tab>Second tab</Tabs.Tab>
      <Tabs.Tab>Third tab</Tabs.Tab>
      <Tabs.Panel>{lorem()}</Tabs.Panel>
      <Tabs.Panel>{ipsum()}</Tabs.Panel>
      <Tabs.Panel>{dolor()}</Tabs.Panel>
    </Tabs>
    """
  end

  def render(assigns) do
    ~F"""
    <Page {=@theme_name} {=@active_page} {=@breadcrumbs} {=@direction}>
      <ComponentPageDescription title="Tabs" is_aria_support is_rtl_support>
        <p>Tabs to allow users to navigate easily between views within the same context.</p>
        <p>
          Each tab should contain content that is distinct from other tabs in a set for example,
          tabs can present different sections of news, different genres of music, or different themes of documents.
        </p>
      </ComponentPageDescription>

      <PageSection title="Anatomy" class="hidden">
        <p>Tabs are implemented vi Headless design, so can be easly customized. Headless design means folowing:
        </p>
        <CodeSnippet>
          {anatomy_code()}
        </CodeSnippet>
        <pre>
          <code>
            <#Raw>
              <Tabs id="tabs-ex-0">
                <Tabs.Tab>First tab</Tabs.Tab>
                <Tabs.Tab>Second tab</Tabs.Tab>
                <Tabs.Tab>Third tab</Tabs.Tab>
                <Tabs.Panel>{lorem()}</Tabs.Panel>
                <Tabs.Panel>{ipsum()}</Tabs.Panel>
                <Tabs.Panel>{dolor()}</Tabs.Panel>
              </Tabs>
            </#Raw>
          </code>
        </pre>
      </PageSection>

      <ExampleAndCode title="Default" id="tabs" class="mt-4">
        <:example>
          <Tabs id="tabs-ex-1">
            <Tabs.Tab>First tab</Tabs.Tab>
            <Tabs.Tab>Second tab</Tabs.Tab>
            <Tabs.Tab>Third tab</Tabs.Tab>
            <Tabs.Panel>{lorem()}</Tabs.Panel>
            <Tabs.Panel>{ipsum()}</Tabs.Panel>
            <Tabs.Panel>{dolor()}</Tabs.Panel>
          </Tabs>
        </:example>
        <:code>{get_example_code1()}</:code>
      </ExampleAndCode>

      <ExampleAndCode title="Default with Pills" id="pills" class="mt-4">
        <:example>
          <Tabs id="tabs-ex-2">
            <Tabs.Pill>First tab</Tabs.Pill>
            <Tabs.Pill>Second tab</Tabs.Pill>
            <Tabs.Pill>Third tab</Tabs.Pill>
            <Tabs.Panel>{lorem()}</Tabs.Panel>
            <Tabs.Panel>{ipsum()}</Tabs.Panel>
            <Tabs.Panel>{dolor()}</Tabs.Panel>
          </Tabs>
        </:example>
        <:code>{get_example_code2()}</:code>
      </ExampleAndCode>

      <ExampleAndCode
        title="Default with Segments"
        id="segments-example"
        class="mt-4"
        example_class="bg-transparent border-beerus border"
      >
        <:example>
          <div class="flex justify-between w-full gap-4 w-full">
            <Tabs
              class="w-fit gap-1 p-1 bg-goku rounded-moon-s-sm"
              tab_titles={~w(Segment Segment Segment)}
              tab_module={Tabs.Segment}
              id="tabs-ex-9"
            />
            <Tabs
              class="w-fit gap-1 p-1 bg-goku rounded-moon-s-sm"
              size="sm"
              tab_titles={~w(Small Small Small)}
              tab_module={Tabs.Segment}
              id="tabs-ex-10"
            />
          </div>
        </:example>
        <:code>{get_example_code5()}</:code>
      </ExampleAndCode>

      <ExampleAndCode title="On change" id="on-change-ex" class="mt-4">
        <:example>
          <Tabs id="tabs-ex-11" selected_index={@tab_id} on_change="clicked_tab">
            <Tabs.Tab>First tab</Tabs.Tab>
            <Tabs.Tab>Second tab</Tabs.Tab>
            <Tabs.Tab>Third tab</Tabs.Tab>
            <Tabs.Panel>{lorem()}</Tabs.Panel>
            <Tabs.Panel>{ipsum()}</Tabs.Panel>
            <Tabs.Panel>{dolor()}</Tabs.Panel>
          </Tabs>
        </:example>
        <:code>{get_example_code6()}</:code>
        <:state>
          @tab_id = {@tab_id}
          # Please note - you'll have to handel selected_index by yourself when on_change is given
        </:state>
      </ExampleAndCode>

      <ExampleAndCode title="Sizes" id="sizes" class="mt-4">
        <:example>
          <div class="flex flex-col gap-4 w-full">
            <div class="flex justify-between w-full gap-4 w-full">
              <Tabs size="sm" tab_titles={~w(Tab-sm Tab-sm Tab-sm)} id="tabs-ex-5" />
              <Tabs size="md" tab_titles={~w(Tab-md Tab-md Tab-md)} id="tabs-ex-6" />
            </div>
            <div class="flex justify-between w-full gap-10">
              <Tabs size="sm" tab_titles={~w(Pill-sm Pill-sm Pill-sm)} tab_module={Tabs.Pill} id="tabs-ex-4" />
              <Tabs size="md" tab_titles={~w(Pill-md Pill-md Pill-md)} tab_module={Tabs.Pill} id="tabs-ex-3" />
            </div>
          </div>
        </:example>
        <:code>{get_example_code3()}</:code>
      </ExampleAndCode>

      <ExampleAndCode title="Disabled and Custom selected" id="disabled" class="mt-4">
        <:example>
          <Tabs id="tabs-ex-7">
            <Tabs.Tab class="hover:text-hit after:bg-hit" selected_class="text-hit after:scale-x-100">First tab</Tabs.Tab>
            <Tabs.Tab disabled>Disabled tab</Tabs.Tab>
            <Tabs.Tab class="hover:text-hit after:bg-hit" selected_class="text-hit after:scale-x-100">Third tab</Tabs.Tab>
          </Tabs>
          <Tabs id="tabs-ex-8">
            <Tabs.Pill class="hover:bg-hit/30" selected_class="bg-hit/30">Green pill</Tabs.Pill>
            <Tabs.Pill disabled>Disabled pill</Tabs.Pill>
            <Tabs.Pill class="hover:bg-hit/30" selected_class="bg-hit/30">Third pill</Tabs.Pill>
          </Tabs>
        </:example>
        <:code>{get_example_code4()}</:code>
      </ExampleAndCode>

      <PropsTable title="Moon.Design.Tabs properties" data={@props_info_array_tabs} />

      <PropsTable
        title="Moon.Design.Tabs.{Tab, Pill, Segment} properties"
        data={@props_info_array_tab}
      />
    </Page>
    """
  end

  def handle_event("clicked_tab", %{"value" => tab_id}, socket) do
    {:noreply, assign(socket, tab_id: String.to_integer("#{tab_id}"))}
  end

  defp get_example_code1() do
    """
    alias Moon.Design.Tabs

    import MoonWeb.Helpers.Lorem

    def render(assigns) do
      ~F\"""
      <Tabs id="tabs-ex-0">
        <Tabs.Tab>First tab</Tabs.Tab>
        <Tabs.Tab>Second tab</Tabs.Tab>
        <Tabs.Tab>Third tab</Tabs.Tab>
        <Tabs.Panel>{lorem()}</Tabs.Panel>
        <Tabs.Panel>{ipsum()}</Tabs.Panel>
        <Tabs.Panel>{dolor()}</Tabs.Panel>
      </Tabs>
      \"""
    end
    """
  end

  defp get_example_code2() do
    """
    <Tabs id="tabs-ex-0">
      <Tabs.Pill>First tab</Tabs.Pill>
      <Tabs.Pill>Second tab</Tabs.Pill>
      <Tabs.Pill>Third tab</Tabs.Pill>
      <Tabs.Panel>{lorem()}</Tabs.Panel>
      <Tabs.Panel>{ipsum()}</Tabs.Panel>
      <Tabs.Panel>{dolor()}</Tabs.Panel>
    </Tabs>
    """
  end

  defp get_example_code3() do
    """
    <div class="flex justify-between w-full gap-10">
      <Tabs
        id="tabs-ex-0"
        size="sm"
        tab_titles={~w(Tab-sm Tab-sm Tab-sm)}
      />
      <Tabs
        id="tabs-ex-0"
        size="md"
        tab_titles={~w(Tab-md Tab-md Tab-md)}
      />
    </div>
    <div class="flex justify-between w-full gap-10">
      <Tabs
        id="tabs-ex-0"
        size="sm"
        tab_titles={~w(Pill-sm Pill-sm Pill-sm)}
        tab_module={Tabs.Pill}
      />
      <Tabs
        id="tabs-ex-0"
        size="md"
        tab_titles={~w(Pill-md Pill-md Pill-md)}
        tab_module={Tabs.Pill}
      />
    </div>
    """
  end

  defp get_example_code4() do
    """
    <Tabs id="tabs-ex-1">
      <Tabs.Tab class="hover:text-hit after:bg-hit" selected_class="text-hit after:scale-x-100">First tab</Tabs.Tab>
      <Tabs.Tab disabled>Disabled tab</Tabs.Tab>
      <Tabs.Tab class="hover:text-hit after:bg-hit" selected_class="text-hit after:scale-x-100">Third tab</Tabs.Tab>
    </Tabs>
    <Tabs id="tabs-ex-0">
      <Tabs.Pill class="hover:bg-hit/30" selected_class="bg-hit/30">Green pill</Tabs.Pill>
      <Tabs.Pill disabled>Disabled pill</Tabs.Pill>
      <Tabs.Pill class="hover:bg-hit/30" selected_class="bg-hit/30">Third pill</Tabs.Pill>
    </Tabs>
    """
  end

  defp get_example_code5() do
    """
    <div class="flex justify-between w-full gap-4 w-full">
      <Tabs
        id="tabs-ex-1"
        class="w-fit gap-1 p-1 bg-goku rounded-moon-s-sm"
        tab_titles={~w(Segment Segment Segment)}
        tab_module={Tabs.Segment}
      />
      <Tabs
        id="tabs-ex-0"
        class="w-fit gap-1 p-1 bg-goku rounded-moon-s-sm"
        size="sm"
        tab_titles={~w(Small Small Small)}
        tab_module={Tabs.Segment}
      />
    </div>
    """
  end

  defp get_example_code6() do
    """
    data(tab_id, :integer, default: 1)


    def handle_event("clicked_tab", %{"selected-index" => tab_id}, socket) do
      {:noreply, assign(socket, tab_id: String.to_integer("\#{tab_id}"))}
    end

    ...

    <Tabs id="tabs-ex-11"  selected_index={@tab_id} on_change="clicked_tab">
      <Tabs.Tab>First tab</Tabs.Tab>
      <Tabs.Tab>Second tab</Tabs.Tab>
      <Tabs.Tab>Third tab</Tabs.Tab>
      <Tabs.Panel>{lorem()}</Tabs.Panel>
      <Tabs.Panel>{ipsum()}</Tabs.Panel>
      <Tabs.Panel>{dolor()}</Tabs.Panel>
    </Tabs>

    """
  end
end
