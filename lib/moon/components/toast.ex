defmodule Moon.Components.Toast do
  use Moon.StatelessComponent
  alias Moon.Assets.Icons.IconErrorCircle
  alias Moon.Assets.Icons.IconSnackbarSuccess

  prop message, :string
  prop variant, :string, values: ~w(warning error info success)
  prop closeable, :boolean, default: false
  prop hidden, :boolean, default: true
  prop on_show, :event

  def render(assigns) do
    ~H"""
    {{ asset_import @socket, "js/tailwind" }}

    <div aria-live="assertive" class="fixed inset-0 flex items-end justify-center px-4 py-6 pointer-events-none sm:p-6 sm:items-start sm:justify-end z-10">
      <!--
        Notification panel, dynamically insert this into the live region when it needs to be displayed

        Entering: "transform ease-out duration-300 transition"
          From: "translate-y-2 opacity-0 sm:translate-y-0 sm:translate-x-2"
          To: "translate-y-0 opacity-100 sm:translate-x-0"
        Leaving: "transition ease-in duration-100"
          From: "opacity-100"
          To: "opacity-0"
      -->
      <div class="w-full max-w-sm overflow-hidden bg-gohan-100 rounded-lg shadow-xl pointer-events-auto">
        <div class="p-4">
          <div class="flex items-center">
            <div :if={{ @variant }} class="flex-shrink-0 mr-3">
              <IconSnackbarSuccess
                class="block w-5 h-5"
                font_size="1.25rem"
              />
            </div>

            <div class="flex justify-between flex-1 w-0">
              <p class="flex-1 w-0 text-sm text-gray-900">
                {{ @message }}
              </p>
            </div>

            <div class="flex flex-shrink-0 ml-4">
              <button class="inline-flex rounded-md hover:text-gray-500 focus:outline-none">
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
end
