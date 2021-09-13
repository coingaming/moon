defmodule MoonWeb.Pages.Components.TextInputPage do
  use MoonWeb, :live_view
  alias Moon.Assets.Icons.IconHamburger
  alias Moon.Assets.Icons.IconMail
  alias Moon.Assets.Icons.IconUser
  alias Moon.Assets.Icons.IconZoom
  alias Moon.Autolayouts.TopToDown
  alias Moon.Components.CodePreview
  alias Moon.Components.Form
  alias Moon.Components.Heading
  alias Moon.Components.Link
  alias Moon.Components.TextInput
  alias MoonWeb.Components.Page
  alias MoonWeb.Components.ExampleAndCode
  alias MoonWeb.Pages.Tutorials.AddDataUsingForm.User

  data breadcrumbs, :any,
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

  @default_user_map %{
    name: "",
    email: ""
  }

  def mount(params, _session, socket) do
    user_changeset = User.changeset(%User{gender: "male"}, @default_user_map)

    {:ok,
     assign(socket,
       theme_name: params["theme_name"] || "sportsbet-dark",
       active_page: __MODULE__,
       user_changeset: user_changeset,
       user_changeset_disabled: user_changeset,
       user_changeset_two_icons: user_changeset,
       user_changeset_two_icons_with_events: user_changeset,
       user_changeset_left_icon: user_changeset
     )}
  end

  def handle_params(_params, uri, socket) do
    {:noreply, assign(socket, uri: uri)}
  end

  def render(assigns) do
    ~F"""
    <Page theme_name={@theme_name} active_page={@active_page} breadcrumbs={@breadcrumbs}>
      <TopToDown gap={4}>
        <Heading size={56} class="mb-4">Text Input</Heading>

        <p>
          <Link to="https://www.figma.com/file/S3q1SkVngbwHuwpxHKCsgtJj/Moon---Components?node-id=5400%3A1634">Figma design</Link>
          <Link to="https://github.com/coingaming/moon/blob/master/lib/moon_web/pages/components/text_input_page.ex">Sourcecode of this page</Link>
          <Link to="https://moon.io/components/textInput">React implementation</Link>
        </p>

        {!-- Regular text input --}

        The input component is used when you need to let users enter the text of some kind, such as their name or phone number etc.

        <ExampleAndCode id="text_input_1">
          <:example>
            <Form
              for={@user_changeset}
              change="update_user_changeset"
              submit="save_user_changeset"
              autocomplete="off"
            >
              <TopToDown gap={4}>
                <TextInput label="Username" placeholder="Username" required field={:name} />
                <TextInput type="email" placeholder="username@example.com" field={:email} />
              </TopToDown>
            </Form>
          </:example>

          <:code>
            <#CodePreview>
      alias Moon.Autolayouts.TopToDown
      alias Moon.Components.Form
      alias Moon.Components.TextInput

      <Form
        for={@user_changeset}
        change="update_user_changeset"
        submit="save_user_changeset"
        autocomplete="off"
      >
        <TopToDown gap={4}>
          <TextInput label="Username" placeholder="Username" required={true} field={:name} />
          <TextInput type="email" placeholder="username@example.com" field={:email} />
        </TopToDown>
      </Form>
        </#CodePreview>
          </:code>

          <:state>@user_changeset = {inspect(@user_changeset, pretty: true)}</:state>
        </ExampleAndCode>

        {!-- Disabled  text input --}

        The input component in disabled state

        <ExampleAndCode id="text_input_2">
          <:example>
            <Form
              for={@user_changeset_disabled}
              change="update_user_changeset_disabled"
              submit="save_user_changeset"
              autocomplete="off"
            >
              <TextInput disabled label="Text Input" placeholder="e.g. username" field={:name} />
            </Form>
          </:example>

          <:code>
            <#CodePreview>
      alias Moon.Components.Form
      alias Moon.Components.TextInput

      <Form
        for={@user_changeset_disabled}
        change="update_user_changeset_disabled"
        submit="save_user_changeset"
        autocomplete="off"
      >
        <TextInput disabled={true} label="Text Input" placeholder="e.g. username" field={:name} />
      </Form>
        </#CodePreview>
          </:code>

          <:state>@user_changeset_disabled = {inspect(@user_changeset_disabled, pretty: true)}</:state>
        </ExampleAndCode>

        {!-- Text input with icon on the left --}
        The input component with icon on the left

        <ExampleAndCode id="text_input_3">
          <:example>
            <Form
              for={@user_changeset_left_icon}
              change="update_user_changeset_left_icon"
              submit="save_user_changeset"
              autocomplete="off"
            >
              <TopToDown gap={4}>
                <TextInput label="Text Input with Left Icon" placeholder="Username" field={:name}>
                  <:left_icon><IconUser /></:left_icon>
                </TextInput>

                <TextInput placeholder="Email" type="email" field={:email}>
                  <:left_icon><IconMail /></:left_icon>
                </TextInput>
              </TopToDown>
            </Form>
          </:example>

          <:code>
            <#CodePreview>
      alias Moon.Assets.Icons.IconUser
      alias Moon.Components.Form
      alias Moon.Components.TextInput

      <Form
        for={@user_changeset_left_icon}
        change="update_user_changeset_left_icon"
        submit="save_user_changeset"
        autocomplete="off"
      >
        <TextInput
          label="Text Input with Left Icon"
          placeholder="Username"
          field={:name}
        >
          <:left_icon><IconUser /></:left_icon>
        </TextInput>
      </Form>
        </#CodePreview>
          </:code>

          <:state>@user_changeset_left_icon = {inspect(@user_changeset_left_icon, pretty: true)}</:state>
        </ExampleAndCode>

        {!-- Text input with two icons --}
        Input component with two icons

        <ExampleAndCode id="text_input_4">
          <:example>
            <Form
              for={@user_changeset_two_icons}
              change="update_user_changeset_two_icons"
              submit="save_user_changeset"
              autocomplete="off"
            >
              <TextInput label="Text Inputs with Two Icons" placeholder="e.g. username" field={:name}>
                <:left_icon><IconZoom /></:left_icon>
                <:right_icon><IconHamburger /></:right_icon>
              </TextInput>
            </Form>
          </:example>

          <:code>
            <#CodePreview>
      alias Moon.Assets.Icons.IconHamburger
      alias Moon.Assets.Icons.IconZoom
      alias Moon.Components.Form
      alias Moon.Components.TextInput

      <Form
        for={@user_changeset_two_icons}
        change="user_changeset_two_icons"
        submit="save_user_changeset"
        autocomplete="off"
      >
        <TextInput
          label="Text Inputs with Two Icons"
          placeholder="e.g. username"
          field={:name}
        >
          <:left_icon><IconZoom /></:left_icon>
          <:right_icon><IconHamburger /></:right_icon>
        </TextInput>
      </Form>
        </#CodePreview>
          </:code>

          <:state>@user_changeset_two_icons = {inspect(@user_changeset_two_icons, pretty: true)}</:state>
        </ExampleAndCode>

        {!-- Text input with two icons with events --}
        Input component with two icons with events

        <ExampleAndCode id="text_input_5">
          <:example>
            <Form
              for={@user_changeset_two_icons_with_events}
              change="update_user_changeset_two_icons_with_events"
              submit="save_user_changeset"
              autocomplete="off"
            >
              <TextInput
                label="Text Inputs with Two Icons with Events"
                placeholder="e.g. username"
                field={:name}
              >
                <:left_icon><IconZoom click="clear_search" /></:left_icon>
                <:right_icon><IconHamburger click="clear_search" /></:right_icon>
              </TextInput>
            </Form>
          </:example>

          <:code>
            <#CodePreview>
        alias Moon.Assets.Icons.IconHamburger
        alias Moon.Assets.Icons.IconZoom
        alias Moon.Components.Form
        alias Moon.Components.TextInput

        <Form
          for={@user_changeset_two_icons}
          change="update_user_changeset_two_icons_with_events"
          submit="save_user_changeset"
          autocomplete="off"
        >
          <TextInput
            label="Text Inputs with Two Icons"
            placeholder="e.g. username"
            field={:name}

          >
            <:left_icon><IconZoom click="clear_search" /></:left_icon>
            <:right_icon><IconHamburger click="clear_search" /></:right_icon>
          </TextInput>
        </Form>
          </#CodePreview>
          </:code>

          <:state>@user_changeset_two_icons_with_events = {inspect(@user_changeset_two_icons_with_events, pretty: true)}</:state>
        </ExampleAndCode>
      </TopToDown>
    </Page>
    """
  end

  def handle_event(
        "update_user_changeset",
        %{"user" => %{"name" => name, "email" => email}},
        socket
      ) do
    user_changeset =
      User.changeset(%User{gender: "male"}, %{
        name: name,
        email: email
      })

    {:noreply, assign(socket, user_changeset: user_changeset)}
  end

  def handle_event(
        "update_user_changeset_disabled",
        %{"user" => %{"name" => name}},
        socket
      ) do
    user_changeset =
      User.changeset(%User{gender: "male"}, %{
        name: name
      })

    {:noreply, assign(socket, user_changeset_disabled: user_changeset)}
  end

  def handle_event(
        "update_user_changeset_left_icon",
        %{"user" => %{"name" => name, "email" => email}},
        socket
      ) do
    user_changeset =
      User.changeset(%User{gender: "male"}, %{
        name: name,
        email: email
      })

    {:noreply, assign(socket, user_changeset_left_icon: user_changeset)}
  end

  def handle_event(
        "update_user_changeset_two_icons",
        %{"user" => %{"name" => name}},
        socket
      ) do
    user_changeset =
      User.changeset(%User{email: "foo@bar.com", gender: "male"}, %{
        name: name
      })

    {:noreply, assign(socket, user_changeset_two_icons: user_changeset)}
  end

  def handle_event(
        "update_user_changeset_two_icons_with_events",
        %{"user" => %{"name" => name}},
        socket
      ) do
    user_changeset =
      User.changeset(%User{email: "foo@bar.com", gender: "male"}, %{
        name: name
      })

    {:noreply, assign(socket, user_changeset_two_icons_with_events: user_changeset)}
  end

  def handle_event("clear_search", _, socket) do
    user_changeset =
      User.changeset(%User{email: "", gender: ""}, %{
        name: ""
      })

    {:noreply, assign(socket, user_changeset_two_icons_with_events: user_changeset)}
  end
end
