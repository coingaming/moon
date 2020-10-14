defmodule Moon.Sites.MoonDocs.Pages.Tutorials.AddDataUsingForm do
  use Moon.LiveView
  use Moon.Components.Context

  alias Moon.Sites.MoonDocs.Layouts.DefaultLayout
  alias Moon.Themed
  alias Moon.Components.Badge
  alias Moon.Components.Inline

  alias Surface.Components.Form
  alias Surface.Components.Form.Field
  alias Moon.Components.TextInput

  data(theme, :any, default: Moon.Themes.SportsbetLight.get_config())
  data(user, :any)

  def mount(params, assigns, socket) do
    {:ok, assign(socket, user: %{name: "", email: ""})}
  end

  def render(assigns) do
    code_as_string = """
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
        ~H\"\"\"
        <Form for={{ :user }} change="updated_user">
          <TextInput name={{ :name }} value={{ @user.name }} autocomplete="off" />
          <TextInput name={{ :email }} value={{ @user.email }} autocomplete="off" />
        </Form>

        <Form for={{ :user }} change="updated_user" opts={{ autocomplete: "off" }}>
          <Field name={{ :name }}>
            <TextInput value={{ @user.name }}/>
          </Field>
          <Field name={{ :email }}>
            <TextInput value={{ @user.email }}/>
          </Field>
        </Form>

        <pre>{{ inspect(@user) }}</pre>
        \"\"\"
      end

      def handle_event("updated_user", %{"user" => %{"name" => name, "email" => email}}, socket) do
        {:noreply, assign(socket, user: %{name: name, email: email})}
      end
    end
    """

    ~H"""
    <Themed theme={{ @theme }}>
      <DefaultLayout id="moondocs" user_token={{ "user_token" }}>

        <Form for={{ :user }} change="updated_user">
          <TextInput name={{ :name }} value={{ @user.name }} autocomplete="off" />
          <TextInput name={{ :email }} value={{ @user.email }} autocomplete="off" />
        </Form>

        <Form for={{ :user }} change="updated_user" opts={{ autocomplete: "off" }}>
          <Field name={{ :name }}>
            <TextInput value={{ @user.name }}/>
          </Field>
          <Field name={{ :email }}>
            <TextInput value={{ @user.email }}/>
          </Field>
        </Form>

        <pre>{{ inspect(@user) }}</pre>
        {{ raw Makeup.highlight(code_as_string) }}
        <style>{{ Makeup.stylesheet() }}</style>
      </DefaultLayout>
    </Themed>
    """
  end

  def handle_event("updated_user", %{"user" => %{"name" => name, "email" => email}}, socket) do
    {:noreply, assign(socket, user: %{name: name, email: email})}
  end
end
