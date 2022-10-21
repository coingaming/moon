defmodule Moon.Components.Button do
  @moduledoc false

  use Moon.StatelessComponent
  alias Moon.Icon
  alias Moon.Components.Loader

  prop id, :string
  prop href, :string

  # TODO, none variant was added so as not to break PreviewCodeButton component
  # Deprecate Link and None (they are not in Figma)
  prop variant, :string,
    values: ["primary", "secondary", "tertiary", "ghost", "none"],
    default: "primary"

  prop size, :string, values: ["xs", "sm", "md", "lg", "xl"], default: "md"
  prop full_width, :boolean
  prop progress, :boolean
  prop oops, :boolean
  prop success, :boolean
  prop pulse, :boolean
  prop disabled, :boolean
  prop type, :string, default: "button"
  prop to, :string
  prop active_class_name, :string
  prop active_style, :string
  prop exact, :boolean
  prop string, :boolean
  prop is_active, :boolean
  prop location, :string
  prop style, :string
  prop class, :string
  prop form, :string

  prop on_click, :event
  prop value_name, :string
  prop value, :any
  prop values, :keyword, default: []

  prop left_icon, :string
  prop right_icon, :string

  prop testid, :string

  prop animation, :string, values: ~w(progress success error pulse)

  slot default
  slot right_icon_slot
  slot left_icon_slot

  def render(assigns) do
    ~F"""
    <button
      id={@id}
      class={
        "flex justify-center items-center gap-2 relative overflow-hidden active:scale-90 transition-all #{@class}",
        "text-goten-100 bg-piccolo-100": @variant in ["primary"],
        "border border-solid bg-transparent text-bulma-100 border-trunks-100 hover:border-bulma-100":
          @variant in ["secondary"],
        "bg-hit-100 text-goten-100": @variant in ["tertiary"],
        "bg-none text-trunks-100 hover:text-bulma-100": @variant in ["ghost"],
        "text-trunks-100 hover:bg-hit-120 hover:text-piccolo-80": @variant in ["link"],
        "text-moon-12 h-8 px-2": @size == "xs" && slot_assigned?(:default),
        "text-moon-14 h-8 px-3": @size == "sm" && slot_assigned?(:default),
        "text-moon-14 h-10 px-4": @size == "md" && slot_assigned?(:default),
        "text-moon-16 h-12 px-5": @size == "lg" && slot_assigned?(:default),
        "text-moon-16 h-14 px-6": @size == "xl" && slot_assigned?(:default),
        "p-1": @size == "xs" && !slot_assigned?(:default),
        "p-1": @size == "sm" && !slot_assigned?(:default),
        "p-2": @size == "md" && !slot_assigned?(:default),
        "p-3": @size == "lg" && !slot_assigned?(:default),
        "p-4": @size == "xl" && !slot_assigned?(:default),
        "rounded-moon-s-xs": @size == "xs",
        "rounded-moon-s-sm": @size == "sm",
        "rounded-moon-s-sm": @size == "md",
        "rounded-moon-s-sm": @size == "lg",
        "rounded-moon-s-md": @size == "xl",
        "w-full": @full_width,
        "opacity-30": @disabled,
        "anim-pulse animate-[pulse2_1.5s_infinite]": @animation == "pulse",
        "bg-chi-chi-100 text-goten-100 animate-[error_0.82s_cubic-bezier(0.36,0.07,0.19,0.97)_1_both] anim-error":
          @animation == "error"
      }
      disabled={@disabled}
      type={@type}
      form={@form}
      data-size={@size}
      data-testid={@testid}
      :on-click={@on_click}
      :values={@values}
      {...phx_val_tag(@value_name || (@value && "click_value") || nil, @value)}
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
      <span class={"flex justify-center items-center gap-2", "opacity-0": @animation in ["success", "progress"]}>
        {#if slot_assigned?(:left_icon_slot)}
          <#slot name="left_icon_slot" />
        {#else}
          <Icon name={@left_icon} class={icon_class(@size)} :if={@left_icon} />
        {/if}
        <#slot />
        {#if slot_assigned?(:right_icon_slot)}
          <#slot name="right_icon_slot" />
        {#else}
          <Icon name={@right_icon} class={icon_class(@size)} :if={@right_icon} />
        {/if}
      </span>
      <span class="block absolute inset-0 bg-transparent hover:bg-primary-hover" />
    </button>
    """
  end

  defp phx_val_tag(nil, _), do: []

  defp phx_val_tag(name, value) do
    # credo:disable-for-next-line Credo.Check.Warning.UnsafeToAtom
    key = String.to_atom("phx-value-#{name}")
    [{key, value}]
  end

  defp icon_class("xs"), do: "h-4 w-4"
  defp icon_class("sm"), do: "h-4 w-4"
  defp icon_class("md"), do: "h-6 w-6"
  defp icon_class("lg"), do: "h-6 w-6"
  defp icon_class("xl"), do: "h-6 w-6"
end
