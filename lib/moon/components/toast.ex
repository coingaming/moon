defmodule Moon.Components.Toast do
  use Moon.StatefulComponent
  alias Moon.Assets.Icons.IconBannerInfo
  alias Moon.Assets.Icons.IconError
  alias Moon.Assets.Icons.IconErrorCircle
  alias Moon.Assets.Icons.IconSnackbarSuccess
  alias Moon.Assets.Icons.IconWarning

  @default_duration 4000

  prop message, :string, required: true
  prop variant, :string, values: ~w(error warning info success)
  prop closeable, :boolean, default: true

  data show, :boolean, default: false

  def render(assigns) do
    ~H"""
    {{ asset_import @socket, "js/tailwind" }}

    <div aria-live="assertive" class="fixed inset-0 z-10 flex items-end justify-center px-4 py-6 pointer-events-none sm:p-6 sm:items-start sm:justify-end">
      <div
        class={{
          "transform ease-in-out duration-300 transition w-full max-w-sm overflow-hidden bg-gohan-100 rounded-lg shadow-xl pointer-events-auto",
          "opacity-100": @show,
          "opacity-0 hidden": !@show
        }}
      >
        <div class="p-4">
          <div class="flex items-center">
            <div :if={{ @variant }} class="flex-shrink-0 mr-3">
              <IconError
                :if={{ @variant == "error" }}
                class="block w-5 h-5"
                font_size="1.25rem"
              />

              <IconWarning
                :if={{ @variant == "warning" }}
                class="block w-5 h-5"
                font_size="1.25rem"
              />

              <IconBannerInfo
                :if={{ @variant == "info" }}
                class="block w-5 h-5"
                font_size="1.25rem"
              />

              <IconSnackbarSuccess
                :if={{ @variant == "success" }}
                class="block w-5 h-5"
                font_size="1.25rem"
              />
            </div>

            <div class="flex justify-between flex-1 w-0">
              <p class="flex-1 w-0 text-sm text-gray-900">
                {{ @message }}
              </p>
            </div>

            <div :if={{ @closeable }} class="flex flex-shrink-0 ml-4">
              <button
                class="inline-flex rounded-md hover:text-gray-500 focus:outline-none"
                :on-click="hide"
              >
                <span class="sr-only">Close</span>
                <IconErrorCircle
                  class="w-5 h-5"
                  font_size="1.25rem"
                  color="trunks-100"
                />
              </button>
            </div>
          </div>
        </div>
      </div>
    </div>
    """
  end

  def show(id, autohide \\ true, duration \\ @default_duration) do
    send_update(__MODULE__, id: id, show: true)

    if autohide, do: send_update_after(__MODULE__, [id: id, show: false], duration)
  end

  def handle_event("hide", _, socket) do
    {:noreply, assign(socket, show: false)}
  end
end
