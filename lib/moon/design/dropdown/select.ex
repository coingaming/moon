defmodule Moon.Design.Dropdown.Select do
  @moduledoc "Element that triggers Dropdown component, renders as a button"

  alias Moon.Icon
  use Moon.StatelessComponent, slot: "trigger"

  @doc "Data-testid attribute for html tag"
  prop(testid, :string)
  @doc "Id attribute for html tag"
  prop(id, :string)
  @doc "Additional CSS classes for the html tag"
  prop(class, :css_class)

  @doc "Text to be shown when no value given"
  prop(prompt, :string, default: "...")
  @doc "Value to be shown"
  prop(value, :string)
  @doc "Badge to show selected items count or smth else"
  prop(badge, :string)

  @doc "Some additional styling will be set to indicate field is iinvalid"
  prop(error, :boolean, from_context: :error)
  @doc "If the open indicator is active or not"
  prop(is_open, :boolean)
  @doc "Site of the select"
  prop(size, :string, values!: ~w(sm md lg), from_context: :size)
  @doc "If the item should be marked as disabled"
  prop(disabled, :boolean)
  @doc "Content of the button"
  slot(default)

  def render(assigns) do
    ~F"""
    <button
      {=@id}
      data-testid={@testid}
      type="button"
      {=@error}
      {=@disabled}
      class={merge([
        "flex items-center justify-between w-full bg-gohan border-beerus",
        "shadow-input hover:shadow-input-hov transition-shadow duration-200",
        "focus:shadow-input-focus focus:outline-none py-0 px-4 m-0",
        "moon-error:shadow-input-err moon-error:hover:shadow-input-err moon-error:focus:shadow-input-err",
        [
          "leading-8 rounded-moon-i-xs text-moon-14": @size == "sm",
          "leading-10 rounded-moon-i-sm text-moon-16": !(@size in ~w(sm lg)),
          "leading-[3rem] rounded-moon-i-sm text-moon-16": @size == "lg",
          "opacity-30 outline-0 border-none cursor-not-allowed hover:shadow-input focus:shadow-input":
            @disabled
        ],
        @class
      ])}
    >
      <span
        :if={@badge}
        class={
          "flex-shrink-0 chip bg-bulma text-gohan flex items-center justify-center rounded-moon-s-xs cursor-pointer text-moon-12",
          "h-4 px-0.5": @size == "sm",
          "h-6 px-1": @size != "sm"
        }
      >
        <span class={"px-0.5": @size == "sm", "px-1": @size != "sm"}>{@badge}</span>
        <Icon name="controls_close" class="text-gohan text-moon-12" />
      </span>
      <span class={
        "overflow-hidden whitespace-nowrap text-trunks",
        "text-bulma": !!@value || slot_assigned?(:default)
      }>
        <#slot>{@value || @prompt}</#slot>
      </span>
      <Icon
        name="controls_chevron_down"
        class={"text-trunks flex-shrink-0 transition-transform", "rotate-180": @is_open}
      />
    </button>
    """
  end
end
