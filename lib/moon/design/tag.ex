defmodule Moon.Design.Tag do
  @moduledoc false

  use Moon.StatelessComponent

  alias Moon.Design.Tag.Utils

  @doc "Size of tag"
  prop(size, :string, default: "xs", values: ~w(2xs xs sm))
  @doc "Tailwind classes for customization"
  prop(class, :css_class)
  @doc "Letter case"
  prop(is_uppercase, :boolean, default: true)
  @doc "Tag content"
  slot(default)
  @doc "Left icon"
  slot(left_icon)
  @doc "Right icon"
  slot(right_icon)
  @doc "Data-testid attribute for DOM element"
  prop(testid, :string)
  @doc "Id attribute for DOM element"
  prop(id, :string)

  def render(assigns) do
    ~F"""
    <div
      {=@id}
      class={merge([
        [
          "flex items-center select-none text-goku font-semibold bg-bulma tracking-[0.5px]",
          Utils.get_tag_size(@size),
          "#{Utils.get_lowercase_font_size(@size)}": !@is_uppercase,
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
