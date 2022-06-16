defmodule MoonWeb.Pages.Components.Select.SingleSelectPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias Moon.Autolayouts.TopToDown
  alias Moon.Components.Form
  alias Moon.Components.Field
  alias Moon.Components.Heading
  alias Moon.Components.Select.SingleSelect
  alias Moon.Components.FieldLabel
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
        to: "/components/select/single-select",
        name: "Single Select"
      }
    ]

  data props_info_array, :list,
    default: [
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
    ]

  data latest_params, :any, default: nil

  def mount(params, _session, socket) do
    user_changeset = User.changeset(%User{})

    {:ok,
     assign(socket,
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
        <Heading size={56} class="mb-4">Single Select</Heading>

        <Context put={theme_class: @theme_name}>
          <ExampleAndCode
            title="Single Select with options as prop"
            id="single_select_with_options_as_prop"
          >
            <:example>
              <Form for={@user_changeset} change="form_update" submit="form_submit">
                <Field name={:role}>
                  <FieldLabel>Permissions</FieldLabel>
                  <SingleSelect popover_class="pt-2" id="user-roles-example-1" options={User.available_roles()} />
                </Field>
              </Form>
            </:example>

            <:code>{code_for_single_select_with_options_as_prop()}</:code>

            <:state>@user_changeset = {inspect(@user_changeset, pretty: true)}<br><br>@latest_params = {inspect(@latest_params, pretty: true)}</:state>
          </ExampleAndCode>

          <ExampleAndCode
            title="Single Select (prompt inside)"
            id="single_select_with_options_as_prop_and_prompt_inside"
          >
            <:example>
              <Form for={@user_changeset} change="form_update" submit="form_submit">
                <Field name={:role}>
                  <SingleSelect id="user-roles-example-2" options={User.available_roles()} prompt="Select role" />
                </Field>
              </Form>
            </:example>

            <:code>{code_for_single_select_with_options_as_prop_and_prompt_inside()}</:code>

            <:state>@user_changeset = {inspect(@user_changeset, pretty: true)}<br><br>@latest_params = {inspect(@latest_params, pretty: true)}</:state>
          </ExampleAndCode>

          <ExampleAndCode
            title="Single Select (selected with left_icon)"
            id="single_select_with_options_as_prop_and_left_icon"
          >
            <:example>
              <Form for={@user_changeset} change="form_update" submit="form_submit">
                <Field name={:role}>
                  <SingleSelect
                    id="user-roles-example-3"
                    options={User.available_roles_with_left_icon()}
                    prompt="Select role"
                  />
                </Field>
              </Form>
            </:example>

            <:code>{code_for_single_select_with_options_as_prop_and_left_icon()}</:code>

            <:state>@user_changeset = {inspect(@user_changeset, pretty: true)}<br><br>@latest_params = {inspect(@latest_params, pretty: true)}</:state>
          </ExampleAndCode>

          <ExampleAndCode
            title="Single Select (selected with left_icon `flag`)"
            id="single_select_with_options_as_prop_and_left_icon_flag"
          >
            <:example>
              <Form for={@user_changeset} change="form_update" submit="form_submit">
                <Field name={:role}>
                  <SingleSelect
                    id="user-roles-example-5"
                    options={User.available_roles_with_left_icon_flag()}
                    prompt="Select role"
                  />
                </Field>
              </Form>
            </:example>

            <:code>{code_for_single_select_with_options_as_prop_and_left_icon_flag()}</:code>

            <:state>@user_changeset = {inspect(@user_changeset, pretty: true)}<br><br>@latest_params = {inspect(@latest_params, pretty: true)}</:state>
          </ExampleAndCode>

          <ExampleAndCode
            title="Single Select (selected with right_icon)"
            id="single_select_with_options_as_prop_and_right_icon"
          >
            <:example>
              <Form for={@user_changeset} change="form_update" submit="form_submit">
                <Field name={:role}>
                  <SingleSelect
                    id="user-roles-example-4"
                    options={User.available_roles_with_right_icon()}
                    prompt="Select role"
                  />
                </Field>
              </Form>
            </:example>

            <:code>{code_for_single_select_with_options_as_prop_and_right_icon()}</:code>

            <:state>@user_changeset = {inspect(@user_changeset, pretty: true)}<br><br>@latest_params = {inspect(@latest_params, pretty: true)}</:state>
          </ExampleAndCode>

          <Heading size={48} class="mb-4">Sizes</Heading>

          <ExampleAndCode title="Small" id="single_select_sizes_small">
            <:example>
              <div class="flex flex-col gap-4">
                <Form for={@user_changeset} change="form_update" submit="form_submit">
                  <Field name={:role}>
                    <FieldLabel>Permissions</FieldLabel>
                    <SingleSelect
                      popover_class="pt-2"
                      id="user-roles-example-17"
                      options={User.available_roles()}
                      size="small"
                    />
                  </Field>
                </Form>
                <Form for={@user_changeset} change="form_update" submit="form_submit">
                  <Field name={:role}>
                    <SingleSelect
                      id="user-roles-example-6"
                      options={User.available_roles()}
                      prompt="Select role"
                      size="small"
                    />
                  </Field>
                </Form>
                <Form for={@user_changeset} change="form_update" submit="form_submit">
                  <Field name={:role}>
                    <SingleSelect
                      id="user-roles-example-7"
                      options={User.available_roles_with_left_icon()}
                      prompt="Select role"
                      size="small"
                    />
                  </Field>
                </Form>
              </div>
            </:example>
          </ExampleAndCode>

          <ExampleAndCode title="Medium" id="single_select_sizes_medium">
            <:example>
              <div class="flex flex-col gap-4">
                <Form for={@user_changeset} change="form_update" submit="form_submit">
                  <Field name={:role}>
                    <FieldLabel>Permissions</FieldLabel>
                    <SingleSelect popover_class="pt-2" id="user-roles-example-8" options={User.available_roles()} />
                  </Field>
                </Form>
                <Form for={@user_changeset} change="form_update" submit="form_submit">
                  <Field name={:role}>
                    <SingleSelect id="user-roles-example-9" options={User.available_roles()} prompt="Select role" />
                  </Field>
                </Form>
                <Form for={@user_changeset} change="form_update" submit="form_submit">
                  <Field name={:role}>
                    <SingleSelect
                      id="user-roles-example-10"
                      options={User.available_roles_with_left_icon()}
                      prompt="Select role"
                    />
                  </Field>
                </Form>
              </div>
            </:example>
          </ExampleAndCode>

          <ExampleAndCode title="Large" id="single_select_sizes_large">
            <:example>
              <div class="flex flex-col gap-4">
                <Form for={@user_changeset} change="form_update" submit="form_submit">
                  <Field name={:role}>
                    <FieldLabel>Permissions</FieldLabel>
                    <SingleSelect
                      popover_class="pt-2"
                      id="user-roles-example-11"
                      options={User.available_roles()}
                      size="large"
                    />
                  </Field>
                </Form>
                <Form for={@user_changeset} change="form_update" submit="form_submit">
                  <Field name={:role}>
                    <SingleSelect
                      id="user-roles-example-12"
                      options={User.available_roles()}
                      prompt="Select role"
                      size="large"
                    />
                  </Field>
                </Form>
                <Form for={@user_changeset} change="form_update" submit="form_submit">
                  <Field name={:role}>
                    <SingleSelect
                      id="user-roles-example-13"
                      options={User.available_roles_with_left_icon()}
                      prompt="Select role"
                      size="large"
                    />
                  </Field>
                </Form>
              </div>
            </:example>
          </ExampleAndCode>

          <ExampleAndCode title="Xlarge" id="single_select_sizes_xlarge">
            <:example>
              <div class="flex flex-col gap-4">
                <Form for={@user_changeset} change="form_update" submit="form_submit">
                  <Field name={:role}>
                    <FieldLabel>Permissions</FieldLabel>
                    <SingleSelect
                      popover_class="pt-2"
                      id="user-roles-example-14"
                      options={User.available_roles()}
                      size="xlarge"
                    />
                  </Field>
                </Form>
                <Form for={@user_changeset} change="form_update" submit="form_submit">
                  <Field name={:role}>
                    <SingleSelect
                      id="user-roles-example-15"
                      options={User.available_roles()}
                      prompt="Select role"
                      size="xlarge"
                    />
                  </Field>
                </Form>
                <Form for={@user_changeset} change="form_update" submit="form_submit">
                  <Field name={:role}>
                    <SingleSelect
                      id="user-roles-example-16"
                      options={User.available_roles_with_left_icon()}
                      prompt="Select role"
                      size="xlarge"
                    />
                  </Field>
                </Form>
              </div>
            </:example>
          </ExampleAndCode>

          <ExampleAndCode
            title="Disabled"
            id="single_select_disabled"
          >
            <:example>
              <Form for={@user_changeset} change="form_update" submit="form_submit">
                <Field name={:role}>
                  <FieldLabel>Permissions</FieldLabel>
                  <SingleSelect popover_class="pt-2" id="user-roles-example-disabled" options={User.available_roles()} disabled={true} />
                </Field>
              </Form>
            </:example>

            <:code>{code_for_disabled()}</:code>

            <:state>@user_changeset = {inspect(@user_changeset, pretty: true)}<br><br>@latest_params = {inspect(@latest_params, pretty: true)}</:state>
          </ExampleAndCode>
        </Context>
        <div>
          <div class="text-bulma-100 items-center text-moon-20 font-normal my-4">Props</div>
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

  def handle_event(
        "form_update",
        %{
          "user" => user_params
        },
        socket
      ) do
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

  def code_for_single_select_with_options_as_prop do
    """
    alias Moon.Components.Select.SingleSelect

    <Form for={@user_changeset} change="form_update" submit="form_submit">
      <Field name={:role}>
        <FieldLabel>Permissions</FieldLabel>
        <SingleSelect popover_class="pt-2" id="user-roles-example-1" options={User.available_roles()} />
      </Field>
    </Form>
    """
  end

  def code_for_single_select_with_options_as_prop_and_prompt_inside do
    """
    alias Moon.Components.Select.SingleSelect

    <Form for={@user_changeset} change="form_update" submit="form_submit">
      <Field name={:role}>
        <SingleSelect id="user-roles-example-2" options={User.available_roles()} prompt="Select role" />
      </Field>
    </Form>
    """
  end

  def code_for_single_select_with_options_as_prop_and_left_icon do
    """
    alias Moon.Components.Select.SingleSelect
    <Form for={@user_changeset} change="form_update" submit="form_submit">
      <Field name={:role}>
        <SingleSelect
          id="user-roles-example-3"
          options={User.available_roles_with_left_icon()}
          prompt="Select role"
        />
      </Field>
    </Form>
    """
  end

  def code_for_single_select_with_options_as_prop_and_right_icon do
    """
    alias Moon.Components.Select.SingleSelect
    <Form for={@user_changeset} change="form_update" submit="form_submit">
      <Field name={:role}>
        <SingleSelect
          id="user-roles-example-4"
          options={User.available_roles_with_right_icon()}
          prompt="Select role"
        />
      </Field>
    </Form>
    """
  end

  def code_for_single_select_with_options_as_prop_and_left_icon_flag do
    """
    alias Moon.Components.Select.SingleSelect
    <Form for={@user_changeset} change="form_update" submit="form_submit">
      <Field name={:role}>
        <SingleSelect
          id="user-roles-example-3"
          options={User.available_roles_with_left_icon_flag()}
          prompt="Select role"
        />
      </Field>
    </Form>
    """
  end

  def code_for_disabled do
    """
    alias Moon.Components.Select.SingleSelect

    <Form for={@user_changeset} change="form_update" submit="form_submit">
      <Field name={:role}>
        <FieldLabel>Permissions</FieldLabel>
        <SingleSelect popover_class="pt-2" id="user-roles-example-1" options={User.available_roles()} />
      </Field>
    </Form>
    """
  end
end
