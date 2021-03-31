defmodule MoonWeb.Pages.Components.FileInputPage do
  use MoonWeb, :live_view
  alias MoonWeb.Components.ExampleAndCode
  alias Moon.Components.CodePreview
  alias Moon.Components.FileInput
  alias Moon.Components.Heading
  alias Moon.Components.Link
  alias Moon.Components.Stack

  def mount(params, _session, socket) do
    socket =
      assign(socket,
        theme_name: params["theme_name"] || "sportsbet-dark",
        active_page: __MODULE__,
      )
      |> allow_upload(:file, accept: ~w(.jpg .jpeg .png .pdf), max_entries: 1)

    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <Stack>
      <Heading size=32>File Input</Heading>

      <p>
        Enabling users to upload one or more files inside a form.
      </p>

      <Heading size=24 class="mt-4" is_regular>Label</Heading>

      <ExampleAndCode class="mt-3">
        <template slot="example">
          <FileInput conf={{ @uploads.file }} label="Upload your ID" />
        </template>
      </ExampleAndCode>
    </Stack>
    """
  end
end
