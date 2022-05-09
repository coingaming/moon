defmodule Moon.Components.Chip do
  @moduledoc false

  use Moon.StatelessComponent
  alias Moon.Icon

  slot default

  prop id, :string
  prop class, :string
  prop left_icon, :string
  prop right_icon, :string
  prop on_click, :event
  prop value, :string
  prop active, :boolean, default: false
  prop active_class, :string, default: "text-bulma-100 bg-goku-120"
  prop inactive_class, :string, default: "text-trunks-100 bg-gohan-100"
  prop testid, :string
  prop size, :string, values: ["small", "medium"], default: "medium"
  prop is_stroke, :boolean, default: false
  prop icon_only, :string

  def render(assigns) do
    ~F"""
    <button
      id={@id}
      class={
        "flex justify-center items-center gap-2 rounded relative active:scale-90 transition-all",
        "hover:text-bulma-100 font-semibold #{@class} #{active_btn_class(@active, @active_class, @inactive_class)}",
        "text-sm h-8 px-3 py-2 leading-4": @size == "small" && slot_assigned?(:default),
        "text-sm h-10 px-4 py-2 leading-6": @size == "medium" && slot_assigned?(:default),
        "p-1 h-8 w-8": @size == "small" && !slot_assigned?(:default),
        "p-2 h-10 w-10": @size == "medium" && !slot_assigned?(:default),
        "shadow-border": @active,
        "hover:shadow-border": @is_stroke
      }
      data-size={@size}
      data-testid={@testid}
      :on-click={@on_click}
      {...phx_val_tag((@value && "click_value") || nil, @value)}
    >
      <Icon name={@left_icon} class={icon_class(@size)} :if={@left_icon && !@icon_only} />
      <Icon name={@icon_only} class={icon_class(@size)} :if={@icon_only} />
      <#slot :if={!@icon_only} />
      <Icon name={@right_icon} class={icon_class(@size)} :if={@right_icon && !@icon_only} />
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

  defp icon_class("small"), do: "h-4 w-4"
  defp icon_class("medium"), do: "h-6 w-6"

  defp active_btn_class(true, active_class, _), do: active_class
  defp active_btn_class(false, _, inactive_class), do: inactive_class
end
