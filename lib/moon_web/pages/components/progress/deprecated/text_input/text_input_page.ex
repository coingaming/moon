defmodule MoonWeb.Pages.Components.TextInput.Deprecated.TextInputPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias Moon.Assets.Icons.IconMail
  alias Moon.Assets.Icons.IconUser
  alias Moon.Autolayouts.TopToDown
  alias Moon.Components.Button
  alias Moon.Components.ErrorTag
  alias Moon.Components.Field
  alias Moon.Components.Form
  alias Moon.Components.Heading
  alias Moon.Components.Deprecated.TextInput
  alias MoonWeb.Components.ExampleAndCode
  alias MoonWeb.Components.Page
  alias MoonWeb.Pages.Tutorials.AddDataUsingForm.User
  alias MoonWeb.Components.Table.Table
  alias MoonWeb.Components.Table.Column

  data(breadcrumbs, :any,
    default: [
      %{
        to: "#",
        name: "Components"
      },
      %{
        to: "/components/text_input",
        name: "Text Input"
      }
    ]
  )

  data(props_info_array, :list,
    default: [
      %{
        :name => ~c"type",
        :type =>
          ~c"date | datetime-local\" | email | number | password | search | tel | text | url | time | url",
        :required => ~c"No",
        :default => ~c"text",
        :description => ~c"Different types of input"
      },
      %{
        :name => ~c"size",
        :type => ~c"medium | large | xlarge",
        :required => ~c"-",
        :default => ~c"medium",
        :description =>
          ~c"TODO - Size variant (currently only medium | large, with large as default)"
      },
      %{
        :name => ~c"label",
        :type => ~c"string",
        :required => ~c"true",
        :default => ~c"-",
        :description => ~c"TODO - Should be required for medium size only"
      },
      %{
        :name => ~c"placeholder",
        :type => ~c"string",
        :required => ~c"No",
        :default => ~c"-",
        :description => ~c"Placeholder for input"
      },
      %{
        :name => ~c"field",
        :type => ~c"atom",
        :required => ~c"true",
        :default => ~c"-",
        :description => ~c"Field value for underlying pheonix text input component"
      },
      %{
        :name => ~c"hint_text",
        :type => ~c"slot",
        :required => ~c"No",
        :default => ~c"-",
        :description => ~c"Informative or error message under input"
      },
      %{
        :name => ~c"error",
        :type => ~c"boolean",
        :required => ~c"No",
        :default => ~c"-",
        :description => ~c"Set error state for input"
      },
      %{
        :name => ~c"show_password_text",
        :type => ~c"-",
        :required => ~c"-",
        :default => ~c"-",
        :description =>
          ~c"TODO - Only for input type password. Text for toggle button: show/hide password"
      },
      %{
        :name => ~c"background_color",
        :type => ~c"string",
        :required => ~c"No",
        :default => ~c"-",
        :description => ~c"Background color"
      }
    ]
  )

  def render(assigns) do
    ~F"""
    <Page {=@theme_name} {=@active_page} {=@breadcrumbs} {=@direction}>
      <TopToDown>
        <Heading size={56} class="mb-4">Text Input</Heading>

        <div>
          The input component is used when you need to let users enter the text of some kind, such as their name or phone number etc.
        </div>

        <ExampleAndCode id="example_1">
          <:example>
            <Form
              for={@user_changeset}
              change="register_form_update"
              submit="register_form_submit"
              autocomplete="off"
            >
              <TopToDown>
                <Field name={:username}>
                  <TextInput label="Username" placeholder="Username">
                    <:left_icon><IconUser /></:left_icon>
                    <:right_icon>
                      {#if String.length(@user_changeset.changes[:username] || @user.username || "") > 0}
                        <Moon.Icons.ControlsClose class="pointer" click="clear_username" />
                      {/if}
                    </:right_icon>
                  </TextInput>
                  <ErrorTag />
                </Field>
                <Field name={:email}>
                  <TextInput
                    label="Email"
                    placeholder="Email"
                    type="email"
                    disabled={!get_has_valid_username(@user_changeset)}
                  >
                    <:left_icon><IconMail /></:left_icon>
                  </TextInput>
                  <ErrorTag />
                </Field>
                <div>
                  <Button type="submit" right_icon="arrows_right" variant="primary">Register</Button>
                </div>
              </TopToDown>
            </Form>
          </:example>

          <:code>{example_1_code()}</:code>

          <:state>{example_1_state(assigns)}</:state>
        </ExampleAndCode>

        <div>
          <div class="text-bulma items-center text-moon-20 font-normal my-4">TabLink Props Tabs</div>
          <Table items={item <- @props_info_array}>
            <Column name="name" label="Name" is_row_header>
              {item.name}
            </Column>
            <Column name="type" label="Type">
              {item.type}
            </Column>
            <Column name="required" label="Required">
              {item.required}
            </Column>
            <Column name="default" label="Default">
              {item.default}
            </Column>
            <Column name="description" label="Description">
              {item.description}
            </Column>
          </Table>
        </div>
      </TopToDown>
    </Page>
    """
  end

  def mount(_params, _session, socket) do
    user = %User{}
    user_changeset = User.changeset(user, %{})

    {:ok,
     assign(socket,
       user: user,
       user_changeset: user_changeset
     )}
  end

  def handle_params(_params, uri, socket) do
    {:noreply, assign(socket, uri: uri)}
  end

  def get_has_valid_username(user_changeset) do
    !Keyword.has_key?(user_changeset.errors, :username)
  end

  def handle_event("register_form_update", params, socket) do
    user_changeset = User.changeset(socket.assigns.user, params["user"])

    {:noreply, assign(socket, user_changeset: user_changeset)}
  end

  def handle_event("register_form_submit", params, socket) do
    user_changeset =
      User.changeset(socket.assigns.user, params["user"]) |> Map.merge(%{action: :insert})

    {:noreply, assign(socket, user_changeset: user_changeset)}
  end

  def handle_event("clear_username", _, socket) do
    user_changeset =
      User.changeset(socket.assigns.user, %{
        username: "",
        email: socket.assigns.user_changeset.changes["email"]
      })

    {:noreply, assign(socket, user_changeset: user_changeset)}
  end

  def example_1_code do
    """
    <Form
      for={@user_changeset}
      change="register_form_update"
      submit="register_form_submit"
      autocomplete="off"
    >
      <TopToDown>
        <Field name={:username}>
          <TextInput label="Username" placeholder="Username">
            <:left_icon><IconUser /></:left_icon>
            <:right_icon>
              {#if String.length(@username)> 0}
                <Moon.Icons.ControlsClose class="pointer" click="clear_username" />
              {/if}
            </:right_icon>
          </TextInput>
          <ErrorTag />
        </Field>
        <Field name={:email}>
          <TextInput label="Email" placeholder="Email" type="email" disabled={!get_has_valid_username(@user_changeset)}>
            <:left_icon><IconMail /></:left_icon>
          </TextInput>
          <ErrorTag />
        </Field>
        <div>
          <Button type="submit" right_icon="arrows_right" variant="primary">Register</Button>
        </div>
      </TopToDown>
    </Form>
    """
  end

  def example_1_state(assigns) do
    ~F"""
    @user_changeset = {inspect(@user_changeset, pretty: true)}
    @user = {inspect(@user, pretty: true)}
    """
  end
end
