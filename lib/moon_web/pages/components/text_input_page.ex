defmodule MoonWeb.Pages.Components.TextInputPage do
  use MoonWeb, :live_view
  alias Moon.Components.Form
  alias Moon.Components.TextInput
  alias Moon.Components.CodePreview
  alias Moon.Autolayouts.TopToDown
  alias Moon.Components.Heading
  alias Moon.Components.Link
  alias MoonWeb.Components.ExampleAndCode
  alias MoonWeb.Pages.Tutorials.AddDataUsingForm.User

  @default_user_map %{
    name: "",
    email: "",
    gender: "",
    document_filename: nil
  }

  def mount(params, _session, socket) do
    user_changeset = User.changeset(%User{}, @default_user_map)

    {:ok,
     assign(socket,
       theme_name: params["theme_name"] || "sportsbet-dark",
       active_page: __MODULE__,
       user_changeset: user_changeset
     )}
  end

  def render(assigns) do
    ~F"""
    <TopToDown>
      <Heading size={32}>Text Input</Heading>

      <p>
        <Link to="https://www.figma.com/file/S3q1SkVngbwHuwpxHKCsgtJj/Moon---Components?node-id=5400%3A1634">Figma design</Link>
        <Link to="https://github.com/coingaming/moon/blob/master/lib/moon_web/pages/components/text_input_page.ex">Sourcecode of this page</Link>
        <Link to="https://moon.io/components/textInput">React implementation</Link>
      </p>

      <Heading size={24} class="mt-4" is_regular>Usage</Heading>
      The input component is used when you need to let users enter the text of some kind, such as their name or phone number etc.

      <ExampleAndCode show_state>
        <:example>
          <Form
            for={@user_changeset}
            change="update_user_changeset"
            submit="save_user_changeset"
            autocomplete="off"
          >
            <TextInput label="Text Input" placeholder="e.g. username" field={:name} />
          </Form>
        </:example>

        <:code>
          <#CodePreview>
      alias Moon.Components.Form
      alias Moon.Components.TextInput

      <Form
        for={@user_changeset}
        change="update_user_changeset"
        submit="save_user_changeset"
        autocomplete="off"
      >
        <TextInput label="Text Input" placeholder="e.g. username" field={:name} />
      </Form>
        </#CodePreview>
        </:code>

        <:state>
          @user_changeset = {inspect(@user_changeset)}
        </:state>
      </ExampleAndCode>
    </TopToDown>
    """
  end

  def handle_event(
        "update_user_changeset",
        %{"user" => %{"name" => name}},
        socket
      ) do
    user_changeset =
      User.changeset(%User{}, %{
        name: name
      })

    {:noreply, assign(socket, user_changeset: user_changeset)}
  end
end
