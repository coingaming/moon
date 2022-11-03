defmodule Moon.Components.Toast do
  @moduledoc false

  use Moon.StatelessComponent

  alias Moon.Assets.Icons.IconBannerInfo
  alias Moon.Assets.Icons.IconError
  alias Moon.Assets.Icons.IconErrorCircle
  alias Moon.Assets.Icons.IconSnackbarSuccess
  alias Moon.Assets.Icons.IconWarning
  alias Moon.Components.Link

  prop(id, :string, required: true)
  prop(testid, :string)
  prop(message, :string, required: true)
  prop(variant, :string, values: ~w(error warning info success))
  prop(closeable, :boolean, default: true)
  prop(link_text, :string)
  prop(link_href, :string)
  prop(on_close, :event)
  prop(background_color_class, :css_class, default: "bg-gohan-100")

  defmodule Message do
    @moduledoc false

    defstruct id: nil,
              testid: nil,
              message: nil,
              variant: nil,
              closeable: true,
              link_text: nil,
              link_href: nil
  end

  def render(assigns) do
    ~F"""
    <div
      {=@id}
      class={
        "inline-flex items-center rounded-lg shadow-xl pointer-events-auto p-4 mb-4",
        @background_color_class
      }
    >
      <div :if={@variant} class="shrink-0 mr-3">
        <IconError :if={@variant == "error"} class="block w-5 h-5" font_size="1.25rem" />
        <IconWarning :if={@variant == "warning"} class="block w-5 h-5" font_size="1.25rem" />
        <IconBannerInfo :if={@variant == "info"} class="block w-5 h-5" font_size="1.25rem" />
        <IconSnackbarSuccess :if={@variant == "success"} class="block w-5 h-5" font_size="1.25rem" />
      </div>

      <div class="flex justify-between flex-1 text-moon-14">
        <p class="flex-1 text-gray-900">
          {@message}
        </p>
        <Link :if={@link_href && @link_text} class="ml-4 shrink-0 font-semibold" to={@link_href}>
          {@link_text}
        </Link>
      </div>

      <div :if={@closeable} class="flex shrink-0 ml-4">
        <button
          class="inline-flex rounded-md hover:text-gray-500 focus:outline-none"
          :on-click={@on_close}
          phx-value-id={@id}
          data-testid={"#{@testid}-close-button"}
        >
          <span class="sr-only">Close</span>
          <IconErrorCircle class="w-5 h-5" font_size="1.25rem" color="trunks-100" />
        </button>
      </div>
    </div>
    """
  end
end
