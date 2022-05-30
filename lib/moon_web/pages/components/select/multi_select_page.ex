defmodule MoonWeb.Pages.Components.Select.MultiSelectPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias Moon.Autolayouts.TopToDown
  alias Moon.Components.Form
  alias Moon.Components.Field
  alias Moon.Components.Heading
  alias Moon.Components.Select.MultiSelect
  alias MoonWeb.Components.ExampleAndCode
  alias MoonWeb.Components.Page
  alias MoonWeb.Pages.Tutorials.AddDataUsingForm.User
  alias MoonWeb.Components.Table.Table
  alias MoonWeb.Components.Table.Column

  data breadcrumbs, :any,
    default: [
      %{
        to: "#",
        name: "Components"
      },
      %{
        to: "/components/select/multi-select",
        name: "Multi Select"
      }
    ]

  data latest_params, :any, default: nil

  def mount(params, _session, socket) do
    user_changeset = User.changeset(%User{})

    {:ok,
     assign(socket,
       user_changeset: user_changeset,
       theme_name: params["theme_name"] || "sportsbet-dark",
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
        <Heading size={56} class="mb-4">Multi Select</Heading>

        <ExampleAndCode title="Multi Select with options as prop" id="multi_select_with_options_as_prop">
          <:example>
            <Form for={@user_changeset} change="form_update" submit="form_submit">
              <Field name={:permissions}>
                <MultiSelect
                  id="user-permissions-example-2"
                  options={User.available_permissions()}
                  prompt="Permission"
                />
              </Field>
            </Form>
          </:example>

          <:code>{code_for_multi_select_with_options_as_prop()}</:code>

          <:state>@user_changeset = {inspect(@user_changeset, pretty: true)}<br><br>@latest_params = {inspect(@latest_params, pretty: true)}</:state>
        </ExampleAndCode>

        <div>
          <div class="text-bulma-100 items-center text-xl leading-7 font-normal my-4">Props</div>
          <Table items={[
            %{
              :name => 'field',
              :type => 'atom ',
              :required => 'true',
              :default => '-',
              :description => 'Field for the underlying phoenix select component'
            },
            %{
              :name => 'size',
              :type => '-',
              :required => 'false',
              :default => '-',
              :description => 'TODO - size variant'
            },
            %{
              :name => 'options',
              :type => 'list',
              :required => 'true',
              :default => '-',
              :description => 'Options for the select'
            },
            %{
              :name => 'prompt',
              :type => 'string',
              :required => 'false',
              :default => '-',
              :description => 'Placeholder text'
            },
            %{
              :name => 'header',
              :type => 'slot',
              :required => 'false',
              :default => '-',
              :description => 'TODO - header element on the options popup'
            },
            %{
              :name => 'footer',
              :type => 'slot',
              :required => 'false',
              :default => '-',
              :description => 'TODO - footer element on the options popup'
            },
            %{
              :name => 'menu_width',
              :type => 'number',
              :required => 'false',
              :default => '-',
              :description => 'TODO - Minimum width of the popup menu containing options'
            },
            %{
              :name => 'left',
              :type => 'slot',
              :required => 'false',
              :default => '-',
              :description => 'TODO - Left content for selected option'
            },
            %{
              :name => 'hint',
              :type => 'slot',
              :required => 'false',
              :default => '-',
              :description => 'TODO - Inform message under select, can be used for error message'
            },
            %{
              :name => 'items',
              :type => 'slot',
              :required => 'true',
              :default => '-',
              :description => 'Content template for displaying each of the options'
            },
            %{
              :name => 'disabled',
              :type => 'boolean',
              :required => '-',
              :default => 'false',
              :description => 'Whether the component is disabled'
            },
            %{
              :name => 'value',
              :type => 'any',
              :required => 'false',
              :default => '-',
              :description => 'Default selected value'
            },
            %{
              :name => 'on_select',
              :type => 'string',
              :required => 'false',
              :default => '-',
              :description => 'Name of the event handler function when an option is clicked'
            },
            %{
              :name => 'is_error',
              :type => 'boolean',
              :required => 'false',
              :default => '-',
              :description => 'TODO - If the component is in error mode'
            }
          ]}>
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

  def handle_event(
        "form_update",
        params,
        socket
      ) do
    user_params = params["user"] || %{permissions: []}
    user_changeset = User.changeset(%User{}, user_params)

    {:noreply, assign(socket, user_changeset: user_changeset, latest_params: user_params)}
  end

  def handle_event(
        "form_submit",
        %{
          "user" => user_params
        },
        socket
      ) do
    user_changeset = User.changeset(%User{}, user_params)

    {:noreply, assign(socket, user_changeset: user_changeset)}
  end

  def code_for_multi_select_with_options_as_prop do
    """
    alias Moon.Components.Form
    alias Moon.Components.Field
    alias Moon.Components.Select.MultiSelect

    <Form for={@user_changeset} change="form_update" submit="form_submit">
      <Field name={:permissions}>
        <MultiSelect id="user-permissions" options={User.available_permissions()} border_radius_class="rounded-lg"/>
      </Field>
    </Form>

    def handle_event(
          "form_update",
          params,
          socket
        ) do
      user_params = params["user"] || %{permissions: []}
      user_changeset = User.changeset(%User{}, user_params)

      {:noreply, assign(socket, user_changeset: user_changeset, latest_params: user_params)}
    end
    """
  end
end
