defmodule Moon.Design.Button do
  @moduledoc false

  use Moon.StatelessComponent
  alias Moon.Icon
  alias Moon.Components.Loader

  prop(variant, :string,
    values: ["primary", "secondary", "tertiary", "ghost"],
    default: "primary"
  )

  prop(size, :string, values: ["xs", "sm", "md", "lg", "xl"], default: "md")
  prop(as, :string, values!: ~w(a button), default: "button")
  prop(full_width, :boolean)
  prop(disabled, :boolean)
  prop(animation, :string, values: ~w(progress success error pulse))
  prop(class, :css_class)

  prop(left_icon, :string)
  prop(right_icon, :string)

  slot(default)
  slot(right_icon_slot)
  slot(left_icon_slot)

  prop(button_gap, :css_class, default: "gap-2")

  def render(assigns) do
    ~F"""
    <button
      {=@as}
      class={
        "flex row justify-center items-center gap-2 relative overflow-hidden active:scale-90 transition-all font-semibold",
        @class,
        get_button_size_classes(@size),
        "#{get_no_icon_padding(@size)}": !@right_icon && !@left_icon,
        "#{get_right_icon_paddings(@size, @right_icon)}": @right_icon && !@full_width,
        "#{get_left_icon_paddings(@size, @left_icon)}": @left_icon && !@full_width,
        "#{get_full_width_padding(@size, @full_width)}": @full_width,

        "text-goten bg-piccolo": @variant in ["primary"],
        "border border-solid bg-transparent text-bulma border-trunks hover:border-bulma":
          @variant in ["secondary"],
        "bg-hit text-goten": @variant in ["tertiary"],
        "bg-none text-trunks hover:text-bulma": @variant in ["ghost"],
        "w-full": @full_width,

        #"w-full bg-hit": @full_width && @right_icon,
        "opacity-30": @disabled,
        "anim-pulse animate-[pulse2_1.5s_infinite]": @animation == "pulse",
        "bg-chi-chi text-goten animate-[error_0.82s_cubic-bezier(0.36,0.07,0.19,0.97)_1_both] anim-error":
          @animation == "error"
      }
    >
      <span
        :if={@animation in ["success", "progress"]}
        class="flex absolute top-1/2 left-1/2 translate-y-[-50%] translate-x-[-50%] content-center justify-center"
      >
        {#if @animation == "progress"}
          <Loader color="currentColor" size="sm" />
        {#elseif @animation == "success"}
          <Icon name="generic_check_alternative" color="currentColor" class={icon_class(@size)} />
        {/if}
      </span>

      <span class={
        "flex justify-center items-center",
        @button_gap,
        "opacity-0": @animation in ["success", "progress"]
      }>
        {#if slot_assigned?(:left_icon_slot)}
          <#slot {@left_icon_slot} />
        {#else}
          <Icon name={@left_icon} class={
            icon_class(@size),
            "#{left_icon_horizontal_position(@size)}": @full_width
            } :if={@left_icon} />
        {/if}
        <#slot />
        {#if slot_assigned?(:right_icon_slot)}
          <#slot {@right_icon_slot} />
        {#else}
          <Icon name={@right_icon} class={
            icon_class(@size),
            "#{right_icon_horizontal_position(@size)}": @full_width
            } :if={@right_icon} />

        {/if}
      </span>
    </button>
    """
  end

  defp icon_class("xs"), do: "h-4 w-4"
  defp icon_class("sm"), do: "h-6 w-6"
  defp icon_class("md"), do: "h-6 w-6"
  defp icon_class("lg"), do: "h-6 w-6"
  defp icon_class("xl"), do: "h-6 w-6"

  defp get_button_size_classes(size) do
    case size do
      "xs" -> "text-moon-12 rounded-moon-s-xs h-6"
      "sm" -> "text-moon-14 rounded-moon-s-sm h-8"
      "md" -> "text-moon-14 rounded-moon-s-sm h-10"
      "lg" -> "text-moon-16 rounded-moon-s-sm h-12"
      "xl" -> "text-moon-16 rounded-moon-s-md h-14"
    end
  end

  defp get_right_icon_paddings(size, right_icon) do
    if right_icon do
      case size do
        "xs" -> "ps-2 pe-1"
        "sm" -> "ps-3 pe-1"
        "md" -> "ps-4 pe-2"
        "lg" -> "ps-4 pe-3"
        "xl" -> "ps-6 pe-4"
      end
    end
  end

  defp get_left_icon_paddings(size, left_icon) do
    if left_icon do
      case size do
        "xs" -> "ps-1 pe-2"
        "sm" -> "ps-1 pe-3"
        "md" -> "ps-2 pe-4"
        "lg" -> "ps-3 pe-4"
        "xl" -> "ps-4 pe-6"
      end
    end
  end

  defp get_no_icon_padding(size) do
    case size do
      "xs" -> "px-2"
      "sm" -> "px-3"
      "md" -> "px-4"
      "lg" -> "px-4"
      "xl" -> "px-6"
    end
  end

  defp get_full_width_padding(size, full_width) do
    if full_width do
      case size do
        "xs" -> "px-2"
        "sm" -> "px-3"
        "md" -> "px-4"
        "lg" -> "px-4"
        "xl" -> "px-6"
      end
    end
  end

  defp right_icon_horizontal_position(size) do
    case size do
      "xs" -> "absolute block top-1/2 translate-y-[-50%] ltr:right-1 rtl:left-1"
      "sm" -> "absolute block top-1/2 translate-y-[-50%] ltr:right-1 rtl:left-1"
      "md" -> "absolute block top-1/2 translate-y-[-50%] ltr:right-2 rtl:left-2"
      "lg" -> "absolute block top-1/2 translate-y-[-50%] ltr:right-3 rtl:left-3"
      "xl" -> "absolute block top-1/2 translate-y-[-50%] ltr:right-4 rtl:left-4"
    end
  end

  defp left_icon_horizontal_position(size) do
    case size do
      "xs" -> "absolute block top-1/2 translate-y-[-50%] ltr:left-1 rtl:right-1"
      "sm" -> "absolute block top-1/2 translate-y-[-50%] ltr:left-1 rtl:right-1"
      "md" -> "absolute block top-1/2 translate-y-[-50%] ltr:left-2 rtl:right-2"
      "lg" -> "absolute block top-1/2 translate-y-[-50%] ltr:left-3 rtl:right-3"
      "xl" -> "absolute block top-1/2 translate-y-[-50%] ltr:left-4 rtl:right-4"
    end
  end

  # defp get_left_padding(size, left_icon, right_icon) do
  #   if left_icon do
  #     case size do
  #       "xs" -> "ps-1"
  #       "sm" -> "ps-1"
  #       "md" -> "ps-2"
  #       "lg" -> "ps-3"
  #       "xl" -> "ps-4"
  #     end
  #   end
  #   if right_icon do
  #       case size do
  #         "xs" -> "ps-2"
  #         "sm" -> "ps-3"
  #         "md" -> "ps-4"
  #         "lg" -> "ps-4"
  #         "xl" -> "ps-6"
  #       end
  #     end
  #   # if full_width do
  #   #   case size do
  #   #   "xs" -> "ltr:left-1 rtl:right-1"
  #   #   "sm" -> "ltr:left-1 rtl:right-1"
  #   #   "md" -> "ltr:left-2 rtl:right-2"
  #   #   "lg" -> "ltr:left-3 rtl:right-3"
  #   #   "xl" -> "ltr:left-4 rtl:right-4"
  #   #   end
  #   # end
  #   if right_icon && left_icon do
  #     get_x_padding(size)
  #   end
  # end

  # defp get_right_padding(size, left_icon, right_icon) do
  #   if left_icon do
  #     case size do
  #       "xs" -> "pe-2"
  #       "sm" -> "pe-3"
  #       "md" -> "pe-4"
  #       "lg" -> "pe-4"
  #       "xl" -> "pe-6"
  #     end
  #   end
  #   if right_icon do
  #       case size do
  #         "xs" -> "pe-1"
  #         "sm" -> "pe-1"
  #         "md" -> "pe-2"
  #         "lg" -> "pe-3"
  #         "xl" -> "pe-4"
  #       end
  #     end
  #   #  if full_width do
  #   #   case size do
  #   #   "xs" -> "ltr:right-1 rtl:left-1"
  #   #   "sm" -> "ltr:right-1 rtl:left-1"
  #   #   "md" -> "ltr:right-2 rtl:left-2"
  #   #   "lg" -> "ltr:right-3 rtl:left-3"
  #   #   "xl" -> "ltr:right-4 rtl:left-4"
  #   #   end
  #   #  end
  #   if !right_icon && !left_icon do
  #     get_x_padding(size)
  #   end
  # end

  # defp get_x_padding(size) do
  #     case size do
  #       "xs" -> "px-2"
  #       "sm" -> "px-3"
  #       "md" -> "px-4"
  #       "lg" -> "px-4"
  #       "xl" -> "px-6"
  #     end
  # end

  # defp get_icon_horizontal_position(size, left_icon, right_icon) do
  #   if left_icon do
  #     case size do
  #       "xs" -> "ltr:left-1 rtl:right-1"
  #       "sm" -> "ltr:left-1 rtl:right-1"
  #       "md" -> "ltr:left-2 rtl:right-2"
  #       "lg" -> "ltr:left-3 rtl:right-3"
  #       "xl" -> "ltr:left-4 rtl:right-4"
  #     end
  #   end
  #   if right_icon do
  #       case size do
  #         "xs" -> "ltr:right-1 rtl:left-1"
  #         "sm" -> "ltr:right-1 rtl:left-1"
  #         "md" -> "ltr:right-2 rtl:left-2"
  #         "lg" -> "ltr:right-3 rtl:left-3"
  #         "xl" -> "ltr:right-4 rtl:left-4"
  #       end
  #     end
  #   if !right_icon && !left_icon do
  #     get_x_padding(size)
  #   end
  # end

  # defp get_no_icon_padding(size) do
  #     case size do
  #       "xs" -> "px-2"
  #       "sm" -> "px-3"
  #       "md" -> "px-4"
  #       "lg" -> "px-4"
  #       "xl" -> "px-6"
  #     end
  # end
end
