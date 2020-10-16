defmodule Moon.Sites.MoonDocs.Pages.Tutorials.AddDataUsingForm do
  use Moon.LiveView
  use Moon.Components.Context

  alias Moon.Sites.MoonDocs.Layouts.DefaultLayout
  alias Moon.Themed

  alias Moon.Components.Form
  alias Moon.Components.TextInput
  alias Moon.Components.Button
  alias Moon.Components.CodePreview

  data(theme, :any, default: Moon.Themes.SportsbetLight.get_config())
  data(user, :any)

  def mount(_params, _session, socket) do
    user = %{name: "", email: ""}

    {:ok,
     assign(socket,
       user: user
     )}
  end

  def render(assigns) do
    ~H"""
    <Themed theme={{ @theme }}>
      <DefaultLayout id="moondocs" user_token={{ "user_token" }}>

      <h1>Add data using form</h1>

        <Form for={{ :user }} change="update_user_changeset" submit="save_user_data" autocomplete="off">
          <TextInput label="Name" name={{ :name }} value={{ @user.name }} />
          <TextInput label="Email" name={{ :email }} value={{ @user.email }} />
        </Form>

        <Button variant="primary" full_width>Yay</Button>

        <pre>{{ inspect(@user) }}</pre>

        <#CodePreview>
          defmodule Moon.Sites.MoonDocs.Pages.Tutorials.AddDataUsingForm do
            use Moon.LiveView

            alias Moon.Components.Form
            alias Moon.Components.TextInput
            alias Moon.Components.Button

            data(user, :any)

            def mount(params, assigns, socket) do
              {:ok, assign(socket, user: %{name: "", email: ""})}
            end

            def render(assigns) do
              ~H\\\
              <Form for={{ :user }} change="update_user_changeset" submit="save_user_data" opts={{ autocomplete: "off" }}>
                <TextInput label="Name" name={{ :name }} value={{ @user.name }} />
                <TextInput label="Email" name={{ :email }} value={{ @user.email }} />
              </Form>

              <Button variant="primary" full_width>Yay</Button>

              <pre>{{ inspect(@user) }}</pre>
              \\\
            end

            def handle_event("updated_user", %{"user" => %{"name" => name, "email" => email}}, socket) do
              {:noreply, assign(socket, user: %{name: name, email: email})}
            end
          end
        </#CodePreview>
      </DefaultLayout>
    </Themed>
    """
  end

  def handle_event(
        "update_user_changeset",
        %{"user" => %{"name" => name, "email" => email}},
        socket
      ) do
    {:noreply, assign(socket, user: %{name: name, email: email})}
  end
end
