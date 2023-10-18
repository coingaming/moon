defmodule Moon.Design.Button do
  @moduledoc false

  use Moon.StatelessComponent

  use Moon.Design.Button.Properties

  alias Moon.Components.AsComponent
  alias Moon.Design.Button.Utils
  alias Moon.Icon
  alias Moon.Design.Loader

  def render(assigns) do
    ~F"""
    <AsComponent
      {=@as}
      {=@href}
      {=@id}
      class={merge([
        [
          "flex row justify-center items-center relative overflow-hidden active:scale-90 transition-all duration-200 font-semibold group z-0",
          "whitespace-nowrap select-none",
          Utils.get_button_size_classes(@size),
          Utils.variant_classes(assigns),
          Utils.animation_classes(assigns),
          "#{Utils.get_no_icon_padding(@size)}": !@right_icon && !@left_icon,
          "#{Utils.get_right_icon_paddings(@size)}": @right_icon && !@full_width,
          "#{Utils.get_left_icon_paddings(@size)}": @left_icon && !@full_width,
          "#{Utils.get_full_width_padding(@size)}": @full_width,
          "w-full": @full_width
        ],
        @class
      ])}
      on_click={@on_click}
      testid={@testid}
      {=@aria_label}
      {=@values}
      {=@value}
      {=@target}
      {=@rel}
      attrs={[
        disabled: @disabled,
        type: @type,
        form: @form,
        "data-size": @size
      ] ++ @attrs}
    >
      {#if @animation}
        {animation_content(assigns)}
        <span class={"flex gap-2 items-center", "opacity-0": @animation in ["success", "progress"]}>
          {content(assigns)}
        </span>
      {#else}
        {content(assigns)}
      {/if}
      <span class={merge(Utils.hover_overlay_classes(assigns) ++ [@hover_bg_class])} />
    </AsComponent>
    """
  end

  defp animation_content(assigns) do
    ~F"""
    <span
      :if={@animation in ["success", "progress"]}
      class="flex absolute top-1/2 left-1/2 translate-y-[-50%] translate-x-[-50%] content-center justify-center"
    >
      {#if @animation == "progress"}
        <Loader
          color={if @variant in ["primary", "fill", "tertiary"], do: "gohan", else: "trunks"}
          size={if @size == "xs", do: "2xs", else: "xs"}
        />
      {#elseif @animation == "success"}
        <Icon name="generic_check_alternative" color="currentColor" class={Utils.icon_class(@size)} />
      {/if}
    </span>
    """
  end

  defp content(assigns) do
    ~F"""
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
    """
  end
end
