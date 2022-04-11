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
  alias __MODULE__.ListOfFiles

  prop label, :string
  prop placeholder, :string, default: "Choose file..."
  prop conf, :any
  prop error, :boolean, default: false
  prop cancel_upload, :event

  def render(assigns) do
    ~F"""
    <div>
      <span :if={@label} class="block mb-2">{@label}</span>
      <label class={
        "flex justify-between items-center relative px-4 py-2 transition duration-200 border rounded cursor-pointer text-trunks-100 hover:border-goku-40 leading-normal overflow-hidden",
        "border-chi-chi-100": @error,
        "border-beerus-100": !@error
      }>
        {live_file_input(@conf, class: "opacity-0 absolute top-0 right-0 h-0.5 w-0.5")}
        <span class="z-10 cursor-pointer">{@placeholder}</span>
        <span class="flex items-center m-1">
          <IconUpload />
        </span>
      </label>
      <ListOfFiles {=@conf} {=@cancel_upload} />
    </div>
    """
  end
end
