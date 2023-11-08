defmodule Moon.Design.Button.Utils do
  @moduledoc false

  def icon_class("xs"), do: "h-4 w-4"
  def icon_class("sm"), do: "h-6 w-6"
  def icon_class("md"), do: "h-6 w-6"
  def icon_class("lg"), do: "h-6 w-6"
  def icon_class("xl"), do: "h-6 w-6"

  def get_button_size_classes(size) do
    case size do
      "xs" -> "text-moon-12 rounded-moon-s-xs h-6 gap-1"
      "sm" -> "text-moon-14 rounded-moon-s-sm h-8 gap-1"
      "md" -> "text-moon-14 rounded-moon-s-sm h-10 gap-2"
      "lg" -> "text-moon-16 rounded-moon-s-sm h-12 gap-2"
      "xl" -> "text-moon-16 rounded-moon-s-md h-14 gap-2"
    end
  end

  def get_icon_button_size_classes(size) do
    case size do
      "xs" -> "text-moon-12 rounded-moon-s-xs h-6 w-6 p-1"
      "sm" -> "text-moon-14 rounded-moon-s-sm h-8 w-8 p-1"
      "md" -> "text-moon-14 rounded-moon-s-sm h-10 w-10 p-2"
      "lg" -> "text-moon-16 rounded-moon-s-sm h-12 w-12 p-3"
      "xl" -> "text-moon-16 rounded-moon-s-md h-14 w-14 p-4"
    end
  end

  def get_right_icon_paddings(size) do
    case size do
      "xs" -> "ps-2 pe-1"
      "sm" -> "ps-3 pe-1"
      "md" -> "ps-4 pe-2"
      "lg" -> "ps-4 pe-3"
      "xl" -> "ps-6 pe-4"
    end
  end

  def get_left_icon_paddings(size) do
    case size do
      "xs" -> "ps-1 pe-2"
      "sm" -> "ps-1 pe-3"
      "md" -> "ps-2 pe-4"
      "lg" -> "ps-3 pe-4"
      "xl" -> "ps-4 pe-6"
    end
  end

  def get_no_icon_padding(size) do
    case size do
      "xs" -> "px-2"
      "sm" -> "px-3"
      "md" -> "px-4"
      "lg" -> "px-4"
      "xl" -> "px-6"
    end
  end

  def get_full_width_padding(size) do
    case size do
      "xs" -> "px-2"
      "sm" -> "px-3"
      "md" -> "px-4"
      "lg" -> "px-4"
      "xl" -> "px-6"
    end
  end

  def right_icon_horizontal_position(size) do
    case size do
      "xs" -> "absolute block top-1/2 translate-y-[-50%] ltr:right-1 rtl:left-1"
      "sm" -> "absolute block top-1/2 translate-y-[-50%] ltr:right-1 rtl:left-1"
      "md" -> "absolute block top-1/2 translate-y-[-50%] ltr:right-2 rtl:left-2"
      "lg" -> "absolute block top-1/2 translate-y-[-50%] ltr:right-3 rtl:left-3"
      "xl" -> "absolute block top-1/2 translate-y-[-50%] ltr:right-4 rtl:left-4"
    end
  end

  def left_icon_horizontal_position(size) do
    case size do
      "xs" -> "absolute block top-1/2 translate-y-[-50%] ltr:left-1 rtl:right-1"
      "sm" -> "absolute block top-1/2 translate-y-[-50%] ltr:left-1 rtl:right-1"
      "md" -> "absolute block top-1/2 translate-y-[-50%] ltr:left-2 rtl:right-2"
      "lg" -> "absolute block top-1/2 translate-y-[-50%] ltr:left-3 rtl:right-3"
      "xl" -> "absolute block top-1/2 translate-y-[-50%] ltr:left-4 rtl:right-4"
    end
  end

  def variant_classes(%{variant: variant, animation: animation, disabled: disabled}) do
    [
      "text-goten bg-piccolo": variant in ["primary", "fill"],
      "bg-hit text-goten": variant in ["tertiary"],
      "border border-solid bg-transparent text-bulma border-trunks":
        variant in ["secondary", "outline"] && animation != "error",
      "border border-solid bg-transparent text-bulma border-chichi":
        variant in ["secondary", "outline"] && animation == "error",
      "bg-transparent text-trunks hover:text-bulma": variant in ["ghost"] && animation != "error",
      "opacity-60 cursor-not-allowed active:transform-none": disabled
    ]
  end

  def animation_classes(%{variant: variant, animation: animation}) do
    [
      "animate-[error_0.82s_cubic-bezier(0.36,0.07,0.19,0.97)_1_both] anim-error":
        animation == "error",
      "bg-chichi text-goten": animation == "error" && variant in ["primary", "fill", "tertiary"],
      "text-chichi border-chichi": animation == "error" && variant in ["secondary", "outline"],
      "text-chichi": animation == "error" && variant in ["ghost"],
      "anim-pulse animate-[pulse2_1.5s_infinite]":
        animation == "pulse" && variant in ["primary", "fill"]
    ]
  end

  def hover_overlay_classes(%{disabled: disabled, animation: animation, variant: variant}) do
    [
      "block absolute inset-0 pointer-events-none bg-transparent transition-[background-color_0.2s_ease-in-out z-[-1]",
      "group-hover:bg-heles":
        !disabled && animation != "error" &&
          variant in ["primary", "fill", "tertiary", "secondary", "outline"],
      "group-hover:bg-jiren": !disabled && animation != "error" && variant in ["ghost"],
      "group-hover:bg-heles":
        !disabled && animation == "error" && variant in ["primary", "fill", "tertiary"],
      "group-hover:bg-chichi-10":
        !disabled && animation == "error" && variant in ["secondary", "outline", "ghost"]
    ]
  end
end
