defmodule MoonWeb.Pages.Design.DropdownPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias MoonWeb.Components.Anatomy
  alias MoonWeb.Components.Page
  alias MoonWeb.Components.ComponentPageDescription
  alias MoonWeb.Components.PropsTable
  alias MoonWeb.Components.ExamplesList

  alias Moon.Design.Tabs

  alias MoonWeb.Examples.Design.DropdownExample

  data(breadcrumbs, :any,
    default: [
      %{
        to: "/components",
        name: "Components"
      },
      %{
        to: "/components/v2/dropdown",
        name: "Dropdown"
      }
    ]
  )

  def handle_params(_params, uri, socket) do
    {:noreply, assign(socket, uri: uri)}
  end

  def render(assigns) do
    ~F"""
    <Page {=@theme_name} {=@active_page} {=@breadcrumbs} {=@direction}>
      <ComponentPageDescription
        title="Dropdown"
        is_aria_support
        is_rtl_support
        is_in_progress
        image="facing/components/dropdown.png"
      >
        <p>
          Dropdowns is a custom select component that allows users to make single or multiple selections.</p>
        <p>
          An option that's been selected can represent a corresponding value in
          forms or be used to filter/sort content.
        </p>
      </ComponentPageDescription>

      <Tabs id="anatomy-tabs" class="justify-between gap-6">
        <h2 class="text-moon-24 font-medium">Anatomy</h2>
        <Tabs.List tab_titles={["Long syntax", "Short syntax", "Form"]} class="w-auto" />
        <Tabs.Panels>
          <Tabs.Panel><Anatomy title={false}>{component_anatomy(:long)}</Anatomy></Tabs.Panel>
          <Tabs.Panel><Anatomy title={false}>{component_anatomy(:short)}</Anatomy></Tabs.Panel>
          <Tabs.Panel><Anatomy title={false}>{component_anatomy(:form)}</Anatomy></Tabs.Panel>
        </Tabs.Panels>
      </Tabs>

      <ExamplesList examples={[
        DropdownExample.Default,
        DropdownExample.TriggerElements,
        DropdownExample.OptionLayouts,
        DropdownExample.Positions,
        DropdownExample.Sizes,
        DropdownExample.Select,
        DropdownExample.SelectStates,
        DropdownExample.Multiselect,
        DropdownExample.CustomSelect,
        DropdownExample.Combobox
      ]} />

      <PropsTable module={Moon.Design.Dropdown} />
      <PropsTable module={Moon.Design.Dropdown.Options} />
      <PropsTable module={Moon.Design.Dropdown.Trigger} />
      <PropsTable module={Moon.Design.Dropdown.Option} />
      <PropsTable module={Moon.Design.Form.Dropdown} />
      <PropsTable module={Moon.Design.Dropdown.Select} />
    </Page>
    """
  end

  def component_anatomy(:short) do
    """
    <Dropdown>
      <Dropdown.Options titles={["...", "...", "..."]}>
      <Dropdown.Trigger>...</Dropdown.Trigger>
    </Dropdown>
    """
  end

  def component_anatomy(:long) do
    """
    <Dropdown>
      <Dropdown.Options>
        <Dropdown.Option>...</Dropdown.Option>
        <Dropdown.Option>...</Dropdown.Option>
        <Dropdown.Option>...</Dropdown.Option>
      </Dropdown.Options>
      <Dropdown.Trigger>...</Dropdown.Trigger>
    </Dropdown>
    """
  end

  def component_anatomy(:form) do
    """
    <Form>
      <Form.Field>
        <Dropdown options={...} />
      </Form.Field>
    </Form>
    """
  end
end
