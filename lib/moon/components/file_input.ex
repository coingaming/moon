defmodule Moon.Components.FileInput.ListOfFiles do
  @moduledoc false

  use Moon.StatelessComponent
  alias Moon.Components.ProgressLinear

  prop conf, :any
  prop cancel_upload, :event

  def render(assigns) do
    ~F"""
    <div>
      {#for entry <- @conf.entries}
        <div class="flex gap-2 bg-goku-100 p-2 rounded align-middle">
          <div class="overflow-hidden" style="max-width: 50px">{live_img_preview(entry, style: "min-height: 100%; min-height: 100%;", class: "rounded")}</div>
          <div class="w-full">{entry.client_name} ({get_size(entry.client_size)} KB)</div>
          <div style="width: 300px"><ProgressLinear value={entry.progress} /></div>
          <div><div :on-click={@cancel_upload} :values={ref: entry.ref} aria-label="cancel"><Moon.Icons.ControlsClose /></div></div>
        </div>
        <div>
          {#for err <- upload_errors(@conf, entry)}
            <p class="alert alert-danger">{inspect(err)}</p>
          {/for}
        </div>
      {/for}
    </div>
    """
  end

  def get_size(bytes) do
    trunc(bytes / 1024)
  end
end

defmodule Moon.Components.FileInput do
  @moduledoc false

  use Moon.StatelessComponent
  alias Moon.Assets.Icons.IconUpload
  alias Moon.Components.Button
  alias __MODULE__.ListOfFiles

  prop label, :string
  prop placeholder, :string, default: "Choose file..."
  prop conf, :any
  prop error, :boolean, default: false
  prop cancel_upload, :event
  slot default

  def render(assigns) do
    ~F"""
    <div class="relative">
      {live_file_input(@conf, class: "opacity-0 absolute top-0 right-0 h-full w-full")}
      <span :if={@label} class="block mb-2">{@label}</span>
      {#if slot_assigned?(:default)}
        <#slot name="default" />
      {/if}
      {#if !slot_assigned?(:default)}
        <Button>
          {@placeholder}
          <:right_icon_slot><IconUpload /></:right_icon_slot>
        </Button>
        <ListOfFiles {=@conf} {=@cancel_upload} />
      {/if}
    </div>
    """
  end
end
