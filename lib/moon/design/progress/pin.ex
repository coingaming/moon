defmodule Moon.Design.Progress.Pin do
  @moduledoc false

  use Moon.StatelessComponent, slot: "pin"

  @doc "Id of the component"
  prop(id, :string)
  @doc "Data-testid attribute value"
  prop(testid, :string)
  @doc "Tailwind classes for customization"
  prop(class, :css_class, from_context: :class)
  @doc "Will be got from Progress in most cases"
  prop(size, :css_class, from_context: :size)
  @doc "Will be got from Progress in most cases"
  prop(value, :decimal, from_context: :value)

  def render(assigns) do
    ~F"""
    <div class={[
      merge([
        "absolute box-content flex items-center justify-center w-8 h-8 border-2 font-medium",
        "text-moon-10-caption uppercase text-goten bg-popo border-goten rounded-full",
        "shadow-[0_2px_8px_0_rgba(0,0,0,0.16)]",
        "before:absolute before:bg-goten before:rounded-full",
        "before:shadow-[0_2px_8px_0_rgba(0,0,0,0.16)]",
        "after:absolute after:w-0 after:h-0 after:border-x-4 after:border-x-transparent",
        "after:-bottom-[6px]  after:border-t-goten",
        get_pin_style(@size),
        @class
      ]),
      "border-2",
      "after:border-x-4",
      "after:border-t-[6px]"
    ]}>
      {"#{round(@value || 0)}%"}
    </div>
    """
  end

  def get_pin_style(size) do
    case size do
      "6xs" ->
        "bottom-[18px] ltr:-right-3 rtl:-left-3 before:w-3 before:h-3 before:-bottom-[25px]"

      "5xs" ->
        "bottom-5 ltr:-right-3 rtl:-left-3 before:w-3 before:h-3 before:-bottom-[26px]"

      "4xs" ->
        "bottom-6 ltr:-right-3 rtl:-left-3 before:w-3 before:h-3 before:-bottom-7"

      "3xs" ->
        "bottom-7 ltr:-right-3 rtl:-left-3 before:w-3 before:h-3 before:-bottom-[30px]"

      "2xs" ->
        "bottom-8 ltr:-right-[10px] rtl:-left-[10px] before:w-4 before:h-4 before:-bottom-[34px]"
    end
  end
end
