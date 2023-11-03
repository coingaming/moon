defmodule Moon.Design.Tag do
  @moduledoc false

  use Moon.StatelessComponent

  alias Moon.Design.Tag.Utils

  prop(size, :string, default: "xs", values: ~w(2xs xs))
  prop(class, :css_class)
  prop(is_uppercase, :boolean, default: true)

  slot(default)
  slot(left_icon)
  slot(right_icon)

  prop(testid, :string)
  prop(id, :string)

  def render(assigns) do
    ~F"""
    <div
      {=@id}
      class={merge([
        [
          "flex items-center rounded-moon-i-xs select-none text-goku font-medium bg-bulma tracking-[0.5px]",
          Utils.get_icon_size(@size),
          "gap-1": slot_assigned?(:right_icon) || slot_assigned?(:left_icon),
          "text-moon-9 h-4 py-0 px-2": @size == "2xs",
          "text-moon-10 h-6 py-1 px-2": @size == "xs",
          "text-moon-10 tracking-0 font-regular": @size == "2xs" && !@is_uppercase,
          "text-moon-12 tracking-0 font-regular": @size == "xs" && !@is_uppercase,
          "#{Utils.get_right_icon_paddings(@size)}":
            slot_assigned?(:right_icon) && !slot_assigned?(:left_icon),
          "#{Utils.get_left_icon_paddings(@size)}":
            slot_assigned?(:left_icon) && !slot_assigned?(:right_icon),
          "#{Utils.get_both_icon_paddings(@size)}":
            slot_assigned?(:right_icon) && slot_assigned?(:left_icon),
          uppercase: @is_uppercase
        ],
        @class
      ])}
      data-testid={@testid}
    >
      <span class={Utils.get_icon_size(@size), "flex items-center"} :if={slot_assigned?(:left_icon)}><#slot {@left_icon} /></span>
      <#slot />
      <span class={Utils.get_icon_size(@size), "flex items-center"} :if={slot_assigned?(:right_icon)}><#slot {@right_icon} /></span>
    </div>
    """
  end
end
