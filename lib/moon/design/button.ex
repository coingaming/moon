defmodule Moon.Design.Button do
  @moduledoc false

  use Moon.StatelessComponent

  alias Moon.Design.Button.Utils
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
        Utils.get_button_size_classes(@size),
        "#{Utils.get_no_icon_padding(@size)}": !@right_icon && !@left_icon,
        "#{Utils.get_right_icon_paddings(@size)}": @right_icon && !@full_width,
        "#{Utils.get_left_icon_paddings(@size)}": @left_icon && !@full_width,
        "#{Utils.get_full_width_padding(@size)}": @full_width,
        "text-goten bg-piccolo": @variant in ["primary"],
        "border border-solid bg-transparent text-bulma border-trunks hover:border-bulma":
          @variant in ["secondary"],
        "bg-hit text-goten": @variant in ["tertiary"],
        "bg-none text-trunks hover:text-bulma": @variant in ["ghost"],
        "w-full": @full_width,
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
          <Icon name="generic_check_alternative" color="currentColor" class={Utils.icon_class(@size)} />
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
          <Icon
            name={@left_icon}
            class={
              Utils.icon_class(@size),
              "#{Utils.left_icon_horizontal_position(@size)}": @full_width
            }
            :if={@left_icon}
          />
        {/if}
        <#slot />
        {#if slot_assigned?(:right_icon_slot)}
          <#slot {@right_icon_slot} />
        {#else}
          <Icon
            name={@right_icon}
            class={
              Utils.icon_class(@size),
              "#{Utils.right_icon_horizontal_position(@size)}": @full_width
            }
            :if={@right_icon}
          />
        {/if}
      </span>
    </button>
    """
  end
end
