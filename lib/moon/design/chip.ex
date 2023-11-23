defmodule Moon.Design.Chip do
  @moduledoc false

  use Moon.StatelessComponent

  alias Moon.Design.Chip.Utils

  @doc "Id attribute for DOM element"
  prop(id, :string)
  @doc "Data-testid attribute for DOM element"
  prop(testid, :string)
  @doc "Active state"
  prop(is_active, :boolean, default: false)
  @doc "Shows stroke on hover/active"
  prop(is_stroke, :boolean, default: false)
  @doc "Size of chip"
  prop(size, :string, values: ["sm", "md"], default: "md")
  @doc "Visual/Logical variant of chip"
  prop(variant, :string, values: ["default", "ghost"], default: "default")
  @doc "Event to be fired on click"
  prop(on_click, :event)
  @doc "Additional Tailwind classes"
  prop(class, :css_class)
  @doc "Aria label attribute for DOM element"
  prop(aria_label, :string)
  @doc "Disabled chip"
  prop(disabled, :boolean)
  @doc "Default slot"
  slot(default)
  @doc "Left icon slot"
  slot(left_icon)
  @doc "Right icon slot"
  slot(right_icon)
  @doc "Icon slot without text"
  slot(icon_only)

  def render(assigns) do
    ~F"""
    <button
      {=@id}
      disabled={@disabled}
      class={merge([
        [
          "z-0 overflow-hidden flex flex-row items-center text-moon-14",
          "relative rounded-moon-i-sm cursor-pointer transition duration-200 bg-goku text-bulma hover:bg-jiren hover:text-piccolo",
          "h-8 gap-1 p-1": @size == "sm",
          "h-10 gap-2 p-2": @size == "md",
          "#{Utils.get_right_icon_paddings(@size)}":
            slot_assigned?(:right_icon) && !slot_assigned?(:left_icon),
          "#{Utils.get_left_icon_paddings(@size)}":
            slot_assigned?(:left_icon) && !slot_assigned?(:right_icon),
          "#{Utils.get_no_icon_paddings(@size)}":
            !slot_assigned?(:right_icon) && !slot_assigned?(:left_icon) && !slot_assigned?(:icon_only),
          "bg-transparent": @variant in ["ghost"],
          "bg-jiren text-piccolo": @is_active,
          "hover:shadow-interactive": @is_stroke,
          "shadow-interactive": @is_active && @is_stroke,
          "opacity-60 cursor-not-allowed hover:shadow-none hover:bg-goku hover:text-bulma": @disabled,
          "hover:bg-transparent": @variant in ["ghost"] && @disabled
        ],
        @class
      ])}
      :on-click={@on_click}
      data-testid={@testid}
      aria-label={@aria_label}
    >
      <#slot {@left_icon} />
      <#slot />
      <#slot {@right_icon} />
      <#slot {@icon_only} />
    </button>
    """
  end
end
