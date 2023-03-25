defmodule Moon.Design.Tag do
  @moduledoc false

  use Moon.StatelessComponent

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
          "flex items-center rounded-moon-i-xs select-none text-gohan font-medium bg-bulma tracking-[0.5px] ps-2 pe-2",
          "text-moon-9 py-0": @size == "2xs",
          "text-moon-10 py-1": @size == "xs",
          "text-moon-10 tracking-0 font-regular": @size == "2xs" && !@is_uppercase,
          "text-moon-12 tracking-0 font-regular": @size == "xs" && !@is_uppercase,
          "ps-1": @left_icon,
          "pe-1": @right_icon,
          uppercase: @is_uppercase
        ],
        @class
      ])}
      data-testid={@testid}
    >
      <span class={icon_size(@size), "ltr:mr-1 rtl:ml-1": @left_icon}>
        <#slot {@left_icon} />
      </span>
      <#slot />
      <span class={icon_size(@size), "ltr:ml-1 rtl:mr-1": @right_icon}>
        <#slot {@right_icon} />
      </span>
    </div>
    """
  end

  defp icon_size(size) do
    case size do
      "2xs" -> "text-moon-14 leading-none"
      _ -> "text-moon-16 leading-none"
    end
  end
end
