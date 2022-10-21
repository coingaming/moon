defmodule MoonWeb.Pages.Components.Select.SingleSelectPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias Moon.Components.Form
  alias Moon.Components.Field
  alias Moon.Components.Select.SingleSelect
  alias MoonWeb.Components.ExampleAndCode
  alias MoonWeb.Components.Page
  alias MoonWeb.Pages.Tutorials.AddDataUsingForm.User
  alias MoonWeb.Components.ComponentPageDescription
  alias MoonWeb.Components.PropsTable
  alias Moon.Components.Button

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
        :name => 'id',
        :type => 'string ',
        :required => 'true',
        :default => '-',
        :description => ''
      },
      %{
        :name => 'label',
        :type => 'string',
        :required => 'false',
        :default => '-',
        :description => ''
      },
      %{
        :name => 'options',
        :type => 'list',
        :required => 'true',
        :default => '-',
        :description => 'Options for the select'
      },
      %{
        :name => 'value',
        :type => 'any',
        :required => 'false',
        :default => '-',
        :description => 'Default selected value'
      },
      %{
        :name => 'disabled',
        :type => 'boolean',
        :required => 'false',
        :default => 'false',
        :description => 'Whether the component is disabled'
      },
      %{
        :name => 'size',
        :type => 'sm | md | lg | xl',
        :required => 'false',
        :default => 'md',
        :description => 'Size variant'
      },
      %{
        :name => 'popover_placement',
        :type =>
          'top-start | top | top-end | right-start | right | right-end | bottom-start | bottom | bottom-end | left-start | left | left-end',
        :required => '-',
        :default => 'bottom-start',
        :description => 'Location of where the dropdown appears'
      },
      %{
        :name => 'popover_class',
        :type => 'string',
        :required => 'false',
        :default => '-',
        :description => 'Css class for the dropdown'
      },
      %{
        :name => 'placeholder',
        :type => 'string',
        :required => 'false',
        :default => '-',
        :description => 'String to display when there is no value selected'
      },
      %{
        :name => 'background_color',
        :type => 'string ',
        :required => 'false',
        :default => 'gohan-100',
        :description => ''
      },
      %{
        :name => 'hint_text_slot',
        :type => 'slot',
        :required => 'false',
        :default => '-',
        :description => 'Inform message under select'
      },
      %{
        :name => 'has_error',
        :type => 'boolean',
        :required => 'false',
        :default => '-',
        :description => 'If the component is in error mode'
      },
      %{
        :name => 'use_error_tag',
        :type => 'boolean',
        :required => 'false',
        :default => '-',
        :description => 'Whether to use the built in ErrorTag in place of the hint slot'
      },
      %{
        :name => 'selected_value_class',
        :type => 'css_class',
        :required => 'false',
        :default => '-',
        :description => 'Css class for the displayed selected value'
      }
    ]

  data latest_params, :any, default: nil
  data latest_params2, :any, default: nil

  def mount(_params, _session, socket) do
    user_changeset = User.changeset(%User{})

    gender_options = [
      %{label: "Female", value: "female"},
      %{label: "Male", value: "male"},
      %{label: "Invalid choice", value: "invalid"},
      %{label: "I identify as God and this is not important", value: "god", disabled: true}
    ]

    user_changeset2 = User.changeset(%User{}, %{})

    user = %User{}

    {:ok,
     assign(socket,
       user: user,
       user_changeset: user_changeset,
       gender_options: gender_options,
       user_changeset2: user_changeset2
     )}
  end

  def handle_params(_params, uri, socket) do
    {:noreply, assign(socket, uri: uri)}
  end

  def render(assigns) do
    ~F"""
    <Page {=@theme_name} {=@active_page} {=@breadcrumbs} {=@direction}>
      <ComponentPageDescription title="Single Select" />

      <ExampleAndCode title="Default" id="single_select_default">
        <:example>
          <Form for={@user_changeset} change="form_update" submit="form_submit">
            <Field name={:role}>
              <SingleSelect
                id="user-roles-example-1"
                options={User.available_roles()}
                placeholder="Select a role"
              />
            </Field>
          </Form>
        </:example>

        <:code>{code_for_single_select_default()}</:code>

        <:state>@user_changeset = {inspect(@user_changeset, pretty: true)}<br><br>@latest_params = {inspect(@latest_params, pretty: true)}</:state>
      </ExampleAndCode>

      <ExampleAndCode title="Sizes" id="single_select_sizes">
        <:example>
          <Form for={@user_changeset} change="form_update" submit="form_submit">
            <Field name={:role}>
              <SingleSelect
                id="user-roles-example-10-0"
                options={User.available_roles()}
                label="Role"
                placeholder="Select a role"
                size="sm"
              />
            </Field>
          </Form>
          <Form for={@user_changeset} change="form_update" submit="form_submit">
            <Field name={:role}>
              <SingleSelect
                id="user-roles-example-10-1"
                options={User.available_roles()}
                label="Role"
                placeholder="Select a role"
              />
            </Field>
          </Form>
          <Form for={@user_changeset} change="form_update" submit="form_submit">
            <Field name={:role}>
              <SingleSelect
                id="user-roles-example-10-2"
                options={User.available_roles()}
                label="Role"
                placeholder="Select a role"
                size="lg"
              />
            </Field>
          </Form>
          <Form for={@user_changeset} change="form_update" submit="form_submit">
            <Field name={:role}>
              <SingleSelect
                id="user-roles-example-10-3"
                options={User.available_roles()}
                label="Role"
                placeholder="Select a role"
                size="xl"
              />
            </Field>
          </Form>
        </:example>

        <:code>{code_for_single_select_sizes()}</:code>

        <:state>@user_changeset = {inspect(@user_changeset, pretty: true)}<br><br>@latest_params = {inspect(@latest_params, pretty: true)}</:state>
      </ExampleAndCode>

      <ExampleAndCode title="Left Icon" id="single_select_with_options_as_prop_and_left_icon_flag">
        <:example>
          <Form for={@user_changeset} change="form_update" submit="form_submit">
            <Field name={:role}>
              <SingleSelect
                id="user-roles-example-5-0"
                options={User.available_roles_with_left_icon_flag()}
                label="Role"
                placeholder="Select a role"
                size="sm"
              />
            </Field>
          </Form>
          <Form for={@user_changeset} change="form_update" submit="form_submit">
            <Field name={:role}>
              <SingleSelect
                id="user-roles-example-5-1"
                options={User.available_roles_with_left_icon_flag()}
                label="Role"
                placeholder="Select a role"
              />
            </Field>
          </Form>
          <Form for={@user_changeset} change="form_update" submit="form_submit">
            <Field name={:role}>
              <SingleSelect
                id="user-roles-example-5-2"
                options={User.available_roles_with_left_icon_flag()}
                label="Role"
                size="lg"
                placeholder="Select a role"
              />
            </Field>
          </Form>
          <Form for={@user_changeset} change="form_update" submit="form_submit">
            <Field name={:role}>
              <SingleSelect
                id="user-roles-example-5-3"
                options={User.available_roles_with_left_icon_flag()}
                label="Role"
                size="xl"
                placeholder="Select a role"
              />
            </Field>
          </Form>
        </:example>

        <:code>{code_for_single_select_with_options_as_prop_and_left_icon_flag()}</:code>

        <:state>@user_changeset = {inspect(@user_changeset, pretty: true)}<br><br>@latest_params = {inspect(@latest_params, pretty: true)}</:state>
      </ExampleAndCode>

      <ExampleAndCode title="Right icon" id="single_select_with_options_as_prop_and_right_icon">
        <:example>
          <Form for={@user_changeset} change="form_update" submit="form_submit">
            <Field name={:role}>
              <SingleSelect
                id="user-roles-example-4-0"
                options={User.available_roles_with_right_icon()}
                label="Role"
                placeholder="Select a role"
                size="sm"
              />
            </Field>
          </Form>
          <Form for={@user_changeset} change="form_update" submit="form_submit">
            <Field name={:role}>
              <SingleSelect
                id="user-roles-example-4-1"
                options={User.available_roles_with_right_icon()}
                label="Role"
                placeholder="Select a role"
              />
            </Field>
          </Form>
          <Form for={@user_changeset} change="form_update" submit="form_submit">
            <Field name={:role}>
              <SingleSelect
                id="user-roles-example-4-2"
                options={User.available_roles_with_right_icon()}
                label="Role"
                placeholder="Select a role"
                size="lg"
              />
            </Field>
          </Form>
          <Form for={@user_changeset} change="form_update" submit="form_submit">
            <Field name={:role}>
              <SingleSelect
                id="user-roles-example-4-3"
                options={User.available_roles_with_right_icon()}
                label="Role"
                placeholder="Select a role"
                size="xl"
              />
            </Field>
          </Form>
        </:example>

        <:code>{code_for_single_select_with_options_as_prop_and_right_icon()}</:code>

        <:state>@user_changeset = {inspect(@user_changeset, pretty: true)}<br><br>@latest_params = {inspect(@latest_params, pretty: true)}</:state>
      </ExampleAndCode>

      <ExampleAndCode title="Both icons" id="single_select_with_options_as_prop_and_both_icons">
        <:example>
          <Form for={@user_changeset} change="form_update" submit="form_submit">
            <Field name={:role}>
              <SingleSelect
                id="user-roles-example-6-0"
                options={User.available_roles_with_left_icon_flag_and_right_icon()}
                label="Role"
                placeholder="Select a role"
                size="sm"
              />
            </Field>
          </Form>
          <Form for={@user_changeset} change="form_update" submit="form_submit">
            <Field name={:role}>
              <SingleSelect
                id="user-roles-example-6-1"
                options={User.available_roles_with_left_icon_flag_and_right_icon()}
                label="Role"
                placeholder="Select a role"
              />
            </Field>
          </Form>
          <Form for={@user_changeset} change="form_update" submit="form_submit">
            <Field name={:role}>
              <SingleSelect
                id="user-roles-example-6-2"
                options={User.available_roles_with_left_icon_flag_and_right_icon()}
                label="Role"
                placeholder="Select a role"
                size="lg"
              />
            </Field>
          </Form>
          <Form for={@user_changeset} change="form_update" submit="form_submit">
            <Field name={:role}>
              <SingleSelect
                id="user-roles-example-6-3"
                options={User.available_roles_with_left_icon_flag_and_right_icon()}
                label="Role"
                placeholder="Select a role"
                size="xl"
              />
            </Field>
          </Form>
        </:example>

        <:code>{code_for_single_select_with_options_as_prop_and_both_icons()}</:code>

        <:state>@user_changeset = {inspect(@user_changeset, pretty: true)}<br><br>@latest_params = {inspect(@latest_params, pretty: true)}</:state>
      </ExampleAndCode>

      <ExampleAndCode title="Disabled" id="single_select_disabled">
        <:example>
          <Form for={@user_changeset} change="form_update" submit="form_submit">
            <Field name={:role}>
              <SingleSelect
                popover_class="pt-2"
                id="user-roles-example-disabled-0"
                options={User.available_roles()}
                disabled
                label="Role"
                placeholder="Select a role"
                size="sm"
              />
            </Field>
          </Form>
          <Form for={@user_changeset} change="form_update" submit="form_submit">
            <Field name={:role}>
              <SingleSelect
                popover_class="pt-2"
                id="user-roles-example-disabled-1"
                options={User.available_roles()}
                disabled
                label="Role"
                placeholder="Select a role"
              />
            </Field>
          </Form>
          <Form for={@user_changeset} change="form_update" submit="form_submit">
            <Field name={:role}>
              <SingleSelect
                popover_class="pt-2"
                id="user-roles-example-disabled-2"
                options={User.available_roles()}
                disabled
                label="Role"
                placeholder="Select a role"
                size="lg"
              />
            </Field>
          </Form>
          <Form for={@user_changeset} change="form_update" submit="form_submit">
            <Field name={:role}>
              <SingleSelect
                popover_class="pt-2"
                id="user-roles-example-disabled-3"
                options={User.available_roles()}
                disabled
                label="Role"
                placeholder="Select a role"
                size="xl"
              />
            </Field>
          </Form>
        </:example>

        <:code>{code_for_disabled()}</:code>

        <:state>@user_changeset = {inspect(@user_changeset, pretty: true)}<br><br>@latest_params = {inspect(@latest_params, pretty: true)}</:state>
      </ExampleAndCode>

      <ExampleAndCode title="Hint text" id="single_select_hint_text">
        <:example>
          <Form for={@user_changeset} change="form_update" submit="form_submit">
            <Field name={:role}>
              <SingleSelect
                popover_class="pt-2"
                id="user-roles-example-hint-0"
                options={User.available_roles()}
                label="Role"
                placeholder="Select a role"
                size="sm"
              >
                <:hint_text_slot>Informative Message Handler</:hint_text_slot>
              </SingleSelect>
            </Field>
          </Form>
          <Form for={@user_changeset} change="form_update" submit="form_submit">
            <Field name={:role}>
              <SingleSelect
                popover_class="pt-2"
                id="user-roles-example-hint-1"
                options={User.available_roles()}
                label="Role"
                placeholder="Select a role"
              >
                <:hint_text_slot>Informative Message Handler</:hint_text_slot>
              </SingleSelect>
            </Field>
          </Form>
          <Form for={@user_changeset} change="form_update" submit="form_submit">
            <Field name={:role}>
              <SingleSelect
                popover_class="pt-2"
                id="user-roles-example-hint-2"
                options={User.available_roles()}
                label="Role"
                placeholder="Select a role"
                size="lg"
              >
                <:hint_text_slot>Informative Message Handler</:hint_text_slot>
              </SingleSelect>
            </Field>
          </Form>
          <Form for={@user_changeset} change="form_update" submit="form_submit">
            <Field name={:role}>
              <SingleSelect
                popover_class="pt-2"
                id="user-roles-example-hint-3"
                options={User.available_roles()}
                label="Role"
                placeholder="Select a role"
                size="xl"
              >
                <:hint_text_slot>Informative Message Handler</:hint_text_slot>
              </SingleSelect>
            </Field>
          </Form>
        </:example>

        <:code>{code_for_hint()}</:code>

        <:state>@user_changeset = {inspect(@user_changeset, pretty: true)}<br><br>@latest_params = {inspect(@latest_params, pretty: true)}</:state>
      </ExampleAndCode>

      <ExampleAndCode title="Error" id="single_select_error">
        <:example>
          <Form for={@user_changeset} change="form_update" submit="form_submit">
            <Field name={:role}>
              <SingleSelect
                popover_class="pt-2"
                id="user-roles-example-error-0"
                options={User.available_roles()}
                label="Role"
                has_error
                placeholder="Select a role"
                size="sm"
              >
                <:hint_text_slot>Informative Message Handler</:hint_text_slot>
              </SingleSelect>
            </Field>
          </Form>
          <Form for={@user_changeset} change="form_update" submit="form_submit">
            <Field name={:role}>
              <SingleSelect
                popover_class="pt-2"
                id="user-roles-example-error-1"
                options={User.available_roles()}
                label="Role"
                has_error
                placeholder="Select a role"
              >
                <:hint_text_slot>Informative Message Handler</:hint_text_slot>
              </SingleSelect>
            </Field>
          </Form>
          <Form for={@user_changeset} change="form_update" submit="form_submit">
            <Field name={:role}>
              <SingleSelect
                popover_class="pt-2"
                id="user-roles-example-error-2"
                options={User.available_roles()}
                label="Role"
                has_error
                placeholder="Select a role"
                size="lg"
              >
                <:hint_text_slot>Informative Message Handler</:hint_text_slot>
              </SingleSelect>
            </Field>
          </Form>
          <Form for={@user_changeset} change="form_update" submit="form_submit">
            <Field name={:role}>
              <SingleSelect
                popover_class="pt-2"
                id="user-roles-example-error-3"
                options={User.available_roles()}
                label="Role"
                has_error
                placeholder="Select a role"
                size="xl"
              >
                <:hint_text_slot>Informative Message Handler</:hint_text_slot>
              </SingleSelect>
            </Field>
          </Form>
        </:example>

        <:code>{code_for_error()}</:code>

        <:state>@user_changeset = {inspect(@user_changeset, pretty: true)}<br><br>@latest_params = {inspect(@latest_params, pretty: true)}</:state>
      </ExampleAndCode>

      <ExampleAndCode title="Use Error Tag" id="single_select_error_tag">
        <:example>
          <Form for={@user_changeset2} change="form_update2" submit="form_submit2">
            <Field name={:gender}>
              <SingleSelect
                popover_class="pt-2"
                id="user-gender-example-error-tag-3"
                options={@gender_options}
                label="Gender"
                use_error_tag
                placeholder="Select gender"
              />
            </Field>
            <div class="pt-4">
              <Button type="submit" right_icon="arrows_right" variant="primary">Register</Button>
            </div>
          </Form>
        </:example>

        <:code>{code_for_error_tag()}</:code>

        <:state>{select_state(assigns)}</:state>
      </ExampleAndCode>

      <PropsTable data={@props_info_array} />
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
        "form_update2",
        %{
          "user" => user_params
        },
        socket
      ) do
    user_changeset2 = User.changeset(%User{}, user_params)

    {:noreply, assign(socket, user_changeset2: user_changeset2, latest_params2: user_params)}
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

  def handle_event(
        "form_submit2",
        %{
          "user" => user_params
        },
        socket
      ) do
    user_changeset2 = User.changeset(%User{}, user_params) |> Map.merge(%{action: :insert})

    {:noreply, assign(socket, user_changeset2: user_changeset2)}
  end

  def select_state(assigns) do
    ~F"""
    @user_changeset2 = {inspect(@user_changeset2, pretty: true)}
    @user = {inspect(@user, pretty: true)}
    """
  end

  def code_for_single_select_default do
    """
    alias Moon.Components.Select.SingleSelect

    <Form for={@user_changeset} change="form_update" submit="form_submit">
      <Field name={:role}>
        <SingleSelect id="user-roles-example-1" options={User.available_roles()} placeholder="Select a role" />
      </Field>
    </Form>
    """
  end

  def code_for_single_select_sizes do
    """
    alias Moon.Components.Select.SingleSelect

    <Form for={@user_changeset} change="form_update" submit="form_submit">
      <Field name={:role}>
        <SingleSelect
          id="user-roles-example-10-0"
          options={User.available_roles()}
          label="Role"
          placeholder="Select a role"
          size="sm"
        />
      </Field>
    </Form>
    <Form for={@user_changeset} change="form_update" submit="form_submit">
      <Field name={:role}>
        <SingleSelect
          id="user-roles-example-10-1"
          options={User.available_roles()}
          label="Role"
          placeholder="Select a role"
        />
      </Field>
    </Form>
    <Form for={@user_changeset} change="form_update" submit="form_submit">
      <Field name={:role}>
        <SingleSelect
          id="user-roles-example-10-2"
          options={User.available_roles()}
          label="Role"
          placeholder="Select a role"
          size="lg"
        />
      </Field>
    </Form>
    <Form for={@user_changeset} change="form_update" submit="form_submit">
      <Field name={:role}>
        <SingleSelect
          id="user-roles-example-10-3"
          options={User.available_roles()}
          label="Role"
          placeholder="Select a role"
          size="xl"
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
          id="user-roles-example-5-0"
          options={User.available_roles_with_left_icon_flag()}
          label="Role"
          placeholder="Select a role"
          size="sm"
        />
      </Field>
    </Form>
    <Form for={@user_changeset} change="form_update" submit="form_submit">
      <Field name={:role}>
        <SingleSelect
          id="user-roles-example-5-1"
          options={User.available_roles_with_left_icon_flag()}
          label="Role"
          placeholder="Select a role"
        />
      </Field>
    </Form>
    <Form for={@user_changeset} change="form_update" submit="form_submit">
      <Field name={:role}>
        <SingleSelect
          id="user-roles-example-5-2"
          options={User.available_roles_with_left_icon_flag()}
          label="Role"
          size="lg"
          placeholder="Select a role"
        />
      </Field>
    </Form>
    <Form for={@user_changeset} change="form_update" submit="form_submit">
      <Field name={:role}>
        <SingleSelect
          id="user-roles-example-5-3"
          options={User.available_roles_with_left_icon_flag()}
          label="Role"
          size="xl"
          placeholder="Select a role"
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
          id="user-roles-example-4-0"
          options={User.available_roles_with_right_icon()}
          label="Role"
          placeholder="Select a role"
          size="sm"
        />
      </Field>
    </Form>
    <Form for={@user_changeset} change="form_update" submit="form_submit">
      <Field name={:role}>
        <SingleSelect
          id="user-roles-example-4-1"
          options={User.available_roles_with_right_icon()}
          label="Role"
          placeholder="Select a role"
        />
      </Field>
    </Form>
    <Form for={@user_changeset} change="form_update" submit="form_submit">
      <Field name={:role}>
        <SingleSelect
          id="user-roles-example-4-2"
          options={User.available_roles_with_right_icon()}
          label="Role"
          placeholder="Select a role"
          size="lg"
        />
      </Field>
    </Form>
    <Form for={@user_changeset} change="form_update" submit="form_submit">
      <Field name={:role}>
        <SingleSelect
          id="user-roles-example-4-3"
          options={User.available_roles_with_right_icon()}
          label="Role"
          placeholder="Select a role"
          size="xl"
        />
      </Field>
    </Form>
    """
  end

  defp code_for_single_select_with_options_as_prop_and_both_icons do
    """
    alias Moon.Components.Select.SingleSelect

    <Form for={@user_changeset} change="form_update" submit="form_submit">
      <Field name={:role}>
        <SingleSelect
          id="user-roles-example-6-0"
          options={User.available_roles_with_left_icon_flag_and_right_icon()}
          label="Role"
          placeholder="Select a role"
          size="sm"
        />
      </Field>
    </Form>
    <Form for={@user_changeset} change="form_update" submit="form_submit">
      <Field name={:role}>
        <SingleSelect
          id="user-roles-example-6-1"
          options={User.available_roles_with_left_icon_flag_and_right_icon()}
          label="Role"
          placeholder="Select a role"
        />
      </Field>
    </Form>
    <Form for={@user_changeset} change="form_update" submit="form_submit">
      <Field name={:role}>
        <SingleSelect
          id="user-roles-example-6-2"
          options={User.available_roles_with_left_icon_flag_and_right_icon()}
          label="Role"
          placeholder="Select a role"
          size="lg"
        />
      </Field>
    </Form>
    <Form for={@user_changeset} change="form_update" submit="form_submit">
      <Field name={:role}>
        <SingleSelect
          id="user-roles-example-6-3"
          options={User.available_roles_with_left_icon_flag_and_right_icon()}
          label="Role"
          placeholder="Select a role"
          size="xl"
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
        <SingleSelect
          popover_class="pt-2"
          id="user-roles-example-disabled-0"
          options={User.available_roles()}
          disabled
          label="Role"
          placeholder="Select a role"
          size="sm"
        />
      </Field>
    </Form>
    <Form for={@user_changeset} change="form_update" submit="form_submit">
      <Field name={:role}>
        <SingleSelect
          popover_class="pt-2"
          id="user-roles-example-disabled-1"
          options={User.available_roles()}
          disabled
          label="Role"
          placeholder="Select a role"
        />
      </Field>
    </Form>
    <Form for={@user_changeset} change="form_update" submit="form_submit">
      <Field name={:role}>
        <SingleSelect
          popover_class="pt-2"
          id="user-roles-example-disabled-2"
          options={User.available_roles()}
          disabled
          label="Role"
          placeholder="Select a role"
          size="lg"
        />
      </Field>
    </Form>
    <Form for={@user_changeset} change="form_update" submit="form_submit">
      <Field name={:role}>
        <SingleSelect
          popover_class="pt-2"
          id="user-roles-example-disabled-3"
          options={User.available_roles()}
          disabled
          label="Role"
          placeholder="Select a role"
          size="xl"
        />
      </Field>
    </Form>
    """
  end

  def code_for_hint do
    """
    alias Moon.Components.Select.SingleSelect

    <Form for={@user_changeset} change="form_update" submit="form_submit">
      <Field name={:role}>
        <SingleSelect
          popover_class="pt-2"
          id="user-roles-example-hint-0"
          options={User.available_roles()}
          label="Role"
          placeholder="Select a role"
          size="sm"
        >
          <:hint_text_slot>Informative Message Handler</:hint_text_slot>
        </SingleSelect>
      </Field>
    </Form>
    <Form for={@user_changeset} change="form_update" submit="form_submit">
      <Field name={:role}>
        <SingleSelect
          popover_class="pt-2"
          id="user-roles-example-hint-1"
          options={User.available_roles()}
          label="Role"
          placeholder="Select a role"
        >
          <:hint_text_slot>Informative Message Handler</:hint_text_slot>
        </SingleSelect>
      </Field>
    </Form>
    <Form for={@user_changeset} change="form_update" submit="form_submit">
      <Field name={:role}>
        <SingleSelect
          popover_class="pt-2"
          id="user-roles-example-hint-2"
          options={User.available_roles()}
          label="Role"
          placeholder="Select a role"
          size="lg"
        >
          <:hint_text_slot>Informative Message Handler</:hint_text_slot>
        </SingleSelect>
      </Field>
    </Form>
    <Form for={@user_changeset} change="form_update" submit="form_submit">
      <Field name={:role}>
        <SingleSelect
          popover_class="pt-2"
          id="user-roles-example-hint-3"
          options={User.available_roles()}
          label="Role"
          placeholder="Select a role"
          size="xl"
        >
          <:hint_text_slot>Informative Message Handler</:hint_text_slot>
        </SingleSelect>
      </Field>
    </Form>
    """
  end

  def code_for_error do
    """
    alias Moon.Components.Select.SingleSelect

    <Form for={@user_changeset} change="form_update" submit="form_submit">
      <Field name={:role}>
        <SingleSelect
          popover_class="pt-2"
          id="user-roles-example-error-0"
          options={User.available_roles()}
          label="Role"
          has_error
          placeholder="Select a role"
          size="sm"
        >
          <:hint_text_slot>Informative Message Handler</:hint_text_slot>
        </SingleSelect>
      </Field>
    </Form>
    <Form for={@user_changeset} change="form_update" submit="form_submit">
      <Field name={:role}>
        <SingleSelect
          popover_class="pt-2"
          id="user-roles-example-error-1"
          options={User.available_roles()}
          label="Role"
          has_error
          placeholder="Select a role"
        >
          <:hint_text_slot>Informative Message Handler</:hint_text_slot>
        </SingleSelect>
      </Field>
    </Form>
    <Form for={@user_changeset} change="form_update" submit="form_submit">
      <Field name={:role}>
        <SingleSelect
          popover_class="pt-2"
          id="user-roles-example-error-2"
          options={User.available_roles()}
          label="Role"
          has_error
          placeholder="Select a role"
          size="lg"
        >
          <:hint_text_slot>Informative Message Handler</:hint_text_slot>
        </SingleSelect>
      </Field>
    </Form>
    <Form for={@user_changeset} change="form_update" submit="form_submit">
      <Field name={:role}>
        <SingleSelect
          popover_class="pt-2"
          id="user-roles-example-error-3"
          options={User.available_roles()}
          label="Role"
          has_error
          placeholder="Select a role"
          size="xl"
        >
          <:hint_text_slot>Informative Message Handler</:hint_text_slot>
        </SingleSelect>
      </Field>
    </Form>
    """
  end

  def code_for_error_tag do
    """
    alias Moon.Components.Select.SingleSelect

    <Form for={@user_changeset} change="form_update" submit="form_submit">
      <Field name={:role}>
        <SingleSelect
          popover_class="pt-2"
          id="user-roles-example-error-1"
          options={User.available_roles()}
          label="Role"
          is_error
          placeholder="Select a role"
          >
          <:hint_text_slot>Informative Message Handler</:hint_text_slot>
        </SingleSelect>
      </Field>
    </Form>
    <Form for={@user_changeset} change="form_update" submit="form_submit">
      <Field name={:role}>
        <SingleSelect
          popover_class="pt-2"
          id="user-roles-example-error-2"
          options={User.available_roles()}
          label="Role"
          is_error
          placeholder="Select a role"
          size="lg"
          >
          <:hint_text_slot>Informative Message Handler</:hint_text_slot>
        </SingleSelect>
      </Field>
    </Form>
    <Form for={@user_changeset} change="form_update" submit="form_submit">
      <Field name={:role}>
        <SingleSelect
          popover_class="pt-2"
          id="user-roles-example-error-3"
          options={User.available_roles()}
          label="Role"
          is_error
          placeholder="Select a role"
          size="xl"
        >
          <:hint_text_slot>Informative Message Handler</:hint_text_slot>
        </SingleSelect>
      </Field>
    </Form>
    """
  end
end
