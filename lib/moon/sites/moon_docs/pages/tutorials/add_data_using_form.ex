defmodule Moon.Sites.MoonDocs.Pages.Tutorials.AddDataUsingForm do
  use Moon.LiveView
  use Moon.Components.Context

  alias Moon.Sites.MoonDocs.Layouts.DefaultLayout
  alias Moon.Themed

  alias Surface.Components.Form
  alias Surface.Components.Form.Field

  alias Moon.Components.Badge
  alias Moon.Components.Inline
  alias Moon.Components.TextInput
  alias Moon.Components.Button
  alias Moon.Components.CodePreview

  data(theme, :any, default: Moon.Themes.SportsbetLight.get_config())
  data(user, :any)

  def mount(params, assigns, socket) do
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

        <Form for={{ :user }} change="update_user_changeset" submit="save_user_data">
          <TextInput name={{ :name }} value={{ @user.name }} autocomplete="off" />
          <TextInput name={{ :email }} value={{ @user.email }} autocomplete="off" />
        </Form>

        <Form for={{ :user }} change="update_user_changeset" submit="save_user_data" opts={{ autocomplete: "off" }}>
          <Field name={{ :name }}>
            <TextInput value={{ @user.name }}/>
          </Field>
          <Field name={{ :email }}>
            <TextInput value={{ @user.email }}/>
          </Field>

          <Button variant="primary" full_width>Yay</Button>
        </Form>

        <pre>{{ inspect(@user) }}</pre>

        <#CodePreview>
          defmodule Moon.Sites.MoonDocs.Pages.Tutorials.AddDataUsingForm do
            use Moon.LiveView

            alias Surface.Components.Form
            alias Surface.Components.Form.Field
            alias Moon.Components.TextInput

            data(user, :any)

            def mount(params, assigns, socket) do
              {:ok, assign(socket, user: %{name: "", email: ""})}
            end

            def render(assigns) do
              ~H\\\
              <Form for={{ :user }} change="update_user_changeset" submit="save_user_data">
                <TextInput name={{ :name }} value={{ @user.name }} autocomplete="off" />
                <TextInput name={{ :email }} value={{ @user.email }} autocomplete="off" />
              </Form>

              <Form for={{ :user }} change="update_user_changeset" submit="save_user_data" opts={{ autocomplete: "off" }}>
                <Field name={{ :name }}>
                  <TextInput value={{ @user.name }}/>
                </Field>
                <Field name={{ :email }}>
                  <TextInput value={{ @user.email }}/>
                </Field>

                <Button variant="primary" full_width>Yay</Button>
              </Form>

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

  def handle_event("update_user_changeset", %{"user" => %{"name" => name, "email" => email}}, socket) do
    {:noreply, assign(socket, user: %{name: name, email: email})}
  end
end
