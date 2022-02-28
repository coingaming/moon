defmodule MoonWeb.Pages.Components.Select.MultiSelectPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias Moon.Autolayouts.TopToDown
  alias Moon.Components.Button
  alias Moon.Components.Form
  alias Moon.Components.Field
  alias Moon.Components.Heading
  alias Moon.Components.Label
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

        <ExampleAndCode title="Example" id="select_1">
          <:example>
            <Form for={@user_changeset} change="form_update" submit="form_submit">
              <Field name={:permissions}>
                <Label>Permissions</Label>
                <MultiSelect options={User.permissions()} />
              </Field>
              <Button type="primary">Submit</Button>
            </Form>
          </:example>

          <:code>{example_code_1()}</:code>

          <:state>{inspect(@user_changeset, pretty: true)}</:state>
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

    {:noreply, assign(socket, user_changeset: user_changeset)}
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

  def example_code_1 do
    """
    <Form for={@user_changeset}>
      <Field name={:permissions}>
        <Label>Permissions</Label>
        <MultiSelect options={User.permissions()} />
      </Field>
    </Form>
    """
  end
end
