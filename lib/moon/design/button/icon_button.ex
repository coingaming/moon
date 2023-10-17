defmodule Moon.Design.Button.IconButton do
  @moduledoc false

  use Moon.StatelessComponent

  use Moon.Design.Button.IconButtonProperties

  alias Moon.Components.AsComponent
  alias Moon.Icon
  alias Moon.Design.Loader
  alias Moon.Design.Button.Utils

  def render(assigns) do
    ~F"""
    <AsComponent
      {=@as}
      {=@href}
      {=@id}
      class={merge([
        [
          "flex row justify-center items-center gap-2 relative overflow-hidden active:scale-90 transition-all duration-200 select-none font-semibold group z-0",
          Utils.get_icon_button_size_classes(@size),
          Utils.variant_classes(assigns),
          Utils.animation_classes(assigns)
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
        <span class={"flex justify-center items-center", "opacity-0": @animation in ["success", "progress"]}>
          {#if @icon_only || @icon}
            <Icon name={@icon_only || @icon} class={Utils.icon_class(@size)} />
          {#else}
            <#slot />
          {/if}
        </span>
      {#else}
        {#if @icon_only || @icon}
          <Icon name={@icon_only || @icon} class={Utils.icon_class(@size)} />
        {#else}
          <#slot />
        {/if}
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
end
