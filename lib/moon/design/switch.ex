defmodule Moon.Design.Switch do
  @moduledoc false

  use Moon.StatefulComponent

  prop(is_switched, :boolean, default: false)
  prop(disabled, :boolean, default: false)
  prop(size, :string, values: ["2xs", "xs", "sm"], default: "sm")
  prop(on_bg_color, :css_class, default: "bg-piccolo")
  prop(off_bg_color, :css_class, default: "bg-beerus")
  prop(class, :css_class)
  prop(switcher_class, :css_class)
  prop(test_id, :string)
  prop(on_change, :event)

  slot(off_icon)
  slot(on_icon)

  @spec render(map) :: Phoenix.LiveView.Rendered.t()
  def render(assigns) do
    ~F"""
    <button
      type="button"
      aria-pressed="false"
      disabled={@disabled}
      class={merge([
        [
          "block rounded-full transition",
          (@is_switched == false && @on_bg_color) || @off_bg_color,
          "w-7 h-4 p-0.5": @size == "2xs",
          "w-11 h-6 p-1": @size == "xs",
          "w-[3.75rem] h-8 p-1": @size == "sm",
          "cursor-pointer": !@disabled,
          "opacity-30 cursor-not-allowed select-none": @disabled
        ],
        @class
      ])}
      data-testid={@test_id}
      :on-click={@on_change || "toggle_switch"}
    >
      <span class="block relative h-full w-full">
        {#if slot_assigned?(:on_icon)}
          <span
            class={merge([
              "z-1 absolute ltr:left-0 rtl:right-0 top-1/2 -translate-y-1/2 transition-opacity flex text-goten opacity-100",
              get_icon_size(@size),
              "opacity-0": @is_switched == true
            ])}
            aria-hidden="true"
          >
            <#slot {@on_icon} />
          </span>
        {/if}
        {#if slot_assigned?(:off_icon)}
          <span
            class={merge([
              "z-1 absolute ltr:right-0 rtl:left-0 top-1/2 -translate-y-1/2 transition-opacity flex text-bulma opacity-0",
              get_icon_size(@size),
              "opacity-100": @is_switched == true
            ])}
            aria-hidden="true"
          >
            <#slot {@off_icon} />
          </span>
        {/if}
        <span
          aria-hidden="true"
          class={merge([
            [
              "z-5 absolute top-1/2 -translate-y-1/2 translate-x-0 shadow-moon-sm pointer-events-none rounded-full",
              "bg-goten transition-all",
              "w-3 h-3 ltr:left-[calc(100%-12px)] rtl:right-[calc(100%-12px)]": @size == "2xs",
              "w-4 h-4 ltr:left-[calc(100%-16px)] rtl:right-[calc(100%-16px)]": @size == "xs",
              "w-6 h-6 ltr:left-[calc(100%-24px)] rtl:right-[calc(100%-24px)]": @size == "sm",
              "ltr:left-0 rtl:right-0": @is_switched == true
            ],
            @switcher_class
          ])}
        />
      </span>
    </button>
    """
  end

  def get_icon_size(size) do
    case size do
      "2xs" -> "text-moon-12 "
      "xs" -> "text-moon-16 "
      "sm" -> "text-moon-24 "
    end
  end

  def handle_event("toggle_switch", _params, socket) do
    {:noreply, assign(socket, is_switched: !socket.assigns.is_switched)}
  end
end
