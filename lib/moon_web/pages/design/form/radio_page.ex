defmodule MoonWeb.Pages.Design.Form.RadioPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias MoonWeb.Components.Page
  alias MoonWeb.Components.ComponentPageDescription
  alias MoonWeb.Examples.Design.Form.RadioExample
  alias MoonWeb.Components.ExamplesList
  alias MoonWeb.Components.PropsTable
  alias MoonWeb.Components.Anatomy
  alias Moon.Design.Tabs

  data(breadcrumbs, :any,
    default: [
      %{
        to: "#",
        name: "Components"
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

      <PropsTable module={Moon.Design.Form.Radio} />
      <PropsTable module={Moon.Design.Form.Radio.Button} />
      <PropsTable module={Moon.Design.Form.Radio.Indicator} />
    </Page>
    """
  end

  defp component_anatomy(:long) do
    """
    <Radio value="..." on_change="...">
      <Radio.Button value="...">
        <Radio.Indicator /> ...
      </Radio.Button>
      <Radio.Button value="...">
        <Radio.Indicator /> ...
      </Radio.Button>
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
