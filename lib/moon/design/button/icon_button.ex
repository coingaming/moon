defmodule Moon.Design.Button.IconButton do
  @moduledoc false

  use Moon.StatelessComponent
  alias Moon.Icon
  alias Moon.Components.Loader

  prop(variant, :string,
    values: ["primary", "secondary", "tertiary", "ghost"],
    default: "primary"
  )

  prop(size, :string, values: ["xs", "sm", "md", "lg", "xl"], default: "md")
  prop(disabled, :boolean)
  prop(animation, :string, values: ~w(progress success error pulse))
  prop(class, :css_class)

  prop(icon_only, :string)

  def render(assigns) do
    ~F"""
    <button class={
      "flex justify-center items-center relative overflow-hidden active:scale-90 transition-all",
      @class,
      "text-goten bg-piccolo": @variant in ["primary"],
      "border border-solid bg-transparent text-bulma border-trunks hover:border-bulma":
        @variant in ["secondary"],
      "bg-hit text-goten": @variant in ["tertiary"],
      "bg-none text-trunks hover:text-bulma": @variant in ["ghost"],
      "rounded-moon-s-xs h-6 p-1": @size == "xs",
      "rounded-moon-s-sm h-8 p-1": @size == "sm" ,
      "rounded-moon-s-sm h-10 p-2": @size == "md",
      "rounded-moon-s-sm h-12 p-3": @size == "lg",
      "rounded-moon-s-md h-14 p-4": @size == "xl",
      "opacity-30": @disabled,
      "anim-pulse animate-[pulse2_1.5s_infinite]": @animation == "pulse",
      "bg-chi-chi text-goten animate-[error_0.82s_cubic-bezier(0.36,0.07,0.19,0.97)_1_both] anim-error":
        @animation == "error"
    }>
      <span
        :if={@animation in ["success", "progress"]}
        class="flex absolute top-1/2 left-1/2 translate-y-[-50%] translate-x-[-50%] content-center justify-center"
      >
        {#if @animation == "progress"}
          <Loader color="currentColor" size="xs" />
        {#elseif @animation == "success"}
          <Icon name="generic_check_alternative" color="currentColor" class={icon_class(@size)} />
        {/if}
      </span>
      <span class={
        "flex justify-center items-center",
        "opacity-0": @animation in ["success", "progress"]
      }>
          <Icon name={@icon_only} class={icon_class(@size)} />
      </span>
    </button>
    """
  end

  defp icon_class("xs"), do: "h-4 w-4"
  defp icon_class("sm"), do: "h-6 w-6"
  defp icon_class("md"), do: "h-6 w-6"
  defp icon_class("lg"), do: "h-6 w-6"
  defp icon_class("xl"), do: "h-6 w-6"
end
