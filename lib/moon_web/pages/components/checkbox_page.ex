defmodule MoonWeb.Pages.Components.CheckboxPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias Moon.Autolayouts.TopToDown
  alias Moon.Components.Button
  alias Moon.Components.Checkbox
  alias Moon.Components.ErrorTag
  alias Moon.Components.Field
  alias Moon.Components.Form
  alias Moon.Components.Heading
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
        to: "/components/checkbox",
        name: "Checkbox"
      }
    ]

  data props_info_array, :list,
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

  def render(assigns) do
    ~F"""
    <Page theme_name={@theme_name} active_page={@active_page} breadcrumbs={@breadcrumbs}>
      <TopToDown>
        <Heading size={56} class="mb-4">Checkbox</Heading>

        <Context put={theme_class: @theme_name}>
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
              <div class="here flex items-centered justify-items-center justify-evenly">
                <Form for={@user_changeset2} change="register_form_update2">
                  <TopToDown>
                    <Field name={:agrees_to_terms_of_service}>
                      <Checkbox id="agrees_to_terms_of_service" />
                      <ErrorTag />
                    </Field>
                  </TopToDown>
                </Form>
              </div>
            </:example>

            <:code>{checkbox_2_code()}</:code>
          </ExampleAndCode>

          <ExampleAndCode title="Disabled" id="checkbox_3">
            <:example>
              <div class="here flex items-centered justify-items-center justify-evenly">
                <Form for={@user_changeset}>
                  <TopToDown>
                    <Field name={:agrees_to_terms_of_service}>
                      <Checkbox id="agrees_to_terms_of_service" disabled>I agree to terms and services.</Checkbox>
                      <ErrorTag />
                    </Field>
                  </TopToDown>
                </Form>
              </div>
            </:example>

            <:code>{checkbox_3_code()}</:code>
          </ExampleAndCode>

          <ExampleAndCode title="Readonly" id="checkbox_4">
            <:example>
              <div class="here flex items-centered justify-items-center justify-evenly">
                <Form for={@user_changeset2} change="register_form_update2">
                  <TopToDown>
                    <Field name={:agrees_to_terms_of_service}>
                      <Checkbox id="agrees_to_terms_of_service" readonly checked>I agree to terms and services.</Checkbox>
                      <ErrorTag />
                    </Field>
                  </TopToDown>
                </Form>
              </div>
            </:example>

            <:code>{checkbox_4_code()}</:code>
          </ExampleAndCode>
        </Context>

        <div>
          <div class="text-bulma-100 items-center text-xl leading-7 font-normal my-4">Props</div>
          <Table items={@props_info_array}>
            <Column name="name" label="Name" :let={item: item}>
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

  def mount(params, _session, socket) do
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
       user_changeset2: user_changeset2,
       theme_name: params["theme_name"] || "moon-design-light",
       active_page: __MODULE__
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
