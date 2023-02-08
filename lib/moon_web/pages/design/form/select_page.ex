defmodule MoonWeb.Pages.Design.Form.SelectPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias Moon.Design.Form
  alias Moon.Design.Form.Select
  alias MoonWeb.Components.ExampleAndCode
  alias MoonWeb.Pages.Tutorials.AddDataUsingForm.User


  alias MoonWeb.Components.Page
  alias MoonWeb.Components.ExamplesList
  alias MoonWeb.Components.ComponentPageDescription
  alias MoonWeb.Components.PropsTable
  alias MoonWeb.Examples.Form.SelectExample

  data(gender_options, :list, default: [
    [key: "Female", value: "female"],
    [key: "Male", value: "male"],
    [key: "Invalid choice", value: "invalid"],
    [key: "I identify as God and this is not important", value: "god", disabled: true]
  ])

  data(user_changeset, :any, default: User.changeset(%User{}))

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
        to: "/components/v2/select",
        name: "Select"
      }
    ]
  )

  def render(assigns) do
    ~F"""
    <Page {=@theme_name} {=@active_page} {=@breadcrumbs} {=@direction}>
      <ComponentPageDescription title="Select" is_in_progress>
        A browser-controlled menu of options for forms, navigation and more.
      </ComponentPageDescription>

      <ExamplesList examples={[SelectExample.Default]}/>

      <ExampleAndCode title="Example" id="select_1">
        <:example>
          <Form for={@user_changeset}>
            <Select field={:gender} options={@gender_options} prompt="Please select gender" />
          </Form>
        </:example>

        <:code>{select_1_code()}</:code>
      </ExampleAndCode>

      <ExampleAndCode title="With Label" id="select_2">
        <:example>
          <Form for={@user_changeset}>
            <Select label="Gender" field={:gender} options={@gender_options} prompt="Please select gender" />
          </Form>
        </:example>

        <:code>{select_2_code()}</:code>
      </ExampleAndCode>

      <ExampleAndCode title="Disabled" id="select_3">
        <:example>
          <Form for={@user_changeset}>
            <Select
              disabled
              label="Gender"
              field={:gender}
              options={@gender_options}
              prompt="Please select gender"
            />
          </Form>
        </:example>

        <:code>{select_3_code()}</:code>
      </ExampleAndCode>

      <PropsTable data={[
        %{
          :name => 'field',
          :type => 'atom',
          :required => 'Yes',
          :default => '-',
          :description => 'Field name for underlying surface select component'
        },
        %{
          :name => 'label',
          :type => 'string',
          :required => 'Yes',
          :default => '-',
          :description => 'Label title'
        },
        %{
          :name => 'prompt',
          :type => 'string',
          :required => 'No',
          :default => '-',
          :description => 'Placeholder'
        },
        %{
          :name => 'disabled',
          :type => 'boolean',
          :required => 'No',
          :default => 'false',
          :description => 'Whether the component is disabled'
        }
      ]} />
    </Page>
    """
  end

  def select_1_code do
    """
    alias Moon.Components.Select

    <Form for={@user_changeset}>
      <Select field={:gender} options={@gender_options} prompt="Please select gender" />
    </Form>
    """
  end

  def select_2_code do
    """
    alias Moon.Components.Select

    <Form for={@user_changeset}>
      <Select label="Gender" field={:gender} options={@gender_options} prompt="Please select gender" />
    </Form>
    """
  end

  def select_3_code do
    """
    alias Moon.Components.Select

    <Select
      disabled
      label="Gender"
      field={:gender}
      options={@gender_options}
      prompt="Please select gender"
    />
    """
  end
end
