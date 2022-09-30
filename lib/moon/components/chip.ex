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
  prop value_name, :string
  prop active, :boolean, default: false
  prop active_class, :string, default: ""
  prop inactive_class, :string, default: ""
  prop testid, :string
  prop size, :string, values: ["small", "medium"], default: "medium"
  prop is_stroke, :boolean, default: false
  prop icon_only, :string
  prop variant, :string, values: ["default", "ghost"], default: "default"

  def render(assigns) do
    ~F"""
    <button
      id={@id}
      class={
        "flex justify-center items-center rounded-moon-i-sm relative transition text-moon-14",
        "hover:text-piccolo-100 hover:bg-piccolo-100/[.12] #{@class} #{active_btn_class(@active, @active_class, @inactive_class)}",
        get_padding(@size, @left_icon, @right_icon, @icon_only),
        get_bg_color(@active, @variant),
        "h-8 w-8": @size == "small" && !slot_assigned?(:default),
        "h-10 w-10": @size == "medium" && !slot_assigned?(:default),
        "shadow-border": @is_stroke && @active,
        "hover:shadow-border": @is_stroke
      }
      data-size={@size}
      data-testid={@testid}
      :on-click={@on_click}
      {...phx_val_tag(@value_name || (@value && "click_value") || nil, @value)}
    >
      <Icon name={@left_icon} font_size="1.5rem" :if={@left_icon && !@icon_only} />
      <Icon name={@icon_only} font_size="1.5rem" :if={@icon_only} />
      <#slot :if={!@icon_only} />
      <Icon name={@right_icon} font_size="1.5rem" :if={@right_icon && !@icon_only} />
    </button>
    """
  end

  defp get_padding(size, left_icon, right_icon, icon_only) do
    if size == "medium" do
      if icon_only do
        "p-2 gap-2"
      else
        "py-2 gap-2 #{if left_icon, do: "pl-2", else: "pl-3"} #{if right_icon, do: "pr-2", else: "pr-3"}"
      end
    else
      if icon_only do
        "p-1 gap-1"
      else
        "py-1 gap-1 #{if left_icon, do: "pl-1", else: "pl-2"} #{if right_icon, do: "pr-1", else: "pr-2"}"
      end
    end
  end

  defp phx_val_tag(nil, _), do: []

  defp phx_val_tag(name, value) do
    # credo:disable-for-next-line Credo.Check.Warning.UnsafeToAtom
    key = String.to_atom("phx-value-#{name}")
    [{key, value}]
  end

  defp active_btn_class(true, active_class, _),
    do: "text-piccolo-100 bg-opacity-12 #{active_class}"

  defp active_btn_class(false, _, inactive_class),
    do: "text-bulma-100 bg-gohan-100 #{inactive_class}"

  defp get_bg_color(active, variant) do
    if variant == "default" do
      if active, do: "bg-piccolo-100", else: "bg-gohan-100"
    else
      "bg-transparent"
    end
  end
end
