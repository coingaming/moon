defmodule Moon.Components.FileInput do
  use Moon.StatelessComponent
  alias Moon.Assets.Icons.IconUpload

  prop label, :string
  prop placeholder, :string, default: "Choose file..."
  prop conf, :any
  prop error, :boolean, default: false

  def render(assigns) do
    ~H"""
    <div>
      <span :if={{ @label }} class="block mb-2">{{ @label }}</span>
      <label
        class={{
          "flex justify-between items-center px-4 py-2 transition duration-200 border rounded-lg cursor-pointer text-trunks-100 border-color hover:border-goku-40 leading-normal",
          "border-chi_chi-100": @error,
          "border-beerus-100": !@error
        }}
      >
        <span>{{ @placeholder }}</span>
        <span class="flex items-center m-1">
          <IconUpload />
        </span>
        {{ live_file_input @conf, class: "opacity-0 absolute top-0 right-0 block" }}
      </label>
    </div>
    """
  end
end
