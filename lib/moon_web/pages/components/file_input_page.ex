defmodule MoonWeb.Pages.Components.FileInputPage do
  @moduledoc false

  use MoonWeb, :live_view

  alias Moon.Autolayouts.TopToDown
  alias Moon.Components.CodePreview
  alias Moon.Components.FileInput
  alias Moon.Components.Heading
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

  def mount(params, _session, socket) do
    socket =
      assign(socket,
        theme_name: params["theme_name"] || "sportsbet-dark",
        active_page: __MODULE__,
        uploaded_files: []
      )
      |> allow_upload(:file, accept: ~w(.jpg .jpeg .png .pdf), max_entries: 1)
      |> allow_upload(:error_file, accept: ~w(.jpg .jpeg .png .pdf), max_entries: 1)

    {:ok, socket}
  end

  def handle_params(_params, uri, socket) do
    {:noreply, assign(socket, uri: uri)}
  end

  def render(assigns) do
    ~F"""
    <Page theme_name={@theme_name} active_page={@active_page} breadcrumbs={@breadcrumbs}>
      <TopToDown>
        <Heading size={56} class="mb-4">File Input</Heading>

        <p>
          Enabling users to upload one or more files inside a form.
        </p>

        <ExampleAndCode title="Label" id="file_input_1">
          <:example>
            <FileInput conf={@uploads.file} label="Upload your ID" placeholder="Choose a photo..." />
          </:example>

          <:code>
            <#CodePreview>
        alias Moon.Components.FileInput

        def mount(_params, _session, socket) do
          socket =
            socket
            |> assign(uploaded_files: [])
            |> allow_upload(:file, accept: ~w(.jpg .jpeg .png .pdf), max_entries: 1)

          {:ok, socket}
        end

        <FileInput
          conf={ @uploads.file }
          label="Upload your ID"
          placeholder="Choose a document..."
        />
      </#CodePreview>
          </:code>
        </ExampleAndCode>

        <ExampleAndCode title="Error" id="file_input_2">
          <:example>
            <FileInput conf={@uploads.error_file} error />
          </:example>

          <:code>
            <#CodePreview>
        <FileInput
          conf={ @uploads.file }
          error={ true }
        />
      </#CodePreview>
          </:code>
        </ExampleAndCode>
      </TopToDown>
    </Page>
    """
  end
end
