defmodule MoonWeb.Pages.Components.FileInputPage do
  use MoonWeb, :live_view
  alias MoonWeb.Components.ExampleAndCode
  alias Moon.Components.CodePreview
  alias Moon.Components.FileInput
  alias Moon.Components.Heading
  alias Moon.Components.Stack

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

  def render(assigns) do
    ~F"""
    <Stack>
      <Heading size={32}>File Input</Heading>

      <p>
        Enabling users to upload one or more files inside a form.
      </p>

      <Heading size={24} class="mt-4" is_regular>Label</Heading>

      <ExampleAndCode>
        <#template slot="example">
          <FileInput
            conf={@uploads.file}
            label="Upload your ID"
            placeholder="Choose a photo..."
          />
        </#template>

    <#template slot="code">
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
          conf={{ @uploads.file }}
          label="Upload your ID"
          placeholder="Choose a document..."
        />
      </#CodePreview>
    </#template>
      </ExampleAndCode>

      <Heading size={24} class="mt-4" is_regular>Error</Heading>

      <ExampleAndCode>
        <#template slot="example">
          <FileInput
            conf={@uploads.error_file}
            error={true}
          />
        </#template>

    <#template slot="code">
      <#CodePreview>
        <FileInput
          conf={{ @uploads.file }}
          error={{ true }}
        />
      </#CodePreview>
    </#template>
      </ExampleAndCode>
    </Stack>
    """
  end
end
