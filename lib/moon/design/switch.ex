defmodule Moon.Design.Switch do
  @moduledoc false

  use Moon.StatelessComponent

  prop(is_switched, :boolean, default: false)
  prop(disabled, :boolean, default: false)
  prop(size, :string, values: ["2xs", "xs", "sm"], default: "sm")
  prop(on_bg_color, :css_class, default: "bg-piccolo")
  prop(off_bg_color, :css_class, default: "bg-beerus")
  prop(class, :css_class)
  prop(on_click, :event)
  prop(test_id, :string)

  slot(on_icon)
  slot(off_icon)

  def render(assigns) do
    ~F"""
    <button
      type="button"
      aria-pressed="false"
      class={merge([
        [
          "block cursor-pointer rounded-full transition",
          @on_bg_color,
          "w-7 h-4 p-0.5": @size == "2xs",
          "w-11 h-6 p-1": @size == "xs",
          "w-[3.75rem] h-8 p-1": @size == "sm",
          "opacity-30 cursor-not-allowed select-none": @disabled,
          "bg-beerus": @is_switched == true
          # replace with @off_bg_color
        ],
        @class
      ])}
      data-testid={@test_id}
      on_click={@on_click}
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
            "z-5 absolute top-1/2 -translate-y-1/2 translate-x-0 shadow-moon-sm pointer-events-none rounded-full",
            "bg-goten transition-all",
            "w-3 h-3 ltr:left-[calc(100%-12px)] rtl:right-[calc(100%-12px)]": @size == "2xs",
            "w-4 h-4 ltr:left-[calc(100%-16px)] rtl:right-[calc(100%-16px)]": @size == "xs",
            "w-6 h-6 ltr:left-[calc(100%-24px)] rtl:right-[calc(100%-24px)]": @size == "sm",
            "ltr:left-0 rtl:right-0": @is_switched == true
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
end
