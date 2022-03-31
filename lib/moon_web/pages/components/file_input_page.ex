defmodule MoonWeb.Pages.Components.FileInputPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias Moon.Autolayouts.TopToDown
  alias Moon.Components.FileInput
  alias Moon.Components.Form
  alias Moon.Components.Heading
  alias Moon.Components.Link
  alias MoonWeb.Components.ExampleAndCode
  alias MoonWeb.Components.Page

  data breadcrumbs, :any,
    default: [
      %{
        to: "#",
        name: "Components"
      },
      %{
        to: "/components/file-input",
        name: "File Input"
      }
    ]

  def render(assigns) do
    ~F"""
    <Page theme_name={@theme_name} active_page={@active_page} breadcrumbs={@breadcrumbs}>
      <TopToDown>
        <Heading size={56} class="mb-4">File Input</Heading>

        <p>
          Uploads: <Link to="https://hexdocs.pm/phoenix_live_view/uploads.html">https://hexdocs.pm/phoenix_live_view/uploads.html</Link><br />
          External uploads: <Link to="https://hexdocs.pm/phoenix_live_view/uploads-external.html">https://hexdocs.pm/phoenix_live_view/uploads-external.html</Link>
        </p>

        <ExampleAndCode title="Local upload" id="file_input_1">
          <:example>
            <Form id="upload-form-1" for={:example_form} change="upload_changed" submit="upload_submitted">
              <FileInput conf={@uploads.some_picture_file} label="Upload your ID" placeholder="Choose a photo..." />
              <section phx-drop-target={@uploads.some_picture_file.ref}>
                <h1>Drag and drop area</h1>
                <div>
                  {#for entry <- @uploads.some_picture_file.entries}
                    {live_img_preview entry, style: "max-width: 200px; max-height: 200px;"}
                    <progress value={entry.progress} max="100">{entry.progress}</progress>
                    <button phx-click="cancel-upload" phx-value-ref={entry.ref} aria-label="cancel">&times;</button>
                    {#for err <- upload_errors(@uploads.some_picture_file, entry)}
                      <p class="alert alert-danger">{inspect(err)}</p>
                    {/for}
                  {/for}
                </div>
                {#for err <- upload_errors(@uploads.some_picture_file)}
                  <p class="alert alert-danger">{inspect(err)}</p>
                {/for}
              </section>
            </Form>
          </:example>
          <:code>{get_example_1_code()}</:code>
          <:state>{get_example_1_state(assigns)}</:state>
        </ExampleAndCode>

        <ExampleAndCode title="Upload to S3" id="file_input_2">
          <:example>
            <Form id="upload-form-2" for={:example_form_for_s3} change="upload_changed" submit="upload_submitted">
              <FileInput conf={@uploads.some_picture_file_for_s3} label="Upload your ID" placeholder="Choose a photo..." />
              <section phx-drop-target={@uploads.some_picture_file_for_s3.ref}>
                <h1>Drag and drop area</h1>
                <div>
                  {#for entry <- @uploads.some_picture_file_for_s3.entries}
                    {live_img_preview entry, style: "max-width: 200px; max-height: 200px;"}
                    <progress value={entry.progress} max="100">{entry.progress}</progress>
                    <button phx-click="cancel-upload" phx-value-ref={entry.ref} aria-label="cancel">&times;</button>
                    {#for err <- upload_errors(@uploads.some_picture_file_for_s3, entry)}
                      <p class="alert alert-danger">{inspect(err)}</p>
                    {/for}
                  {/for}
                </div>
                {#for err <- upload_errors(@uploads.some_picture_file_for_s3)}
                  <p class="alert alert-danger">{inspect(err)}</p>
                {/for}
              </section>
            </Form>
          </:example>
          <:code>{get_example_1_code()}</:code>
          <:state>{get_example_1_state(assigns)}</:state>
        </ExampleAndCode>
      </TopToDown>
    </Page>
    """
  end

  def mount(params, _session, socket) do
    socket =
      assign(socket,
        theme_name: params["theme_name"] || "sportsbet-dark",
        active_page: __MODULE__,
        uploaded_files: []
      )
      |> allow_upload(:some_picture_file, accept: ~w(.jpg .jpeg .png .pdf), max_entries: 1)
      |> allow_upload(:some_picture_file_for_s3, accept: ~w(.jpg .jpeg .png .pdf), max_entries: 1)

    {:ok, socket}
  end

  def handle_params(_params, uri, socket) do
    {:noreply, assign(socket, uri: uri)}
  end

  def handle_event("upload_changed", _params, socket) do
    {:noreply, socket}
  end

  def get_example_1_state(assigns) do
    """
    @uploaded_files = #{inspect(assigns.uploaded_files)}
    @uploads.some_picture_file = #{inspect(assigns.uploads.some_picture_file)}
    """
  end


  def get_example_1_code() do
    """
    <Form id="upload-form" for={:example_form} change="upload_changed" submit="upload_submitted">
      <FileInput conf={@uploads.some_picture_file} label="Upload your ID" placeholder="Choose a photo..." />
      <section phx-drop-target={@uploads.some_picture_file.ref}>
        <h1>Drag and drop area</h1>
        <div>
          {#for entry <- @uploads.some_picture_file.entries}
            {live_img_preview entry, style: "max-width: 200px; max-height: 200px;"}
            <progress value={entry.progress} max="100">{entry.progress}</progress>
            <button phx-click="cancel-upload" phx-value-ref={entry.ref} aria-label="cancel">&times;</button>
            {#for err <- upload_errors(@uploads.some_picture_file, entry)}
              <p class="alert alert-danger">{inspect(err)}</p>
            {/for}
          {/for}
        </div>
        {#for err <- upload_errors(@uploads.some_picture_file)}
          <p class="alert alert-danger">{inspect(err)}</p>
        {/for}
      </section>
    </Form>
    """
  end
end
