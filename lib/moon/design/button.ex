defmodule Moon.Design.Button do
  @moduledoc false

  use Moon.StatelessComponent

  alias Moon.Components.AsComponent
  alias Moon.Design.Button.Utils
  alias Moon.Icon
  alias Moon.Design.Loader

  prop(variant, :string,
    values: ["primary", "secondary", "tertiary", "ghost"],
    default: "primary"
  )
  prop(size, :string, values: ["xs", "sm", "md", "lg", "xl"], default: "md")
  prop(as, :string, values!: ~w(a button), default: "button")
  prop(href, :string)
  prop(full_width, :boolean)
  prop(disabled, :boolean)
  prop(animation, :string, values: ~w(progress success error pulse))
  prop(class, :css_class)
  prop(type, :string, default: "button")
  prop(form, :string)
  prop(on_click, :event)
  prop(values, :keyword, default: [])
  prop(left_icon, :string)
  prop(right_icon, :string)
  prop(button_gap, :css_class, default: "gap-2")
  prop(id, :string)
  prop(testid, :string)
  prop(attrs, :keyword, default: [])

  slot(default)
  slot(right_icon_slot)
  slot(left_icon_slot)

  def render(assigns) do
    ~F"""
    <AsComponent
      {=@as}
      {=@href}
      {=@id}
      class={merge([
        [
          "flex row justify-center items-center gap-2 relative overflow-hidden active:scale-90 transition-all duration-200 font-semibold group z-0",
          "whitespace-nowrap select-none",
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
          "opacity-30 cursor-not-allowed active:transform-none": @disabled,
          "anim-pulse animate-[pulse2_1.5s_infinite]": @animation == "pulse",
          "bg-chichi text-goten animate-[error_0.82s_cubic-bezier(0.36,0.07,0.19,0.97)_1_both] anim-error":
            @animation == "error"
        ],
        @class
      ])}
      on_click={@on_click}
      testid={@testid}
      attrs={
        [
          disabled: @disabled,
          type: @type,
          form: @form,
          "data-size": @size,
          ":values": @values
        ] ++ @attrs
      }
    >
      <span
        :if={@animation in ["success", "progress"]}
        class="flex absolute top-1/2 left-1/2 translate-y-[-50%] translate-x-[-50%] content-center justify-center"
      >
        {#if @animation == "progress"}
          <Loader color="currentColor" size={if @size == "xs", do: "2xs", else: "xs"} />
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
      <span class="block absolute inset-0 pointer-events-none bg-transparent transition-[background-color_0.2s_ease-in-out z-[-1] group-hover:bg-heles" />
    </AsComponent>
    """
  end
end
