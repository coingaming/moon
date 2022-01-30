defmodule Moon.Components.Button do
  @moduledoc false

  use Moon.StatelessComponent
  alias Moon.Icon

  prop href, :string
  prop variant, :string, values: ["fill", "outline", "link", "primary", "secondary", "tertiary"]
  prop size, :string, values: ["xsmall", "small", "medium", "large"], default: "small"
  prop mock_state, :string, values: ["active", "focus", "hover"]
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
      class={
        "flex justify-center items-center gap-2 py-2 rounded #{@class}",
        "border border-solid text-goten-100 border-piccolo-100 bg-piccolo-100 active:bg-piccolo-120 focus-within:bg-piccolo-120 hover:bg-piccolo-80":
          @variant in ["fill", "primary"],
        "border border-solid text-piccolo-80 border-beerus-100 hover:border-piccolo-80 active:border-piccolo-80 focus-within:border-piccolo-80":
          @variant in ["outline", "tertiary"],
        "text-trunks-100 hover:bg-hit-120 active:bg-hit-120 focus-within:bg-hit-120 hover:text-piccolo-80 active:text-piccolo-120 focus-within:text-piccolo-120":
          @variant in ["link", "secondary"],
        "text-xs h-8 px-3 leading-4": @size == "xsmall",
        "text-sm h-10 px-4 leading-6": @size == "small",
        "text-base h-12 px-5": @size == "medium",
        "text-lg h-14 px-6": @size == "large",
        "w-full": @full_width,
        "opacity-30": @disabled
      }
      disabled={@disabled}
      type={@type}
      data-size={@size}
      data-testid={@testid}
      :on-click={@on_click}
      :values={@values}
      {...phx_val_tag(@value_name || (@value && "click_value") || nil, @value)}
    >
      <Icon name={@left_icon} class={icon_class(@size)} :if={@left_icon} />
      <#slot />
      <Icon name={@right_icon} class={icon_class(@size)} :if={@right_icon} />
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
  defp icon_class("small"), do: "h-5 w-5"
  defp icon_class("medium"), do: "h-6 w-6"
  defp icon_class("large"), do: "h-7 w-7"
end
