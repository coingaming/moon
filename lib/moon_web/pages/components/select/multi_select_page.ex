defmodule MoonWeb.Pages.Components.Select.MultiSelectPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias Moon.Autolayouts.TopToDown
  alias Moon.Components.Form
  alias Moon.Components.Field
  alias Moon.Components.Heading
  alias Moon.Components.FieldLabel
  alias Moon.Components.Select.MultiSelect
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
                <FieldLabel>Permissions</FieldLabel>
                <MultiSelect id="user-permissions-example-2" options={User.available_permissions()} />
              </Field>
            </Form>
          </:example>

          <:code>{code_for_multi_select_with_options_as_prop()}</:code>

          <:state>@user_changeset = {inspect(@user_changeset, pretty: true)}<br><br>@latest_params = {inspect(@latest_params, pretty: true)}</:state>
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

  def code_for_multi_select_with_options_as_prop do
    """
    alias Moon.Components.Form
    alias Moon.Components.Field
    alias Moon.Components.FieldLabel
    alias Moon.Components.Select.MultiSelect

    <Form for={@user_changeset} change="form_update" submit="form_submit">
      <Field name={:permissions}>
        <FieldLabel>Permissions</FieldLabel>
        <MultiSelect id="user-permissions" options={User.available_permissions()} />
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
