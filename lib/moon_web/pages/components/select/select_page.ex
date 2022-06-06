defmodule MoonWeb.Pages.Components.Select.SelectPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias Moon.Autolayouts.TopToDown
  alias Moon.Components.Form
  alias Moon.Components.Heading
  alias Moon.Components.Link
  alias Moon.Components.Select
  alias MoonWeb.Components.ExampleAndCode
  alias MoonWeb.Components.Page
  alias MoonWeb.Pages.Tutorials.AddDataUsingForm.User
  alias MoonWeb.Components.Table.Table
  alias MoonWeb.Components.Table.Column

  data(gender_options, :any)

  data breadcrumbs, :any,
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

  data props_info_array, :list,
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

  def mount(params, _session, socket) do
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
       user_changeset: user_changeset,
       theme_name: params["theme_name"] || "moon-design-light",
       active_page: __MODULE__
     )}
  end

  def handle_params(_params, uri, socket) do
    {:noreply, assign(socket, uri: uri)}
  end

  def render(assigns) do
    ~F"""
    <Page theme_name={@theme_name} active_page={@active_page} breadcrumbs={@breadcrumbs}>
      <TopToDown>
        <Heading size={56} class="mb-4">Select</Heading>
        <p>
          <Link to="https://www.figma.com/file/d5oitzaWXGiOuMjKDatC1W/Lab---Templates?node-id=574%3A8496">Figma design</Link>
          <Link to="https://github.com/coingaming/moon/blob/main/lib/moon_web/pages/components/select_page.ex">Sourcecode of this page</Link>
          <Link to="https://moon.io/components/select">React implementation</Link>
        </p>
        <p>
          <Heading size={20} class="mt-4">Select</Heading>
          A user-controlled menu of options for forms, navigation and more.
        </p>

        <Context put={theme_class: @theme_name}>
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
        </Context>

        <div>
          <div class="text-bulma-100 items-center text-xl leading-7 font-normal my-4">Props</div>
          <Table items={@props_info_array}>
            <Column name="name" label="Name" :let={item: item} is_row_header>
              {item.name}
            </Column>
            <Column name="type" label="Type" :let={item: item}>
              {item.type}
            </Column>
            <Column name="required" label="Required" :let={item: item}>
              {item.required}
            </Column>
            <Column name="default" label="Default" :let={item: item}>
              {item.default}
            </Column>
            <Column name="description" label="Description" :let={item: item}>
              {item.description}
            </Column>
          </Table>
        </div>
      </TopToDown>
    </Page>
    """
  end

  def select_1_code do
    """
    <Form for={@user_changeset}>
      <Select field={:gender} options={@gender_options} prompt="Please select gender" />
    </Form>
    """
  end

  def select_2_code do
    """
    <Form for={@user_changeset}>
      <Select label="Gender" field={:gender} options={@gender_options} prompt="Please select gender" />
    </Form>
    """
  end

  def select_3_code do
    """
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
