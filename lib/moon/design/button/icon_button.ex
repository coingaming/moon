defmodule Moon.Design.Button.IconButton do
  @moduledoc false

  use Moon.StatelessComponent

  alias Moon.Components.AsComponent
  alias Moon.Icon
  alias Moon.Design.Loader
  alias Moon.Design.Button.Utils

  prop(variant, :string,
    values: ["primary", "secondary", "tertiary", "ghost"],
    default: "primary"
  )

  prop(as, :string, values!: ~w(a button), default: "button")
  prop(href, :string)
  prop(size, :string, values: ["xs", "sm", "md", "lg", "xl"], default: "md")
  prop(disabled, :boolean)
  prop(animation, :string, values: ~w(progress success error pulse))
  prop(class, :css_class)

  prop(icon_only, :string)

  prop(type, :string, default: "button")
  prop(form, :string)
  prop(on_click, :event)
  prop(values, :keyword, default: [])
  prop(value, :string)

  prop(id, :string)
  prop(testid, :string)

  def render(assigns) do
    ~F"""
    <AsComponent
      {=@as}
      {=@href}
      {=@id}
      class={merge([
        [
          "flex row justify-center items-center gap-2 relative overflow-hidden active:scale-90 transition-all duration-200 select-none font-semibold group z-0",
          get_icon_button_size_classes(@size),
          "text-goten bg-piccolo": @variant in ["primary"],
          "border border-solid bg-transparent text-bulma border-trunks hover:border-bulma":
            @variant in ["secondary"],
          "bg-hit text-goten": @variant in ["tertiary"],
          "bg-none text-trunks hover:text-bulma": @variant in ["ghost"],
          "opacity-60 cursor-not-allowed active:transform-none": @disabled,
          "anim-pulse animate-[pulse2_1.5s_infinite]": @animation == "pulse",
          "bg-chichi text-goten animate-[error_0.82s_cubic-bezier(0.36,0.07,0.19,0.97)_1_both] anim-error":
            @animation == "error"
        ],
        @class
      ])}
      on_click={@on_click}
      testid={@testid}
      {=@values}
      {=@value}
      attrs={
        disabled: @disabled,
        type: @type,
        form: @form,
        "data-size": @size
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
        "opacity-0": @animation in ["success", "progress"]
      }>
        <Icon name={@icon_only} class={Utils.icon_class(@size)} />
      </span>
      <span class="block absolute inset-0 pointer-events-none bg-transparent transition-[background-color_0.2s_ease-in-out z-[-1] group-hover:bg-heles" />
    </AsComponent>
    """
  end

  def get_icon_button_size_classes(size) do
    case size do
      "xs" -> "text-moon-12 rounded-moon-s-xs h-6 p-1"
      "sm" -> "text-moon-14 rounded-moon-s-sm h-8 p-1"
      "md" -> "text-moon-14 rounded-moon-s-sm h-10 p-2"
      "lg" -> "text-moon-16 rounded-moon-s-sm h-12 p-3"
      "xl" -> "text-moon-16 rounded-moon-s-md h-14 p-4"
    end
  end
end
