defmodule MoonWeb.Pages.Components.FileInputPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias Moon.Autolayouts.TopToDown
  alias Moon.Components.Button
  alias Moon.Components.FileInput
  alias Moon.Components.Form
  alias Moon.Components.Heading
  alias Moon.Components.Link
  alias MoonWeb.Components.ExampleAndCode
  alias MoonWeb.Components.Page

  alias __MODULE__.SimpleS3Upload

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
          Uploads: <Link to="https://hexdocs.pm/phoenix_live_view/uploads.html">https://hexdocs.pm/phoenix_live_view/uploads.html</Link><br>
          External uploads: <Link to="https://hexdocs.pm/phoenix_live_view/uploads-external.html">https://hexdocs.pm/phoenix_live_view/uploads-external.html</Link>
        </p>

        <ExampleAndCode title="Local upload" id="file_input_1">
          <:example>
            <Form id="upload-form-1" for={:example_form} change="upload_changed" submit="upload_submitted">
              <TopToDown>
                <FileInput
                  conf={@uploads.some_picture_file}
                  label="Upload your ID"
                  placeholder="Choose a photo..."
                />
                <section
                  phx-drop-target={@uploads.some_picture_file.ref}
                  class={"p-4", Moon.Components.FieldBorder.get_default_class()}
                >
                  <h1>Drag and drop area</h1>
                  <div>
                    {#for entry <- @uploads.some_picture_file.entries}
                      {live_img_preview(entry, style: "max-width: 200px; max-height: 200px;")}
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
                <Button type="submit" variant="primary">Upload</Button>
              </TopToDown>
            </Form>
          </:example>
          <:code>{get_example_1_code()}</:code>
          <:state>{get_example_1_state(assigns)}</:state>
        </ExampleAndCode>

        <ExampleAndCode title="Upload directly from browser to S3" id="file_input_2">
          <:example>
            <Form
              id="upload-form-2"
              for={:example_form_for_s3}
              change="upload_s3_changed"
              submit="upload_s3_submitted"
            >
              <TopToDown>
                <FileInput
                  conf={@uploads.some_picture_file_for_s3}
                  label="Upload your ID"
                  placeholder="Choose a photo..."
                />
                <section
                  phx-drop-target={@uploads.some_picture_file_for_s3.ref}
                  class={"p-4", Moon.Components.FieldBorder.get_default_class()}
                >
                  <h1>Drag and drop area</h1>
                  <div>
                    {#for entry <- @uploads.some_picture_file_for_s3.entries}
                      {live_img_preview(entry, style: "max-width: 200px; max-height: 200px;")}
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
                <Button type="submit" variant="primary">Upload</Button>
              </TopToDown>
            </Form>
          </:example>
          <:code>{get_example_2_code()}</:code>
          <:state>{get_example_2_state(assigns)}</:state>
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
      |> allow_upload(:some_picture_file,
        accept: ~w(.jpg .jpeg .png .pdf),
        max_file_size: 1024 * 1024,
        max_entries: 1
      )
      |> allow_upload(:some_picture_file_for_s3,
        accept: ~w(.jpg .jpeg .png .pdf),
        max_file_size: 1024 * 1024,
        max_entries: 1,
        external: &presign_upload/2
      )

    {:ok, socket}
  end

  def handle_params(_params, uri, socket) do
    {:noreply, assign(socket, uri: uri)}
  end

  def handle_event("upload_changed", _params, socket) do
    {:noreply, socket}
  end

  def handle_event("upload_s3_changed", _params, socket) do
    {:noreply, socket}
  end

  def handle_event("upload_s3_submitted", _params, socket) do
    {:noreply, socket}
  end

  def presign_upload(entry, socket) do
    uploads = socket.assigns.uploads
    s3_config = Application.get_env(:moon, :s3)
    bucket = s3_config[:bucket]
    key = "uploaded-file"

    config = %{
      region: s3_config[:region],
      access_key_id: s3_config[:access_key_id],
      secret_access_key: s3_config[:secret_access_key]
    }

    {:ok, fields} =
      SimpleS3Upload.sign_form_upload(config, bucket,
        key: key,
        content_type: entry.client_type,
        max_file_size: uploads.some_picture_file_for_s3.max_file_size,
        expires_in: :timer.hours(1)
      )

    meta = %{
      uploader: "S3",
      key: key,
      url: "https://#{bucket}.s3.#{config.region}.amazonaws.com/",
      fields: fields
    }

    {:ok, meta, socket}
  end

  def get_example_1_state(assigns) do
    """
    @uploaded_files = #{inspect(assigns.uploaded_files)}
    @uploads.some_picture_file = #{inspect(assigns.uploads.some_picture_file)}
    """
  end

  def get_example_2_state(assigns) do
    """
    @uploaded_files = #{inspect(assigns.uploaded_files)}
    @uploads.some_picture_file = #{inspect(assigns.uploads.some_picture_file)}
    """
  end

  def get_example_1_code() do
    """
    <Form id="upload-form-1" for={:example_form} change="upload_changed" submit="upload_submitted">
      <TopToDown>
        <FileInput conf={@uploads.some_picture_file} label="Upload your ID" placeholder="Choose a photo..." />
        <section phx-drop-target={@uploads.some_picture_file.ref} class={"p-4", Moon.Components.FieldBorder.get_default_class()}>
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
        <Button type="submit" variant="primary">Upload</Button>
      </TopToDown>
    </Form>
    """
  end

  def get_example_2_code() do
    """
    <Form id="upload-form-2" for={:example_form_for_s3} change="upload_s3_changed" submit="upload_s3_submitted">
      <TopToDown>
        <FileInput conf={@uploads.some_picture_file_for_s3} label="Upload your ID" placeholder="Choose a photo..." />
        <section phx-drop-target={@uploads.some_picture_file_for_s3.ref} class={"p-4", Moon.Components.FieldBorder.get_default_class()}>
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
        <Button type="submit" variant="primary">Upload</Button>
      </TopToDown>
    </Form>
    """
  end
end
