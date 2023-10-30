defmodule MoonWeb.Pages.Components.Select.MultiSelectPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias Moon.Components.Form
  alias Moon.Components.Field
  alias Moon.Components.FieldLabel
  alias Moon.Components.Select.MultiSelect
  alias MoonWeb.Components.ExampleAndCode
  alias MoonWeb.Components.Page
  alias MoonWeb.Pages.Tutorials.AddDataUsingForm.User
  alias MoonWeb.Components.ComponentPageDescription
  alias MoonWeb.Components.PropsTable

  data(breadcrumbs, :any,
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
  )

  data(props_info_array, :list,
    default: [
      %{
        :name => ~c"field",
        :type => ~c"atom ",
        :required => ~c"Yes",
        :default => ~c"-",
        :description => ~c"Field for the underlying phoenix select component"
      },
      %{
        :name => ~c"size",
        :type => ~c"-",
        :required => ~c"No",
        :default => ~c"-",
        :description => ~c"TODO - size variant"
      },
      %{
        :name => ~c"options",
        :type => ~c"list",
        :required => ~c"Yes",
        :default => ~c"-",
        :description => ~c"Options for the select"
      },
      %{
        :name => ~c"prompt",
        :type => ~c"string",
        :required => ~c"No",
        :default => ~c"-",
        :description => ~c"Placeholder text"
      },
      %{
        :name => ~c"header",
        :type => ~c"slot",
        :required => ~c"No",
        :default => ~c"-",
        :description => ~c"TODO - header element on the options popup"
      },
      %{
        :name => ~c"footer",
        :type => ~c"slot",
        :required => ~c"No",
        :default => ~c"-",
        :description => ~c"TODO - footer element on the options popup"
      },
      %{
        :name => ~c"menu_width",
        :type => ~c"number",
        :required => ~c"No",
        :default => ~c"-",
        :description => ~c"TODO - Minimum width of the popup menu containing options"
      },
      %{
        :name => ~c"left",
        :type => ~c"slot",
        :required => ~c"No",
        :default => ~c"-",
        :description => ~c"TODO - Left content for selected option"
      },
      %{
        :name => ~c"hint",
        :type => ~c"slot",
        :required => ~c"No",
        :default => ~c"-",
        :description => ~c"TODO - Inform message under select, can be used for error message"
      },
      %{
        :name => ~c"items",
        :type => ~c"slot",
        :required => ~c"Yes",
        :default => ~c"-",
        :description => ~c"Content template for displaying each of the options"
      },
      %{
        :name => ~c"disabled",
        :type => ~c"boolean",
        :required => ~c"-",
        :default => ~c"false",
        :description => ~c"Whether the component is disabled"
      },
      %{
        :name => ~c"value",
        :type => ~c"any",
        :required => ~c"No",
        :default => ~c"-",
        :description => ~c"Default selected value"
      },
      %{
        :name => ~c"on_select",
        :type => ~c"string",
        :required => ~c"No",
        :default => ~c"-",
        :description => ~c"Name of the event handler function when an option is clicked"
      },
      %{
        :name => ~c"is_error",
        :type => ~c"boolean",
        :required => ~c"No",
        :default => ~c"-",
        :description => ~c"TODO - If the component is in error mode"
      }
    ]
  )

  data(latest_params, :any, default: nil)

  def mount(_params, _session, socket) do
    user_changeset = User.changeset(%User{}, %{permissions: [1, 2], role: 1})

    {:ok,
     assign(socket,
       user_changeset: user_changeset,
       options: User.available_permissions(),
       searched_options: User.available_permissions(),
       options_with_left_icon: User.available_permissions_with_left_icon(),
       searched_options_with_left_icon: User.available_permissions_with_left_icon(),
       search_string: ""
     )}
  end

  def handle_params(_params, uri, socket) do
    {:noreply, assign(socket, uri: uri)}
  end

  def render(assigns) do
    ~F"""
    <Page {=@theme_name} {=@active_page} {=@breadcrumbs} {=@direction}>
      <ComponentPageDescription title="Multi Select">
        <p>Multi Select</p>
      </ComponentPageDescription>

      <ExampleAndCode title="Multi Select with options as prop" id="multi_select_with_options_as_prop">
        <:example>
          <Form for={@user_changeset} change="form_update" submit="form_submit">
            <FieldLabel>Permissions</FieldLabel>
            <Field name={:permissions}>
              <MultiSelect popover_class="pt-2" id="user-permissions-example-1" {=@options} />
            </Field>
          </Form>
        </:example>

        <:code>{code_for_multi_select_with_options_as_prop()}</:code>

        <:state>@user_changeset = {inspect(@user_changeset, pretty: true)}<br><br>@latest_params = {inspect(@latest_params, pretty: true)}</:state>
      </ExampleAndCode>

      <ExampleAndCode
        title="Multi Select (prompt inside)"
        id="multi_select_with_options_as_prop_and_prompt_inside"
      >
        <:example>
          <Form for={@user_changeset} change="form_update" submit="form_submit">
            <Field name={:permissions}>
              <MultiSelect id="user-permissions-example-2" {=@options} prompt="Permission" />
            </Field>
          </Form>
        </:example>

        <:code>{code_for_multi_select_with_options_as_prop_and_prompt_inside()}</:code>

        <:state>@user_changeset = {inspect(@user_changeset, pretty: true)}<br><br>@latest_params = {inspect(@latest_params, pretty: true)}</:state>
      </ExampleAndCode>

      <ExampleAndCode
        title="Multi Select (prompt inside with icon)"
        id="multi_select_with_options_as_prop_and_prompt_inside_icon"
      >
        <:example>
          <Form for={@user_changeset} change="form_update" submit="form_submit">
            <Field name={:permissions}>
              <MultiSelect
                id="user-permissions-example-3"
                options={@options_with_left_icon}
                prompt="Permission"
              />
            </Field>
          </Form>
        </:example>

        <:code>{code_for_multi_select_with_options_as_prop_and_prompt_inside_icon()}</:code>

        <:state>@user_changeset = {inspect(@user_changeset, pretty: true)}<br><br>@latest_params = {inspect(@latest_params, pretty: true)}</:state>
      </ExampleAndCode>

      <ExampleAndCode title="Small" id="multi_select_sizes_small">
        <:example>
          <Form for={@user_changeset} change="form_update" submit="form_submit">
            <FieldLabel>Permissions</FieldLabel>
            <Field name={:permissions}>
              <MultiSelect popover_class="pt-2" id="user-permissions-example-4" {=@options} size="small" />
            </Field>
          </Form>
          <Form for={@user_changeset} change="form_update" submit="form_submit">
            <Field name={:permissions}>
              <MultiSelect id="user-permissions-example-5" {=@options} prompt="Permission" size="small" />
            </Field>
          </Form>
        </:example>

        <:code>{code_for_multi_select_sizes_small()}</:code>
      </ExampleAndCode>

      <ExampleAndCode title="Medium" id="multi_select_sizes_medium">
        <:example>
          <Form for={@user_changeset} change="form_update" submit="form_submit">
            <FieldLabel>Permissions</FieldLabel>
            <Field name={:permissions}>
              <MultiSelect popover_class="pt-2" id="user-permissions-example-7" {=@options} size="medium" />
            </Field>
          </Form>
          <Form for={@user_changeset} change="form_update" submit="form_submit">
            <Field name={:permissions}>
              <MultiSelect id="user-permissions-example-8" {=@options} prompt="Permission" size="medium" />
            </Field>
          </Form>
        </:example>

        <:code>{code_for_multi_select_sizes_medium()}</:code>
      </ExampleAndCode>

      <ExampleAndCode title="Large" id="multi_select_sizes_large">
        <:example>
          <Form for={@user_changeset} change="form_update" submit="form_submit">
            <FieldLabel>Permissions</FieldLabel>
            <Field name={:permissions}>
              <MultiSelect popover_class="pt-2" id="user-permissions-example-10" {=@options} size="large" />
            </Field>
          </Form>
          <Form for={@user_changeset} change="form_update" submit="form_submit">
            <Field name={:permissions}>
              <MultiSelect id="user-permissions-example-11" {=@options} prompt="Permission" size="large" />
            </Field>
          </Form>
        </:example>

        <:code>{code_for_multi_select_sizes_large()}</:code>
      </ExampleAndCode>

      <ExampleAndCode title="Xlarge" id="multi_select_sizes_xlarge">
        <:example>
          <Form for={@user_changeset} change="form_update" submit="form_submit">
            <FieldLabel>Permissions</FieldLabel>
            <Field name={:permissions}>
              <MultiSelect popover_class="pt-2" id="user-permissions-example-13" {=@options} size="xlarge" />
            </Field>
          </Form>
          <Form for={@user_changeset} change="form_update" submit="form_submit">
            <Field name={:permissions}>
              <MultiSelect id="user-permissions-example-14" {=@options} prompt="Permission" size="xlarge" />
            </Field>
          </Form>
        </:example>

        <:code>{code_for_multi_select_sizes_xlarge()}</:code>
      </ExampleAndCode>

      <ExampleAndCode title="Disabled" id="multi_select_disabled">
        <:example>
          <Form for={@user_changeset} change="form_update" submit="form_submit">
            <FieldLabel>Permissions</FieldLabel>
            <Field name={:permissions}>
              <MultiSelect popover_class="pt-2" id="user-permissions-example-disabled" {=@options} disabled />
            </Field>
          </Form>
        </:example>

        <:code>{code_for_multi_select_disabled()}</:code>

        <:state>@user_changeset = {inspect(@user_changeset, pretty: true)}<br><br>@latest_params = {inspect(@latest_params, pretty: true)}</:state>
      </ExampleAndCode>

      <ExampleAndCode
        title="With search (data + changeset form)"
        id="multi_select_with_options_as_prop_and_search"
      >
        <:example>
          <Form for={@user_changeset} change="form_update" submit="form_submit">
            <Field name={:permissions}>
              <MultiSelect
                id="user-permissions-example-search"
                {=@options}
                {=@searched_options}
                {=@search_string}
                on_search_change="update_search"
                with="checkbox"
                prompt="Permission"
                size="medium"
              />
            </Field>
          </Form>
        </:example>

        <:code>{code_for_multi_select_with_options_as_prop_and_search()}</:code>

        <:state>@user_changeset = {inspect(@user_changeset, pretty: true)}<br><br>@latest_params = {inspect(@latest_params, pretty: true)}</:state>
      </ExampleAndCode>

      <PropsTable data={@props_info_array} />
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

  def handle_event("update_search", %{"value" => search_string}, socket) do
    options = socket.assigns.options
    options_with_left_icon = socket.assigns.options_with_left_icon

    {:noreply,
     assign(socket,
       options: options,
       searched_options: filtered_options(options, search_string),
       options_with_left_icon: options_with_left_icon,
       searched_options_with_left_icon: filtered_options(options_with_left_icon, search_string),
       search_string: search_string
     )}
  end

  def filtered_options(options, search_string) do
    Enum.filter(
      options,
      &String.contains?(String.downcase(&1.label), String.downcase(search_string))
    )
  end

  def code_for_multi_select_with_options_as_prop do
    """
    alias Moon.Components.Form
    alias Moon.Components.Field
    alias Moon.Components.FieldLabel
    alias Moon.Components.Select.MultiSelect

    <Form for={@user_changeset} change="form_update" submit="form_submit">
      <FieldLabel>Permissions</FieldLabel>
      <Field name={:permissions}>
        <MultiSelect
          popover_class="pt-2"
          id="user-permissions-example-1"
          options={User.available_permissions()}
        />
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

  def code_for_multi_select_with_options_as_prop_and_prompt_inside do
    """
    alias Moon.Components.Form
    alias Moon.Components.Field
    alias Moon.Components.Select.MultiSelect

    <Form for={@user_changeset} change="form_update" submit="form_submit">
      <Field name={:permissions}>
        <MultiSelect
          id="user-permissions-example-2"
          options={User.available_permissions()}
          prompt="Permission"
        />
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

  def code_for_multi_select_with_options_as_prop_and_prompt_inside_icon do
    """
    alias Moon.Components.Form
    alias Moon.Components.Field
    alias Moon.Components.Select.MultiSelect

    <Form for={@user_changeset} change="form_update" submit="form_submit">
      <Field name={:permissions}>
        <MultiSelect
          id="user-permissions-example-3"
          options={User.available_permissions_with_left_icon()}
          prompt="Permission"
        />
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

  def code_for_multi_select_sizes_small do
    """
    alias Moon.Components.Select.MultiSelect

    <Form for={@user_changeset} change="form_update" submit="form_submit">
      <FieldLabel>Permissions</FieldLabel>
      <Field name={:permissions}>
        <MultiSelect
          popover_class="pt-2"
          id="user-permissions-example-4"
          options={User.available_permissions()}
          size="small"
        />
      </Field>
    </Form>
    <Form for={@user_changeset} change="form_update" submit="form_submit">
      <Field name={:permissions}>
        <MultiSelect
          id="user-permissions-example-5"
          options={User.available_permissions()}
          prompt="Permission"
          size="small"
        />
      </Field>
    </Form>
    """
  end

  def code_for_multi_select_sizes_medium do
    """
    alias Moon.Components.Select.MultiSelect

    <Form for={@user_changeset} change="form_update" submit="form_submit">
      <FieldLabel>Permissions</FieldLabel>
      <Field name={:permissions}>
        <MultiSelect
          popover_class="pt-2"
          id="user-permissions-example-7"
          options={User.available_permissions()}
          size="medium"
        />
      </Field>
    </Form>
    <Form for={@user_changeset} change="form_update" submit="form_submit">
      <Field name={:permissions}>
        <MultiSelect
          id="user-permissions-example-8"
          options={User.available_permissions()}
          prompt="Permission"
          size="medium"
        />
      </Field>
    </Form>
    """
  end

  def code_for_multi_select_sizes_large do
    """
    alias Moon.Components.Select.MultiSelect

    <Form for={@user_changeset} change="form_update" submit="form_submit">
      <FieldLabel>Permissions</FieldLabel>
      <Field name={:permissions}>
        <MultiSelect
          popover_class="pt-2"
          id="user-permissions-example-10"
          options={User.available_permissions()}
          size="large"
        />
      </Field>
    </Form>
    <Form for={@user_changeset} change="form_update" submit="form_submit">
      <Field name={:permissions}>
        <MultiSelect
          id="user-permissions-example-11"
          options={User.available_permissions()}
          prompt="Permission"
          size="large"
        />
      </Field>
    </Form>
    """
  end

  def code_for_multi_select_sizes_xlarge do
    """
    alias Moon.Components.Select.MultiSelect

    <Form for={@user_changeset} change="form_update" submit="form_submit">
      <FieldLabel>Permissions</FieldLabel>
      <Field name={:permissions}>
        <MultiSelect
          popover_class="pt-2"
          id="user-permissions-example-13"
          options={User.available_permissions()}
          size="xlarge"
        />
      </Field>
    </Form>
    <Form for={@user_changeset} change="form_update" submit="form_submit">
      <Field name={:permissions}>
        <MultiSelect
          id="user-permissions-example-14"
          options={User.available_permissions()}
          prompt="Permission"
          size="xlarge"
        />
      </Field>
    </Form>
    """
  end

  def code_for_multi_select_disabled do
    """
    alias Moon.Components.Select.MultiSelect

    <Form for={@user_changeset} change="form_update" submit="form_submit">
      <FieldLabel>Permissions</FieldLabel>
      <Field name={:permissions}>
        <MultiSelect
          popover_class="pt-2"
          id="user-permissions-example-disabled"
          options={User.available_permissions()}
          disabled={true}
        />
      </Field>
    </Form>
    """
  end

  def code_for_multi_select_with_options_as_prop_and_search do
    """
    alias Moon.Components.Select.MultiSelect

    <Form for={@user_changeset} change="form_update" submit="form_submit">
      <Field name={:permissions}>
        <MultiSelect
          id="user-permissions-example-search"
          {=@options}
          {=@searched_options}
          {=@search_string}
          on_search_change="update_search"
          with="checkbox"
          prompt="Permission"
          size="medium"
        />
      </Field>
    </Form>
    """
  end
end
