defmodule MoonWeb.Pages.Components.CheckboxPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias Moon.Components.Button
  alias Moon.Components.Checkbox
  alias Moon.Components.ErrorTag
  alias Moon.Components.Field
  alias Moon.Components.Form
  alias Moon.Autolayouts.TopToDown
  alias MoonWeb.Components.ExampleAndCode
  alias MoonWeb.Components.Page
  alias MoonWeb.Components.ComponentPageDescription
  alias MoonWeb.Components.PropsTable
  alias MoonWeb.Pages.Tutorials.AddDataUsingForm.User

  data(breadcrumbs, :any,
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
  )

  data(props_info_array, :list,
    default: [
      %{
        :name => 'checked',
        :type => 'boolean',
        :required => 'false',
        :default => 'false',
        :description => 'Preset value for checkbox state'
      },
      %{
        :name => 'disabled',
        :type => 'boolean',
        :required => 'false',
        :default => 'false',
        :description => 'Checkbox disabled state'
      },
      %{
        :name => 'readonly',
        :type => 'boolean',
        :required => 'false',
        :default => 'false',
        :description => "Checkbox isn't disabled but its value can't be changed"
      },
      %{
        :name => 'field',
        :type => 'atom',
        :required => 'true',
        :default => '-',
        :description => 'Field name for the inner input form control'
      },
      %{
        :name => '#slot',
        :type => 'element',
        :required => 'true',
        :default => '-',
        :description => 'Label for the control'
      }
    ]
  )

  def render(assigns) do
    ~F"""
    <Page {=@theme_name} {=@active_page} {=@breadcrumbs} {=@direction}>
      <ComponentPageDescription title="Checkbox">
        <p>
          Checkboxes are used as a list in our forms and signup pages so users can select options of their choice. Users are free to choose how many options to select, from zero to all of them.
        </p>
        <p>
          As each checkbox is independent, this means that additional checkboxes do not affect any other selections… or planets.
        </p>
      </ComponentPageDescription>

      <ExampleAndCode title="Checkbox" id="checkbox_1">
        <:example>
          <Form for={@user_changeset} change="register_form_update" submit="register_form_submit">
            <TopToDown>
              <Field name={:agrees_to_terms_of_service}>
                <Checkbox id="agrees_to_terms_of_service">
                  I agree to terms and services.
                </Checkbox>
                <ErrorTag />
              </Field>
              <Field name={:agrees_to_marketing_emails}>
                <Checkbox
                  id="agrees_to_marketing_emails"
                  disabled={!get_agrees_to_terms_of_service(@user_changeset)}
                >
                  I agree to receive bonus & marketing emails.
                </Checkbox>
                <ErrorTag />
              </Field>
              <div>
                <Button type="submit" right_icon="arrows_right" variant="primary">Register</Button>
              </div>
            </TopToDown>
          </Form>
        </:example>

        <:code>{checkbox_1_code()}</:code>

        <:state>{checkbox_1_state(assigns)}</:state>
      </ExampleAndCode>

      <ExampleAndCode title="No Label" id="checkbox_2">
        <:example>
          <Form for={@user_changeset2} change="register_form_update2">
            <TopToDown>
              <Field name={:agrees_to_terms_of_service}>
                <Checkbox id="agrees_to_terms_of_service" />
                <ErrorTag />
              </Field>
            </TopToDown>
          </Form>
        </:example>

        <:code>{checkbox_2_code()}</:code>
      </ExampleAndCode>

      <ExampleAndCode title="Disabled" id="checkbox_3">
        <:example>
          <Form for={@user_changeset}>
            <TopToDown>
              <Field name={:agrees_to_terms_of_service}>
                <Checkbox id="agrees_to_terms_of_service" disabled>I agree to terms and services.</Checkbox>
                <ErrorTag />
              </Field>
            </TopToDown>
          </Form>
        </:example>

        <:code>{checkbox_3_code()}</:code>
      </ExampleAndCode>

      <ExampleAndCode title="Readonly" id="checkbox_4">
        <:example>
          <Form for={@user_changeset2} change="register_form_update2">
            <TopToDown>
              <Field name={:agrees_to_terms_of_service}>
                <Checkbox id="agrees_to_terms_of_service" readonly checked>I agree to terms and services.</Checkbox>
                <ErrorTag />
              </Field>
            </TopToDown>
          </Form>
        </:example>

        <:code>{checkbox_4_code()}</:code>
      </ExampleAndCode>

      <PropsTable data={@props_info_array} />
    </Page>
    """
  end

  def mount(_params, _session, socket) do
    user_changeset =
      User.changeset(%User{}, %{
        agrees_to_terms_of_service: false,
        agrees_to_marketing_emails: true
      })

    user_changeset2 =
      User.changeset(%User{}, %{
        agrees_to_terms_of_service: false,
        agrees_to_marketing_emails: true
      })

    {:ok,
     assign(socket,
       user_changeset: user_changeset,
       user_changeset2: user_changeset2
     )}
  end

  def handle_params(_params, uri, socket) do
    {:noreply, assign(socket, uri: uri)}
  end

  def get_agrees_to_terms_of_service(user_changeset) do
    Checkbox.is_true(user_changeset.changes[:agrees_to_terms_of_service]) ||
      Checkbox.is_true(user_changeset.data.agrees_to_terms_of_service)
  end

  def handle_event(
        "register_form_update",
        %{
          "user" => params
        },
        socket
      ) do
    user_changeset = User.changeset(%User{}, params)

    {:noreply, assign(socket, user_changeset: user_changeset)}
  end

  def handle_event(
        "register_form_update2",
        %{
          "user" => params
        },
        socket
      ) do
    user_changeset2 = User.changeset(%User{}, params)

    {:noreply, assign(socket, user_changeset2: user_changeset2)}
  end

  def handle_event("register_form_submit", _, socket) do
    user_changeset = Map.merge(socket.assigns.user_changeset, %{action: :insert})

    {:noreply, assign(socket, user_changeset: user_changeset)}
  end

  def checkbox_1_code do
    """
    <Form for={@user_changeset} change="register_form_update" submit="register_form_submit">
      <TopToDown>
        <Field name={:agrees_to_terms_of_service}>
          <Checkbox id="agrees_to_terms_of_service">
            I agree to terms and services.
          </Checkbox>
          <ErrorTag />
        </Field>
        <Field name={:agrees_to_marketing_emails}>
          <Checkbox
            id="agrees_to_marketing_emails"
            disabled={!get_agrees_to_terms_of_service(@user_changeset)}
         >
            I agree to receive bonus & marketing emails.
          </Checkbox>
          <ErrorTag />
        </Field>
        <div>
          <Button type="submit" right_icon="arrows_right" variant="primary">Register</Button>
        </div>
      </TopToDown>
    </Form>
    """
  end

  def checkbox_2_code do
    """
    <Form for={@user_changeset2} change="register_form_update2">
      <TopToDown>
        <Field name={:agrees_to_terms_of_service}>
          <Checkbox id="agrees_to_terms_of_service"/>
          <ErrorTag />
        </Field>
      </TopToDown>
    </Form>
    """
  end

  def checkbox_3_code do
    """
    <Form for={@user_changeset}>
      <TopToDown>
        <Field name={:agrees_to_terms_of_service}>
          <Checkbox id="agrees_to_terms_of_service" disabled={true}>I agree to terms and services.</Checkbox>
          <ErrorTag />
        </Field>
      </TopToDown>
    </Form>
    """
  end

  def checkbox_4_code do
    """
    <Form for={@user_changeset}>
      <TopToDown>
        <Field name={:agrees_to_terms_of_service}>
          <Checkbox id="agrees_to_terms_of_service" disabled={true}>I agree to terms and services.</Checkbox>
          <ErrorTag />
        </Field>
      </TopToDown>
    </Form>
    """
  end

  def checkbox_1_state(assigns) do
    ~F"""
    @user_changeset = {inspect(@user_changeset, pretty: true)}
    """
  end
end
