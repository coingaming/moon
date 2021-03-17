defmodule MoonWeb.Pages.Tutorials.AddDataUsingForm do
  use MoonWeb, :live_view
  alias Moon.Components.Form
  alias Moon.Components.TextInput
  alias Moon.Components.Button
  alias Moon.Components.Select
  alias Moon.Components.CodePreview
  alias Moon.Components.Heading
  alias Moon.Components.Link
  alias MoonWeb.Components.ExampleAndCode

  alias MoonWeb.Pages.Tutorials.AddDataUsingForm.User

  data(user, :any)
  data(gender_options, :any)

  def mount(%{"theme_name" => theme_name}, _session, socket) do
    user_map = %{
      name: "",
      email: "",
      gender: ""
    }

    user_changeset = User.changeset(%User{}, user_map)

    gender_options = [
      [key: "Female", value: "female"],
      [key: "Male", value: "male"],
      [key: "Invalid choice", value: "invalid"],
      [key: "I identify as God and this is not important", value: "god", disabled: true]
    ]

    {:ok,
     assign(socket,
       theme_name: theme_name,
       active_page: __MODULE__,
       user_map: user_map,
       user_changeset: user_changeset,
       gender_options: gender_options
     )}
  end

  def render(assigns) do
    ~H"""
    <Heading size=32>Mutate data using form</Heading>

    <p>
      Moon Forms -> Surface Forms -> Phoenix LiveView forms -> HTML forms
    </p>

    <p class="mt-4">
      <Link to="https://github.com/coingaming/moon/blob/master/lib/moon_web/pages/components/dropdown_page.ex">Sourcecode of this page</Link>
    </p>

    <Heading size=24 class="mt-8 mb-4">Add data using form</Heading>

    <Heading size=18 class="mt-8 mb-4">Using changeset</Heading>

    <ExampleAndCode show_state={{ true }}>
      <template slot="example">
        <Form for={{ @user_changeset }} change="update_user_changeset" submit="save_user_changeset" autocomplete="off">
          <TextInput label="Name" field="name" />
          <TextInput label="Email" field="email" />

          <Select
            label="Gender"
            field={{ :gender }}
            options={{ @gender_options }}
            prompt="Please select gender"
          />

          <Button variant="primary">Save</Button>
          <Button variant="secondary" on_click="go_other_page">Cancel</Button>
        </Form>
      </template>
      <template slot="code">
        <#CodePreview>
          <Form for={{ @user_changeset }} change="update_user_changeset" submit="save_user_changeset" autocomplete="off">
            <TextInput label="Name" field={{ :name }} />
            <TextInput label="Email" field={{ :email }} />

            <Select
              label="Gender"
              field={{ :gender }}
              options={{ @gender_options }}
              prompt="Please select gender"
            />

            <Button variant="primary">Save</Button>
            <Button variant="secondary" on_click="go_other_page">Cancel</Button>
          </Form>
        </#CodePreview>
      </template>
      <template slot="state">
        <pre>@user_changeset = {{ inspect(@user_changeset) }}</pre>
        <pre>@gender_options = {{ inspect(@gender_options) }}</pre>
      </template>
    </ExampleAndCode>


    <h2>Without changeset</h2>

    <p>(not recommended, only for edge cases - 99% cases DO NOT USE THIS)</p>

    <ExampleAndCode show_state={{ true }}>
      <template slot="example">
        <Form for={{ :user_map }} change="update_user_map" submit="save_user_map" autocomplete="off">
          <TextInput label="Name" field={{ :name }} value={{ @user_map.name }} />
          <TextInput label="Email" field={{ :email }} value={{ @user_map.email }} />

          <Select
            label="Gender"
            field={{ :gender }}
            options={{ @gender_options }}
            value={{ @user_map.gender }}
            prompt="Please select gender"
          />

          <Button variant="primary">Save</Button>
          <Button variant="secondary" on_click="go_other_page">Cancel</Button>
        </Form>
      </template>

      <template slot="code">
        <#CodePreview>
          <Form for={{ :user_map }} change="update_user_map" submit="save_user_map" autocomplete="off">
            <TextInput label="Name" field={{ :name }} value={{ @user_map.name }} />
            <TextInput label="Email" field={{ :email }} value={{ @user_map.email }} />

            <Select
              label="Gender"
              field={{ :gender }}
              options={{ @gender_options }}
              value={{ @user_map.gender }}
              prompt="Please select gender"
            />

            <Button variant="primary">Save</Button>
            <Button variant="secondary" on_click="go_other_page">Cancel</Button>
          </Form>
        </#CodePreview>
      </template>

      <template slot="state">
        <pre>@user_map = {{ inspect(@user_map) }}</pre>
        <pre>@gender_options = {{ inspect(@gender_options) }}</pre>
      </template>

    </ExampleAndCode>
    """
  end

  def handle_event(
        "update_user_changeset",
        %{"user" => %{"name" => name, "email" => email, "gender" => gender}},
        socket
      ) do
    user_changeset = User.changeset(%User{}, %{name: name, email: email, gender: gender})
    {:noreply, assign(socket, user_changeset: user_changeset)}
  end

  def handle_event(
        "update_user_map",
        %{"user_map" => %{"name" => name, "email" => email, "gender" => gender}},
        socket
      ) do
    {:noreply, assign(socket, user_map: %{name: name, email: email, gender: gender})}
  end

  def handle_event(
        "go_other_page",
        _,
        socket
      ) do
    {:noreply, push_redirect(socket, to: "/")}
  end
end
