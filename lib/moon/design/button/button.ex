defmodule Moon.Design.Button.Button do
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
        "text-goten bg-piccolo": @variant in ["primary"],
        "border border-solid bg-transparent text-bulma border-trunks hover:border-bulma":
          @variant in ["secondary"],
        "bg-hit text-goten": @variant in ["tertiary"],
        "bg-none text-trunks hover:text-bulma": @variant in ["ghost"],
        "text-moon-12 rounded-moon-s-xs h-6 px-2": @size == "xs" && slot_assigned?(:default),
        "text-moon-14 rounded-moon-s-sm h-8 px-3": @size == "sm" && slot_assigned?(:default),
        "text-moon-14 rounded-moon-s-sm h-10 px-4": @size == "md" && slot_assigned?(:default),
        "text-moon-16 rounded-moon-s-sm h-12 px-4": @size == "lg" && slot_assigned?(:default),
        "text-moon-16 rounded-moon-s-md h-14 px-6": @size == "xl" && slot_assigned?(:default),
        "text-moon-12 rounded-moon-s-xs h-6 px-2": @size == "xs" && slot_assigned?(:right_icon_slot),
        "text-moon-14 rounded-moon-s-sm h-8 pr-3 pl-3":
          @size == "sm" && slot_assigned?(:right_icon_slot),
        "text-moon-14 rounded-moon-s-sm h-10 pr-3 pl-4":
          @size == "md" && slot_assigned?(:right_icon_slot),
        "text-moon-16 rounded-moon-s-sm h-12 pr-4 pl-4":
          @size == "lg" && slot_assigned?(:right_icon_slot),
        "text-moon-16 rounded-moon-s-md h-14 pr-5 pl-6":
          @size == "xl" && slot_assigned?(:right_icon_slot),
        "text-moon-12 rounded-moon-s-xs h-6 px-2": @size == "xs" && slot_assigned?(:left_icon_slot),
        "text-moon-14 rounded-moon-s-sm h-8 pr-3 pl-3":
          @size == "sm" && slot_assigned?(:left_icon_slot),
        "text-moon-14 rounded-moon-s-sm h-10 pr-4 pl-3":
          @size == "md" && slot_assigned?(:left_icon_slot),
        "text-moon-16 rounded-moon-s-sm h-12 pr-4 pl-4":
          @size == "lg" && slot_assigned?(:left_icon_slot),
        "text-moon-16 rounded-moon-s-md h-14 pr-6 pl-5":
          @size == "xl" && slot_assigned?(:left_icon_slot),
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
          <Loader color="currentColor" size="xs" />
        {#elseif @animation == "success"}
          <Icon name="generic_check_alternative" color="currentColor" class={icon_class(@size)} />
        {/if}
      </span>
      <span class={
        "flex justify-center items-center",
        @button_gap,
        "opacity-0": @animation in ["success", "progress"]
      }>
        <div>{#if slot_assigned?(:left_icon_slot)}
          <#slot {@left_icon_slot} />
        {#else}
          <Icon name={@left_icon} class={icon_class(@size)} :if={@left_icon} />
        {/if}</div>
        <div><#slot /></div>
        <div>{#if slot_assigned?(:right_icon_slot)}
          <#slot {@right_icon_slot}/>
        {#else}
          <Icon name={@right_icon} class={icon_class(@size)} :if={@right_icon} />
        {/if}</div>
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
