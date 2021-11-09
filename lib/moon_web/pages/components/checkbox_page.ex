defmodule MoonWeb.Pages.Components.CheckboxPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias Moon.Autolayouts.TopToDown
  alias Moon.Components.Checkbox
  alias Moon.Components.Form
  alias Moon.Components.Heading
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
        to: "/components/checkbox",
        name: "Checkbox"
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
        <Heading size={56} class="mb-4">Checkbox</Heading>
        <p>
          Checkboxes are used as a list in our forms and signup pages so users can select options of their choice. Users are free to choose how many options to select, from zero to all of them.

          As each checkbox is independent, this means that additional checkboxes do not affect any other selections… or planets. .
        </p>

        <ExampleAndCode title="Checkbox" id="checkbox_1">
          <:example>
            <Form for={@user_changeset} change="update_user">
              <Checkbox id="agrees_to_marketing_emails" field={:agrees_to_marketing_emails}>
                I agree to receive bonus & marketing emails.
              </Checkbox>
            </Form>
          </:example>

          <:code>{checkbox_1_code()}</:code>

          <:state>{checkbox_1_state(assigns)}</:state>
        </ExampleAndCode>

        <ExampleAndCode title="Disabled" id="checkbox_2">
          <:example>
            <Form for={@user_changeset} change="update_user">
              <Checkbox id="agrees_to_marketing_emails" field={:agrees_to_marketing_emails} disabled>
                I agree to receive bonus & marketing emails.
              </Checkbox>
            </Form>
          </:example>

          <:code>{checkbox_2_code()}</:code>
        </ExampleAndCode>
      </TopToDown>
    </Page>
    """
  end

  def handle_event(
        "update_user",
        %{"user" => %{"agrees_to_marketing_emails" => agrees_to_marketing_emails}},
        socket
      ) do
    user_changeset =
      User.changeset(%User{}, %{
        agrees_to_marketing_emails: agrees_to_marketing_emails
      })

    {:noreply, assign(socket, user_changeset: user_changeset)}
  end

  def checkbox_1_code() do
    """
    <Form for={@user_changeset} change="update_user">
      <Checkbox id="agrees_to_marketing_emails" field={:agrees_to_marketing_emails}>
        I agree to receive bonus & marketing emails.
      </Checkbox>
    </Form>
    """
  end

  def checkbox_1_state(assigns) do
    ~F"""
    @user_changeset = {inspect(@user_changeset, pretty: true)}
    """
  end

  def checkbox_2_code() do
    """
    <Form for={@user_changeset} change="update_user">
      <Checkbox id="agrees_to_marketing_emails" field={:agrees_to_marketing_emails} disabled={true}>
        I agree to receive bonus & marketing emails.
      </Checkbox>
    </Form>
    """
  end
end
