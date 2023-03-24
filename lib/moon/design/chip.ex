defmodule Moon.Design.Chip do
  @moduledoc false

  use Moon.StatelessComponent

  slot(default)
  slot(left_icon)
  slot(right_icon)
  slot(icon_only)

  prop(is_active, :boolean, default: false)
  prop(is_stroke, :boolean, default: false)
  prop(size, :string, values: ["sm", "md"], default: "md")
  prop(variant, :string, values: ["default", "ghost"], default: "default")
  prop(on_click, :event)
  prop(class, :css_class)

  prop(testid, :string)
  prop(id, :string)

  def render(assigns) do
    ~F"""
    <button
      {=@id}
      class={merge([
        [
          "z-0 overflow-hidden flex flex-row items-center text-moon-14 relative rounded-moon-i-sm cursor-pointer transition duration-200 space-between bg-gohan text-bulma hover:bg-jiren hover:text-piccolo",
          "h-8 gap-1 py-1 px-2": @size == "sm",
          "h-10 gap-2 py-2 px-3": @size == "md",
          "bg-none": @variant in ["ghost"],
          "bg-jiren text-piccolo": @is_active,
          "hover:shadow-interactive": @is_stroke,
          "shadow-interactive": @is_active && @is_stroke
        ],
        @class
      ])}
      :on-click={@on_click}
      data-testid={@testid}
    >
      <#slot {@left_icon} />
      <#slot />
      <#slot {@right_icon} />
      <#slot {@icon_only} />
    </button>
    """
  end
end
