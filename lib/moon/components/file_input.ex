defmodule Moon.Components.FileInput do
  use Moon.StatelessComponent
  alias Moon.Assets.Icons.IconUpload

  prop label, :string
  prop placeholder, :string, default: "Choose file..."
  prop conf, :any
  prop error, :boolean, default: false

  def render(assigns) do
    ~F"""
    {asset_import(@socket, "js/tailwind")}

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
    </div>
    """
  end
end
