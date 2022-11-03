defmodule MoonWeb.Pages.Tutorials.AddDataUsingForm do
  @moduledoc false
  use MoonWeb, :live_view

  alias Moon.Autolayouts.TopToDown
  alias Moon.Components.Button
  alias Moon.Components.FileInput
  alias Moon.Components.Form
  alias Moon.Components.Link
  alias Moon.Components.Select
  alias Moon.Components.Deprecated.TextInput
  alias MoonWeb.Components.ExampleAndCode
  alias MoonWeb.Components.Page
  alias MoonWeb.Pages.Tutorials.AddDataUsingForm.User

  @default_user_map %{
    name: "",
    email: "",
    gender: "",
    document_filename: nil
  }

  data(breadcrumbs, :any,
    default: [
      %{
        to: "#",
        name: "Tutorials"
      },
      %{
        to: "/tutorials/add-data-using-form",
        name: "Add Data Using Form"
      }
    ]
  )

  def mount(_params, _session, socket) do
    user_changeset = User.changeset(%User{}, @default_user_map)

    gender_options = [
      [key: "Female", value: "female"],
      [key: "Male", value: "male"],
      [key: "Other", value: "other"],
      [key: "Invalid choice", value: "invalid"],
      [key: "I identify as God and this is not important", value: "god", disabled: true]
    ]

    socket =
      socket
      |> assign(
        user_changeset: user_changeset,
        gender_options: gender_options,
        uploaded_files: []
      )
      |> allow_upload(:file, accept: ~w(.jpg .jpeg .png .pdf), max_entries: 1)

    {:ok, socket}
  end

  def handle_params(_params, uri, socket) do
    {:noreply, assign(socket, uri: uri)}
  end

  def render(assigns) do
    ~F"""
    <Page {=@theme_name} {=@active_page} {=@breadcrumbs} {=@direction}>
      <TopToDown>
        <p>Moon Forms -> Surface Forms -> Phoenix LiveView forms -> HTML forms</p>

        <p>
          <Link to="https://github.com/coingaming/moon/blob/main/lib/moon_web/pages/components/dropdown_page.ex">Source code of this page</Link>
        </p>

        <ExampleAndCode id="add_data_using_form_1">
          <:example>
            <Form for={@user_changeset} change="update_user" submit="save_user" autocomplete="off">
              <TopToDown>
                <TextInput label="Name" field={:name} />
                <TextInput label="Email" field={:email} />
                <Select label="Gender" field={:gender} options={@gender_options} prompt="Please select gender" />
                <FileInput conf={@uploads.file} label="Upload your ID" placeholder="Choose a document..." />
                <Button variant="fill" type="submit" full_width>Save</Button>
                <Button variant="outline" on_click="clear_form">Cancel</Button>
              </TopToDown>
            </Form>
          </:example>

          <:code>{example_code()}</:code>

          <:state>{example_state(assigns)}</:state>
        </ExampleAndCode>
      </TopToDown>
    </Page>
    """
  end

  def example_code do
    """
    <Form for={@user_changeset} change="update_user" submit="save_user" autocomplete="off">
      <TopToDown>
        <TextInput label="Name" field={:name} />
        <TextInput label="Email" field={:email} />
        <Select label="Gender" field={:gender} options={@gender_options} prompt="Please select gender" />
        <FileInput conf={@uploads.file} label="Upload your ID" placeholder="Choose a document..." />
        <Button variant="fill" type="submit" full_width>Save</Button>
        <Button variant="outline" on_click="clear_form">Cancel</Button>
      </TopToDown>
    </Form>
    """
  end

  def example_state(assigns) do
    ~F"""
    @user_changeset = {inspect(@user_changeset, pretty: true)}
    @gender_options = {inspect(@gender_options, pretty: true)}
    @uploads.file.entries = {inspect(@uploads.file.entries, pretty: true)}
    """
  end

  def handle_event(
        "update_user",
        %{"user" => %{"name" => name, "email" => email, "gender" => gender}},
        socket
      ) do
    file = List.first(socket.assigns.uploads.file.entries) || %Phoenix.LiveView.UploadEntry{}

    user_changeset =
      User.changeset(%User{}, %{
        name: name,
        email: email,
        gender: gender,
        document_filename: file.client_name
      })

    {:noreply, assign(socket, user_changeset: user_changeset)}
  end

  def handle_event("save_user", _, socket) do
    user_changeset = Map.merge(socket.assigns.user_changeset, %{action: :insert})

    {:noreply, assign(socket, user_changeset: user_changeset)}
  end

  def handle_event("clear_form", _, socket) do
    user_changeset = User.changeset(%User{}, @default_user_map)
    {:noreply, assign(socket, user_changeset: user_changeset)}
  end
end
