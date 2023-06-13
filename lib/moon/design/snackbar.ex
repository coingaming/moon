defmodule Moon.Design.Snackbar do
  @moduledoc false

  use Moon.StatefulComponent

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

  prop(is_open, :boolean)
  prop(class, :css_class)
  prop(timeout, :integer, default: 5000)
  prop(autoclose, :boolean, default: true)

  prop(testid, :string)

  def handle_event("set_open", _, socket) do
    {:noreply, assign(socket, is_open: true)}
  end

  def handle_event("set_close", _, socket) do
    {:noreply, assign(socket, is_open: false)}
  end

  @animate_class_map %{
    "top-left" => "animate-leftslide",
    "bottom-left" => "animate-leftslide",
    "top-center" => "animate-topslide",
    "bottom-center" => "animate-bottomslide",
    "top-right" => "animate-rightslide",
    "bottom-right" => "animate-rightslide"
  }

  defp animate_class(position), do: Map.get(@animate_class_map, position)

  def render(assigns) do
    ~F"""
    <div
      id={@id}
      data-testid={@testid || @id}
      data-is_open={@is_open && "true"}
      data-autoclose={@autoclose && "true"}
      data-timeout={@timeout}
      data-animate_class={animate_class(@position)}
      :hook="default"
    >
      {#if slot_assigned?(:trigger)}
        <div id={@id <> "-trigger"} data-testid={"#{@testid || @id}-trigger"} :on-click="set_open">
          <#slot {@trigger} />
        </div>
      {/if}
      <div
        id={@id <> "-content"}
        class={merge([
          "z-[9999999] flex fixed w-[calc(100%-32px)] md:w-fit transition hidden",
          "top-4 left-4": @position == "top-left",
          "justify-center top-4 left-4 right-4 md:m-auto": @position == "top-center",
          "justify-end top-4 right-4": @position == "top-right",
          "bottom-4 left-4": @position == "bottom-left",
          "justify-center bottom-4 left-4 right-4 m-auto": @position == "bottom-center",
          "justify-end bottom-4 right-4": @position == "bottom-right"
        ])}
        data-testid={"#{@testid || @id}-content"}
        aria-hidden={(@is_open && "true") || "false"}
      >
        <div class={merge([
          "flex w-fit max-w-xs items-center gap-4 p-4 bg-gohan shadow-moon-lg rounded-moon-s-sm",
          @class
        ])}>
          <#slot {@icon} />
          <#slot {@content} />
          {#if slot_assigned?(:close)}
            <div :on-click="set_close">
              <#slot {@close} />
            </div>
          {/if}
        </div>
      </div>
    </div>
    """
  end
end
