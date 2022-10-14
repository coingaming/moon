defmodule MoonWeb.Pages.Components.SwitchPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias Moon.Components.Switch
  alias MoonWeb.Components.ExampleAndCode
  alias Moon.Components.Field
  alias Moon.Components.Form
  alias MoonWeb.Pages.Tutorials.AddDataUsingForm.User
  alias MoonWeb.Components.Page
  alias MoonWeb.Components.ComponentPageDescription
  alias MoonWeb.Components.PropsTable
  alias Moon.Components.Button
  alias Moon.Components.ErrorTag

  data breadcrumbs, :any,
    default: [
      %{
        to: "#",
        name: "Components"
      },
      %{
        to: "/components/switch",
        name: "Switch"
      }
    ]

  data props_info_array, :list,
    default: [
      %{
        :name => 'checked',
        :type => 'boolean ',
        :required => 'false',
        :default => 'false',
        :description => 'Is switch checked/unchecked'
      },
      %{
        :name => 'caption_unchecked',
        :type => 'string',
        :required => 'true',
        :default => '-',
        :description => 'Displayed text when unchecked'
      },
      %{
        :name => 'caption_checked',
        :type => 'string',
        :required => 'true',
        :default => '-',
        :description => 'Displayed text when checked'
      },
      %{
        :name => 'field',
        :type => 'atom',
        :required => 'false',
        :default => 'false',
        :description => 'If not used in Field component, needs to be specified'
      }
    ]

  def render(assigns) do
    ~F"""
    <Page {=@theme_name} {=@active_page} {=@breadcrumbs} {=@direction}>
      <ComponentPageDescription title="Switch">
        <p>
          Switch
        </p>
      </ComponentPageDescription>

      <ExampleAndCode title="Size" class="mt-3" id="switch_2_sample">
        <:example>
          <Form for={@user_changeset} change="register_form_update" submit="register_form_submit">
            <Switch field={:agrees_to_terms_of_service} size="small" id="switch_2_1" />
          </Form>
          <Form for={@user_changeset} change="register_form_update" submit="register_form_submit">
            <Switch field={:agrees_to_terms_of_service} size="medium" id="switch_2_2" />
          </Form>
          <Form for={@user_changeset} change="register_form_update" submit="register_form_submit">
            <Switch field={:agrees_to_terms_of_service} size="large" id="switch_2_3" />
          </Form>
        </:example>

        <:code>{switch_2_code()}</:code>

        <:state>{switch_1_state(assigns)}</:state>
      </ExampleAndCode>

      <ExampleAndCode title="Icons" class="mt-3" id="switch_3_sample">
        <:example>
          <Form for={@user_changeset} change="register_form_update" submit="register_form_submit">
            <Field name={:agrees_to_terms_of_service}>
              <Switch id="switch_3_1" icons size="small" />
            </Field>
          </Form>
          <Form for={@user_changeset} change="register_form_update" submit="register_form_submit">
            <Field name={:agrees_to_terms_of_service}>
              <Switch id="switch_3_2" icons size="medium" />
            </Field>
          </Form>
          <Form for={@user_changeset} change="register_form_update" submit="register_form_submit">
            <Field name={:agrees_to_terms_of_service}>
              <Switch id="switch_3_3" icons size="large" />
            </Field>
          </Form>
        </:example>

        <:code>{switch_3_code()}</:code>

        <:state>{switch_1_state(assigns)}</:state>
      </ExampleAndCode>

      <ExampleAndCode title="Captions" class="mt-3" id="switch_4_sample">
        <:example>
          <Form for={@user_changeset} change="register_form_update" submit="register_form_submit">
            <Field name={:agrees_to_terms_of_service}>
              <Switch icons={false} size="small" caption_unchecked="AM" caption_checked="PM" id="switch_4_1" />
            </Field>
          </Form>
          <Form for={@user_changeset} change="register_form_update" submit="register_form_submit">
            <Field name={:agrees_to_terms_of_service}>
              <Switch icons size="medium" caption_unchecked="OFF" caption_checked="ON" id="switch_4_2" />
            </Field>
          </Form>
          <Form for={@user_changeset} change="register_form_update" submit="register_form_submit">
            <Field name={:agrees_to_terms_of_service}>
              <Switch icons size="large" caption_unchecked="Moon" caption_checked="Sun" id="switch_4_3" />
            </Field>
          </Form>
        </:example>

        <:code>{switch_4_code()}</:code>

        <:state>{switch_1_state(assigns)}</:state>
      </ExampleAndCode>

      <ExampleAndCode title="Form example" class="mt-3" id="switch_5_sample">
        <:example>
          <Form for={@user_changeset} change="register_form_update" submit="register_form_submit">
            <div class="text-moon-16 mb-3">Agrees to Terms of Service</div>
            <Field name={:agrees_to_terms_of_service}>
              <Switch icons={false} size="small" id="switch_5_1" />
              <ErrorTag />
            </Field>
            <div class="pt-4">
              <Button type="submit" right_icon="arrows_right" variant="primary">Register</Button>
            </div>
          </Form>
        </:example>

        <:code>{switch_5_code()}</:code>

        <:state>{switch_1_state(assigns)}</:state>
      </ExampleAndCode>

      <PropsTable data={@props_info_array} />
    </Page>
    """
  end

  def mount(params, _session, socket) do
    user = %User{}

    user_changeset =
      User.changeset(%User{}, %{
        agrees_to_terms_of_service: true,
        agrees_to_marketing_emails: false
      })

    socket =
      assign(socket,
        user_changeset: user_changeset,
        theme_name: params["theme_name"] || "moon-design-light",
        direction: params["direction"] || "ltr",
        active_page: __MODULE__,
        small_switch_checked: false,
        medium_switch_checked: false,
        large_switch_checked: false,
        icons_switch_checked: false,
        captions_switch_checked: false,
        user: user
      )

    {:ok, socket}
  end

  def handle_params(_params, uri, socket) do
    {:noreply, assign(socket, uri: uri)}
  end

  def handle_event(
        "register_form_update",
        %{
          "user" => params
        },
        socket
      ) do
    user_changeset = User.changeset(socket.assigns.user, params)
    {:noreply, assign(socket, user_changeset: user_changeset)}
  end

  def handle_event("register_form_submit", params, socket) do
    user_changeset =
      User.changeset(socket.assigns.user, params["user"]) |> Map.merge(%{action: :insert})

    {:noreply, assign(socket, user_changeset: user_changeset)}
  end

  def switch_1_state(assigns) do
    ~F"""
    @user_changeset = {inspect(@user_changeset, pretty: true)}
    """
  end

  def switch_2_code do
    """
    <Form for={@user_changeset} change="register_form_update" submit="register_form_submit">
      <Field name={:agrees_to_terms_of_service}>
        <Switch size="small" id="switch_2_1" checked={@small_switch_checked} />
      </Field>
    </Form>
    <Form for={@user_changeset} change="register_form_update" submit="register_form_submit">
      <Field name={:agrees_to_terms_of_service}>
        <Switch
          size="medium"
          id="switch_2_2"
          checked={@medium_switch_checked}
        />
      </Field>
    </Form>
    <Form for={@user_changeset} change="register_form_update" submit="register_form_submit">
      <Field name={:agrees_to_terms_of_service}>
        <Switch
          size="large"
          id="switch_2_3"
          checked={@large_switch_checked}
        />
      </Field>
    </Form>
    """
  end

  def switch_3_code do
    """
    <Form for={@user_changeset} change="register_form_update" submit="register_form_submit">
      <Field name={:agrees_to_terms_of_service}>
        <Switch id="switch_3_1" icons size="small" />
      </Field>
    </Form>
    <Form for={@user_changeset} change="register_form_update" submit="register_form_submit">
      <Field name={:agrees_to_terms_of_service}>
        <Switch id="switch_3_2" icons size="medium" />
      </Field>
    </Form>
    <Form for={@user_changeset} change="register_form_update" submit="register_form_submit">
      <Field name={:agrees_to_terms_of_service}>
        <Switch id="switch_3_3" icons size="large" />
      </Field>
    </Form>
    """
  end

  def switch_4_code do
    """
    <Form for={@user_changeset} change="register_form_update" submit="register_form_submit">
      <Field name={:agrees_to_terms_of_service}>
        <Switch
          icons={false}
          size="small"
          caption_unchecked="AM"
          caption_checked="PM"
          id="switch_4_1"
        />
      </Field>
    </Form>
    <Form for={@user_changeset} change="register_form_update" submit="register_form_submit">
      <Field name={:agrees_to_terms_of_service}>
        <Switch
          icons
          size="medium"
          caption_unchecked="OFF"
          caption_checked="ON"
          id="switch_4_2"
        />
      </Field>
    </Form>
    <Form for={@user_changeset} change="register_form_update" submit="register_form_submit">
      <Field name={:agrees_to_terms_of_service}>
        <Switch
          icons
          size="large"
          caption_unchecked="Moon"
          caption_checked="Sun"
          id="switch_4_3"
        />
      </Field>
    </Form>
    """
  end

  def switch_5_code do
    """
    <Form for={@user_changeset} change="register_form_update" submit="register_form_submit">
      <div class="text-moon-16 mb-3">Agrees to Terms of Service</div>
      <Field name={:agrees_to_terms_of_service}>
        <Switch icons={false} size="small" id="switch_5_1" />
        <ErrorTag />
      </Field>
      <div class="pt-4">
        <Button type="submit" right_icon="arrows_right" variant="primary">Register</Button>
      </div>
    </Form>
    """
  end
end
