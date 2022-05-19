defmodule MoonWeb.Pages.Components.Select.SingleSelectPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias Moon.Autolayouts.TopToDown
  alias Moon.Components.Form
  alias Moon.Components.Field
  alias Moon.Components.Heading
  alias Moon.Components.Select.SingleSelect
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
        to: "/components/select/single-select",
        name: "Single Select"
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
        <Heading size={56} class="mb-4">Single Select</Heading>

        <ExampleAndCode
          title="Single Select with options as prop"
          id="single_select_with_options_as_prop"
        >
          <:example>
            <Form for={@user_changeset} change="form_update" submit="form_submit">
              <Field name={:role}>
                <SingleSelect id="user-roles-example-1" options={User.available_roles()} prompt="Select role" />
              </Field>
            </Form>
          </:example>

          <:code>{code_for_single_select_with_options_as_prop()}</:code>

          <:state>@user_changeset = {inspect(@user_changeset, pretty: true)}<br><br>@latest_params = {inspect(@latest_params, pretty: true)}</:state>
        </ExampleAndCode>

        <Heading size={56} class="mb-4">Single Select (selected value with icon)</Heading>

        <ExampleAndCode title="" id="single_select_with_options_as_prop_and_icon">
          <:example>
            <Form for={@user_changeset} change="form_update" submit="form_submit">
              <Field name={:role}>
                <SingleSelect
                  id="user-roles-example-2"
                  options={User.available_roles()}
                  prompt="Select role"
                  mode="icon"
                />
              </Field>
            </Form>
          </:example>

          <:code>{code_for_single_select_with_options_as_prop_and_icon()}</:code>

          <:state>@user_changeset = {inspect(@user_changeset, pretty: true)}<br><br>@latest_params = {inspect(@latest_params, pretty: true)}</:state>
        </ExampleAndCode>
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
    <Form for={@user_changeset} change="form_update" submit="form_submit">
      <Field name={:role}>
        <FieldLabel>Permissions</FieldLabel>
        <SingleSelect id="user-roles-example-1" options={User.available_roles()} />
      </Field>
    </Form>
    """
  end

  def code_for_single_select_with_options_as_prop_and_icon do
    """
    <Form for={@user_changeset} change="form_update" submit="form_submit">
      <Field name={:role}>
        <FieldLabel>Permissions</FieldLabel>
        <SingleSelect id="user-roles-example-2" options={User.available_roles() mode="icon"} />
      </Field>
    </Form>
    """
  end
end
