defmodule Moon.Components.Button do
  @moduledoc false

  use Moon.StatelessComponent
  alias Moon.Icon

  prop id, :string
  prop href, :string

  # TODO, none variant was added so as not to break PreviewCodeButton component
  # Deprecate Link and None (they are not in Figma)
  prop variant, :string,
    values: ["primary", "secondary", "tertiary", "ghost", "none"],
    default: "primary"

  prop size, :string, values: ["small", "medium", "large", "xlarge"], default: "medium"
  prop full_width, :boolean
  prop progress, :boolean
  prop oops, :boolean
  prop success, :boolean
  prop pulse, :boolean
  prop disabled, :boolean
  prop type, :string, default: "button"
  prop to, :string
  prop as, :string
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

  slot default

  def render(assigns) do
    ~F"""
    <button
      id={@id}
      class={
        "flex justify-center items-center gap-2 py-2 rounded relative active:scale-90 transition-all #{@class}",
        "text-goten-100 bg-piccolo-100 active:bg-piccolo-120 focus-within:bg-piccolo-120":
          @variant in ["primary"],
        "border border-solid bg-transparent text-bulma-100 border-trunks-100 hover:border-bulma-100":
          @variant in ["secondary"],
        "bg-hit-100 text-goten-100": @variant in ["tertiary"],
        "bg-none text-trunks-100 hover:text-bulma-100": @variant in ["ghost"],
        "text-trunks-100 hover:bg-hit-120 active:bg-hit-120 focus-within:bg-hit-120 hover:text-piccolo-80 active:text-piccolo-120 focus-within:text-piccolo-120":
          @variant in ["link"],
        "text-xs h-8 px-3 leading-4": @size == "xsmall" && slot_assigned?(:default),
        "text-sm h-8 px-3 leading-4": @size == "small" && slot_assigned?(:default),
        "text-sm h-10 px-4 leading-6": @size == "medium" && slot_assigned?(:default),
        "text-base h-12 px-5": @size == "large" && slot_assigned?(:default),
        "text-base h-14 px-6": @size == "xlarge" && slot_assigned?(:default),
        "p-1": @size == "xsmall" && !slot_assigned?(:default),
        "p-1": @size == "small" && !slot_assigned?(:default),
        "p-2": @size == "medium" && !slot_assigned?(:default),
        "p-3": @size == "large" && !slot_assigned?(:default),
        "p-4": @size == "xlarge" && !slot_assigned?(:default),
        "w-full": @full_width,
        "opacity-30": @disabled
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
      <Icon name={@left_icon} class={icon_class(@size)} :if={@left_icon} />
      <#slot />
      <Icon name={@right_icon} class={icon_class(@size)} :if={@right_icon} />
      <div class="bg-transparent hover:bg-primary-hover absolute inset-0 rounded" />
    </button>
    """
  end

  defp phx_val_tag(nil, _), do: []

  defp phx_val_tag(name, value) do
    # credo:disable-for-next-line Credo.Check.Warning.UnsafeToAtom
    key = String.to_atom("phx-value-#{name}")
    [{key, value}]
  end

  defp icon_class("xsmall"), do: "h-4 w-4"
  defp icon_class("small"), do: "h-4 w-4"
  defp icon_class("medium"), do: "h-6 w-6"
  defp icon_class("large"), do: "h-6 w-6"
  defp icon_class("xlarge"), do: "h-6 w-6"
end
