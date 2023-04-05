defmodule MoonWeb.Pages.Design.Form.RadioPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias MoonWeb.Components.Page
  alias MoonWeb.Components.ComponentPageDescription
  alias MoonWeb.Examples.Form.RadioExample
  alias MoonWeb.Components.ExamplesList
  alias MoonWeb.Components.PropsTable
  alias MoonWeb.Components.Anatomy

  alias Moon.Design.Tabs

  data(breadcrumbs, :any,
    default: [
      %{
        to: "#",
        name: "Components v2"
      },
      %{
        to: "#",
        name: "Form"
      },
      %{
        to: "/components/v2/form/radio",
        name: "Checkbox"
      }
    ]
  )

  def render(assigns) do
    ~F"""
    <Page {=@theme_name} {=@active_page} {=@breadcrumbs} {=@direction}>
      <ComponentPageDescription
        title="Radio"
        is_aria_support
        is_rtl_support
        image="facing/components/radio_button.png"
      >
        <p>Radio buttons are used to represent a group of choices whereby users can only select one option.</p>
        <p>
          The main difference between the radio button and the checkbox is, users are allowed to select single
          options whereas in the checkbox you can have multiple options.
        </p>
      </ComponentPageDescription>

      <Tabs id="anatomy-tabs" class="justify-between gap-6">
        <h2 class="text-moon-24 font-medium">Anatomy</h2>
        <Tabs.List tab_titles={["Long syntax", "Short syntax", "Form"]} />
        <Tabs.Panels>
          <Tabs.Panel><Anatomy title={false}>{component_anatomy(:long)}</Anatomy></Tabs.Panel>
          <Tabs.Panel><Anatomy title={false}>{component_anatomy(:short)}</Anatomy></Tabs.Panel>
          <Tabs.Panel><Anatomy title={false}>{component_anatomy(:form)}</Anatomy></Tabs.Panel>
        </Tabs.Panels>
      </Tabs>

      <ExamplesList examples={[
        RadioExample.Default,
        RadioExample.Disabled,
        RadioExample.WithForm,
        RadioExample.Customizations
      ]} />

      <PropsTable
        title="Radio props"
        data={[
          %{
            :name => 'field',
            :type => 'atom',
            :required => 'Yes',
            :default => '-',
            :description => 'Field name for underlying surface select component'
          },
          %{
            :name => 'id',
            :type => 'string',
            :required => 'No',
            :default => '-',
            :description => 'Id for the DOM element'
          },
          %{
            :name => 'class',
            :type => 'css_class',
            :required => 'No',
            :default => '-',
            :description => 'Additional classes for tag'
          },
          %{
            :name => 'testid',
            :type => 'string',
            :required => 'No',
            :default => '-',
            :description => 'Attr data-testid for the DOM element'
          },
          %{
            :name => 'disabled',
            :type => 'boolean',
            :required => 'No',
            :default => 'false',
            :description => 'Whether the component is disabled'
          },
          %{
            :name => 'option',
            :type => 'slot',
            :required => 'No',
            :default => '-',
            :description => 'Option elements'
          },
          %{
            :name => 'options',
            :type => 'keyword list',
            :required => 'No',
            :default => '-',
            :description => 'list [value: "title"] of the options'
          },
          %{
            :name => 'on_change',
            :type => 'event',
            :required => 'No',
            :default => '-',
            :description => 'Event to be fired when option is clicked. use it outside forms'
          },
          %{
            :name => 'value',
            :type => 'string',
            :required => 'No',
            :default => '-',
            :description => 'Value of the selected Option'
          }
        ]}
      />

      <PropsTable
        title="Radio.Option props"
        data={[
          %{
            :name => 'id',
            :type => 'string',
            :required => 'No',
            :default => '-',
            :description => 'Id for the DOM element'
          },
          %{
            :name => 'class',
            :type => 'css_class',
            :required => 'No',
            :default => '-',
            :description => 'Additional classes for tag'
          },
          %{
            :name => 'testid',
            :type => 'string',
            :required => 'No',
            :default => '-',
            :description => 'Attr data-testid for the DOM element'
          },
          %{
            :name => 'disabled',
            :type => 'boolean',
            :required => 'No',
            :default => 'false',
            :description => 'Whether the component is disabled'
          },
          %{
            :name => 'value',
            :type => 'string',
            :required => 'No',
            :default => '-',
            :description => 'Value of the Option'
          }
        ]}
      />

      <PropsTable
        title="Radio.Indicator props"
        data={[
          %{
            :name => 'id',
            :type => 'string',
            :required => 'No',
            :default => '-',
            :description => 'Id for the DOM element'
          },
          %{
            :name => 'class',
            :type => 'css_class',
            :required => 'No',
            :default => '-',
            :description => 'Additional classes for tag'
          },
          %{
            :name => 'testid',
            :type => 'string',
            :required => 'No',
            :default => '-',
            :description => 'Attr data-testid for the DOM element'
          }
        ]}
      />
    </Page>
    """
  end

  defp component_anatomy(:long) do
    """
    <Radio value="..." on_change="...">
      <Radio.Option value="...">
        <Radio.Indicator /> ...
      </Radio.Option>
      <Radio.Option value="...">
        <Radio.Indicator /> ...
      </Radio.Option>
    </Radio>
    """
  end

  defp component_anatomy(:short) do
    """
    <Radio value="..." on_change="..." options={...}/>
    """
  end

  defp component_anatomy(:form) do
    """
    <Form for={...} change="..." submit="...">
      <!-- No Field component needed - it's already inside -->
      <Radio value="..." on_change="..." options={...}/>
      <Button type="submit">...</Button>
    </Form>
    """
  end
end
