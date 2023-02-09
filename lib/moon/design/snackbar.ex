defmodule Moon.Design.Snackbar do
  @moduledoc false

  use Moon.StatelessComponent

  alias Phoenix.LiveView.JS

  prop(position, :string,
    values: [
      "top-left",
      "top-center",
      "top-right",
      "bottom-left",
      "bottom-center",
      "bottom-right"
    ],
    default: "top-right"
  )

  slot(trigger)
  slot(content)
  slot(icon)
  slot(close)

  prop(is_open, :boolean, default: false)
  prop(class, :css_class)
  prop(id, :string)

  prop(testid, :string)

  def render(assigns) do
    ~F"""
    <div>
      <div
        role="button"
        :on-click={JS.dispatch("moon:show-snackbar", detail: %{snackbar_id: "#{@id}", position: "#{@position}"})}
      >
        <#slot {@trigger} />
      </div>
      <div
        class={
          "z-[9999999] flex fixed w-[calc(100%-32px)] md:w-fit transition hidden",
          "moon-snackbar",
          "top-4 animate-leftslide left-4": @position == "top-left",
          "justify-center top-4 left-4 right-4 md:m-auto animate-topslide": @position == "top-center",
          "justify-end top-4 animate-rightslide right-4": @position == "top-right",
          "bottom-4 animate-leftslide left-4": @position == "bottom-left",
          "justify-center bottom-4 left-4 right-4 m-auto animate-bottomslide":
            @position == "bottom-center",
          "justify-end bottom-4 animate-rightslide right-4": @position == "bottom-right"
        }
        id={@id}
        data-testid={"#{@testid}-snackbar"}
        aria-hidden={(@is_open && "true") || "false"}
      >
        <div class={merge([
          "flex w-fit max-w-xs items-center gap-4 p-4 bg-gohan shadow-moon-lg rounded-moon-s-sm",
          @class
        ])}>
          <#slot {@icon} />
          <#slot {@content} />
          {#if slot_assigned?(:close)}
            <div :on-click={JS.dispatch("moon:close-snackbar", detail: %{snackbar_id: "#{@id}", position: "#{@position}"})}>
              <#slot {@close} />
            </div>
          {/if}
        </div>
      </div>
    </div>
    """
  end
end
