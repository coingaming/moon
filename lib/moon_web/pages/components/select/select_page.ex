defmodule MoonWeb.Pages.Components.Select.SelectPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias Moon.Components.Form
  alias Moon.Components.Select
  alias MoonWeb.Components.ExampleAndCode
  alias MoonWeb.Components.Page
  alias MoonWeb.Pages.Tutorials.AddDataUsingForm.User
  alias MoonWeb.Components.ComponentPageDescription
  alias MoonWeb.Components.PropsTable

  data(gender_options, :any)

  data(breadcrumbs, :any,
    default: [
      %{
        to: "#",
        name: "Components"
      },
      %{
        to: "/components/select",
        name: "Select"
      }
    ]
  )

  data(props_info_array, :list,
    default: [
      %{
        :name => 'field',
        :type => 'atom',
        :required => 'true',
        :default => '-',
        :description => 'Field name for underlying surface select component'
      },
      %{
        :name => 'label',
        :type => 'string',
        :required => 'true',
        :default => '-',
        :description => 'Label title'
      },
      %{
        :name => 'prompt',
        :type => 'string',
        :required => 'false',
        :default => '-',
        :description => 'Placeholder'
      },
      %{
        :name => 'disabled',
        :type => 'boolean',
        :required => 'false',
        :default => 'false',
        :description => 'Whether the component is disabled'
      }
    ]
  )

  def mount(_params, _session, socket) do
    gender_options = [
      [key: "Female", value: "female"],
      [key: "Male", value: "male"],
      [key: "Invalid choice", value: "invalid"],
      [key: "I identify as God and this is not important", value: "god", disabled: true]
    ]

    user_changeset = User.changeset(%User{})

    {:ok,
     assign(socket,
       gender_options: gender_options,
       user_changeset: user_changeset
     )}
  end

  def handle_params(_params, uri, socket) do
    {:noreply, assign(socket, uri: uri)}
  end

  def render(assigns) do
    ~F"""
    <Page {=@theme_name} {=@active_page} {=@breadcrumbs} {=@direction}>
      <ComponentPageDescription title="Select">
        <p>
          A user-controlled menu of options for forms, navigation and more.
        </p>
      </ComponentPageDescription>

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

      <PropsTable data={@props_info_array} />
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
