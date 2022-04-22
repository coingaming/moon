defmodule MoonWeb.Pages.Components.Select.DropdownPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias Moon.Autolayouts.TopToDown
  alias Moon.Components.Form
  alias Moon.Components.Field
  alias Moon.Components.Heading
  alias Moon.Components.FieldLabel
  alias Moon.Components.Select.Dropdown
  alias Moon.Components.ListItems.SingleLineItem
  alias Moon.Components.TextInput
  alias MoonWeb.Components.ExampleAndCode
  alias MoonWeb.Components.Page
  alias MoonWeb.Pages.Tutorials.AddDataUsingForm.User

  data breadcrumbs, :any,
    default: [
      %{
        to: "#",
        name: "Components"
      },
      %{
        to: "/components/select/dropdown",
        name: "Multi Select"
      }
    ]

  def mount(params, _session, socket) do
    user_changeset = User.changeset(%User{})

    {:ok,
     assign(socket,
       user_changeset: user_changeset,
       options: User.available_permissions(),
       searchable_options: User.available_permissions(),
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
        <Heading size={56} class="mb-4">Dropdown</Heading>

        <ExampleAndCode title="Dropdown options" id="dropdown-options-example">
          <:example>
            <Form for={@user_changeset} change="form_update" submit="form_submit">
              <Field name={:permissions}>
                <FieldLabel>Permissions</FieldLabel>
                <Dropdown
                  id="dropdown-options-example-user-permissions"
                  options={@options}
                  is_multi/>
              </Field>
            </Form>
          </:example>
          <:code>{code_for_dropdown()}</:code>
          <:state>@user_changeset = {inspect(@user_changeset, pretty: true)}}</:state>
        </ExampleAndCode>

        <ExampleAndCode title="Dropdown with icons" id="dropdown-icons-example">
          <:example>
            <Form for={@user_changeset} change="form_update" submit="form_submit">
              <Field name={:permissions}>
                <FieldLabel>Permissions</FieldLabel>
                <Dropdown
                  id="dropdown-icons-example-user-permissions"
                  is_multi
                  options={@options}
                >
                  {#for option <- @options}
                    <Dropdown.Option value={"#{option.value}"} :let={is_selected: is_selected}>
                      <SingleLineItem current={is_selected}>
                        <:left_icon><Moon.Icons.ControlsPlus /></:left_icon>
                        {option.label}
                        <:right_icon><Moon.Icons.ControlsPlus /></:right_icon>
                      </SingleLineItem>
                    </Dropdown.Option>
                  {/for}
                </Dropdown>
              </Field>
            </Form>
          </:example>
          <:code>{code_for_dropdown()}</:code>
          <:state>@user_changeset = {inspect(@user_changeset, pretty: true)}}</:state>
        </ExampleAndCode>

        <ExampleAndCode title="Dropdown with search" id="dropdown-search-example">
          <:example>
            <Form for={@user_changeset} change="form_update" submit="form_submit">
              <Field name={:permission}>
                <FieldLabel>Permissions</FieldLabel>
                <Dropdown
                  id="dropdown-search-example-user-permissions"
                  options={@options}
                  is_multi >
                  <:option_filters>
                    <TextInput type="search" keyup="apply_filter" />
                  </:option_filters>
                </Dropdown>
              </Field>
            </Form>
          </:example>
          <:code>{code_for_dropdown_search()}</:code>
          <:state>@user_changeset = {inspect(@user_changeset, pretty: true)}}</:state>
        </ExampleAndCode>
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

  def handle_event("apply_filter", %{"value" => value}, %{assigns: %{options: options}} = socket) do
    filtered_options =
      options
      |> Enum.filter(&String.contains?(String.downcase(&1.label), value))
      |> case do
        [] ->
          options

        filters ->
          filters
      end

    filtered_options = if value === "", do: options, else: filtered_options

    {:noreply, assign(socket, options: filtered_options)}
  end

  def code_for_dropdown do
    """
    <Form for={@user_changeset} change="form_update" submit="form_submit">
      <Field name={:permissions}>
        <FieldLabel>Permissions</FieldLabel>
        <Dropdown id="dropdown-options-example-user-permissions" options={User.available_permissions()} is_multi />
      </Field>
    </Form>
    """
  end

  def code_for_dropdown_search do
    """
    """
  end
end
