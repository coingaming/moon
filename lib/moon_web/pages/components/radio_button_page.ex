defmodule MoonWeb.Pages.Components.RadioButtonPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias Moon.Autolayouts.TopToDown
  alias Moon.Components.Button
  alias Moon.Components.RadioButton
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
        to: "/components/radio-button",
        name: "RadioButton"
      }
    ]

  data props_info_array, :list,
    default: [
      %{
        :name => 'id',
        :type => 'string',
        :required => 'true',
        :default => '-',
        :description => 'Unique element\'s identifier'
      },
      %{
        :name => 'default',
        :type => 'slot',
        :required => 'true',
        :default => '-',
        :description => 'Represent a caption for an item'
      },
      %{
        :name => 'field',
        :type => 'atom',
        :required => 'true',
        :default => '-',
        :description => 'Field name for underlying surface radio button component'
      },
      %{
        :name => 'aria_label',
        :type => '-',
        :required => '-',
        :default => '-',
        :description => 'TODO - Defines a string value that labels the current element'
      },
      %{
        :name => 'checked',
        :type => 'boolean',
        :required => 'false',
        :default => 'false',
        :description =>
          'A Boolean indicating whether or not this radio button is the default-selected item in the group'
      },
      %{
        :name => 'click',
        :type => 'event',
        :required => 'true',
        :default => '-',
        :description => 'Event handler'
      }
    ]

  def render(assigns) do
    ~F"""
    <Page theme_name={@theme_name} active_page={@active_page} breadcrumbs={@breadcrumbs}>
      <TopToDown>
        <Heading size={56} class="mb-4">RadioButton</Heading>
        <ExampleAndCode title="RadioButton" id="radiobutton_1">
          <:example>
            <Form for={@user_changeset} change="register_form_update" submit="register_form_submit">
              <TopToDown>
                <Field name={:role}>
                  <RadioButton id="role_admin" value={1}>
                    Admin
                  </RadioButton>
                  <ErrorTag />
                </Field>
                <Field name={:role}>
                  <RadioButton id="role_editor" value={2}>
                    Editor
                  </RadioButton>
                  <ErrorTag />
                </Field>
                <Field name={:role}>
                  <RadioButton id="role_user" value={3} disabled>
                    User (disabled)
                  </RadioButton>
                  <ErrorTag />
                </Field>
                <div>
                  <Button type="submit" right_icon="arrows_right" variant="primary">Save</Button>
                </div>
              </TopToDown>
            </Form>
          </:example>
          <:code>{radiobutton_1_code()}</:code>
          <:state>{radiobutton_1_state(assigns)}</:state>
        </ExampleAndCode>

        <div>
          <div class="text-bulma-100 items-center text-xl leading-7 font-normal my-4">Props</div>
          <Table items={@props_info_array}>
            <Column name="name" label="Name" :let={item: item} is_row_header>
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
        role: 1
      })

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

  def handle_event("register_form_submit", _, socket) do
    user_changeset = Map.merge(socket.assigns.user_changeset, %{action: :insert})

    {:noreply, assign(socket, user_changeset: user_changeset)}
  end

  def radiobutton_1_code do
    """
    <Form for={@user_changeset} change="register_form_update" submit="register_form_submit">
      <TopToDown>
        <Field name={:role}>
          <RadioButton id="role_admin" value={1}>
            Admin
          </RadioButton>
          <ErrorTag />
        </Field>
        <Field name={:role}>
          <RadioButton id="role_editor" value={2}>
            Editor
          </RadioButton>
          <ErrorTag />
        </Field>
        <Field name={:role}>
          <RadioButton id="role_user" value={3} disabled>
            User (disabled)
          </RadioButton>
          <ErrorTag />
        </Field>
        <div>
          <Button type="submit" right_icon="arrows_right" variant="primary">Save</Button>
        </div>
      </TopToDown>
    </Form>
    """
  end

  def radiobutton_1_state(assigns) do
    ~F"""
    @user_changeset = {inspect(@user_changeset, pretty: true)}
    """
  end
end
